cmd_Release/obj.target/shm.node := g++ -o Release/obj.target/shm.node -shared -pthread -rdynamic -m64  -Wl,-soname=shm.node -Wl,--start-group Release/obj.target/shm/just_read.o -Wl,--end-group 
