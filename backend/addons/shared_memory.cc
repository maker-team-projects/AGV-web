#include <node.h>
#include <iostream>

#include <sys/shm.h>
#include <sys/sem.h>
#include <unistd.h>
#include <cstring>
#include <csignal>
#include <cstdlib>
#include <stdio.h>

using namespace std;

using namespace v8;
using v8::FunctionCallbackInfo;
using v8::Isolate;
using v8::Local;
using v8::NewStringType;
using v8::Object;
using v8::String;
using v8::Value;

#define MEMORY_N 1
#define SHM_SIZE 2097152

union semun_arg {
    int val;
    struct semid_ds *buf;
    ushort *array;
};

struct SharedData {
    int seq_number;
    int valid;  // 상태 플래그 추가
    char message[SHM_SIZE - sizeof(int) * 2];
};

void Settings(int index);
char *Data_receive(int index);
bool is_base64( unsigned char c );
string base64_decode(string const& encoded_string);
void Exit(int signum);
void Exit();

SharedData *shared_mem[MEMORY_N];
int shm_key[MEMORY_N] = {1232};
int sem_key[MEMORY_N] = {5679};
int shmid[MEMORY_N], semid[MEMORY_N];
int seq[MEMORY_N] = {0,};
int last_seq_number[MEMORY_N] = {-1,};
union semun_arg shared_arg[MEMORY_N];
struct sembuf p_op[MEMORY_N], v_op[MEMORY_N];
static const string base64_chars =
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
"abcdefghijklmnopqrstuvwxyz"
"0123456789+/";

void Settings(const FunctionCallbackInfo<Value>& args){
    Isolate* isolate = args.GetIsolate();

    if (args.Length() < 1) {
        // Throw an Error that is passed back to JavaScript
        isolate->ThrowException(Exception::TypeError(
            String::NewFromUtf8(isolate,
                                "Wrong number of arguments").ToLocalChecked()));
        return;
    }

    // Check the argument types
    if (!args[0]->IsNumber()) {
        isolate->ThrowException(Exception::TypeError(
            String::NewFromUtf8(isolate,
                                "Wrong arguments").ToLocalChecked()));
        return;
    }

    int index = (int)args[0].As<Number>()->Value();

    shmid[index] = shmget(shm_key[index], SHM_SIZE, IPC_CREAT | 0666);
    if (shmid[index] < 0) {
        perror("shmget");
        exit(1);
    }
    shared_mem[index] = (SharedData *)shmat(shmid[index], NULL, 0);
    if (shared_mem[index] == (SharedData *)-1) {
        perror("shmat");
        exit(1);
    }

    // Semaphore 생성 및 초기화
    semid[index] = semget(sem_key[index], 1, IPC_CREAT | 0666);
    if (semid[index] < 0) {
        perror("semget");
        exit(1);
    }

    shared_arg[index].val = 1;
    if (semctl(semid[index], 0, SETVAL, shared_arg[index]) < 0) {
        perror("semctl");
        exit(1);
    }

    // P 연산 (Wait, Mutex 획득)
    p_op[index].sem_num = 0;
    p_op[index].sem_op = -1; // decrement the semaphore
    p_op[index].sem_flg = SEM_UNDO;

    // V 연산 (Signal, Mutex 해제)
    v_op[index].sem_num = 0;
    v_op[index].sem_op = 1; // increment the semaphore
    v_op[index].sem_flg = SEM_UNDO;
}

void Data_receive(const FunctionCallbackInfo<Value>& args){
    Isolate* isolate = args.GetIsolate();

    if (args.Length() < 1) {
        // Throw an Error that is passed back to JavaScript
        isolate->ThrowException(Exception::TypeError(
            String::NewFromUtf8(isolate,
                                "Wrong number of arguments").ToLocalChecked()));
        return;
    }

    // Check the argument types
    if (!args[0]->IsNumber()) {
        isolate->ThrowException(Exception::TypeError(
            String::NewFromUtf8(isolate,
                                "Wrong arguments").ToLocalChecked()));
        return;
    }

    int index = (int)args[0].As<Number>()->Value();

    if (semop(semid[index], &p_op[index], 1) < 0) {
        perror("semop P");
        exit(1);
    }

    if (shared_mem[index]->valid == 1 && shared_mem[index]->seq_number != last_seq_number[index]) {
        last_seq_number[index] = shared_mem[index]->seq_number;
        shared_mem[index]->valid = 0; 
    }

    // V 연산 수행
    if (semop(semid[index], &v_op[index], 1) < 0) {
        perror("semop V");
        exit(1);
    }

    args.GetReturnValue().Set(String::NewFromUtf8(isolate, shared_mem[index]->message).ToLocalChecked());
}

void Exit(const FunctionCallbackInfo<Value>& args){
    Isolate* isolate = args.GetIsolate();

    if (args.Length() < 1) {
        // Throw an Error that is passed back to JavaScript
        isolate->ThrowException(Exception::TypeError(
            String::NewFromUtf8(isolate,
                                "Wrong number of arguments").ToLocalChecked()));
        return;
    }

    // Check the argument types
    if (!args[0]->IsNumber()) {
        isolate->ThrowException(Exception::TypeError(
            String::NewFromUtf8(isolate,
                                "Wrong arguments").ToLocalChecked()));
        return;
    }

    int signum = (int)args[0].As<Number>()->Value();

    printf("Program Exit\n");
    for (int index = 0; index < MEMORY_N; index++){
        if (shmdt(shared_mem[index]) < 0) {
            perror("shmdt");
            exit(1);
        }
        if (shmctl(shmid[index], IPC_RMID, NULL) < 0) {
            perror("shmctl");
            exit(1);
        }
        if (semctl(semid[index], 0, IPC_RMID, shared_arg) < 0) {
            perror("semctl IPC_RMID");
            exit(1);
        }
    }
    exit(signum);
}

void Initialize(Local<Object> exports) {
    NODE_SET_METHOD(exports, "init", Settings);
    NODE_SET_METHOD(exports, "read", Data_receive);
    NODE_SET_METHOD(exports, "exit", Exit);
}

NODE_MODULE(NODE_GYP_MODULE_NAME, Initialize)