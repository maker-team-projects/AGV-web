cmd_Release/obj.target/addon/hello.o := g++ -o Release/obj.target/addon/hello.o ../hello.cc '-DNODE_GYP_MODULE_NAME=addon' '-DUSING_UV_SHARED=1' '-DUSING_V8_SHARED=1' '-DV8_DEPRECATION_WARNINGS=1' '-D_GLIBCXX_USE_CXX11_ABI=1' '-D_LARGEFILE_SOURCE' '-D_FILE_OFFSET_BITS=64' '-D__STDC_FORMAT_MACROS' '-DOPENSSL_NO_PINSHARED' '-DOPENSSL_THREADS' '-DBUILDING_NODE_EXTENSION' -I/home/dysprosium/.cache/node-gyp/22.12.0/include/node -I/home/dysprosium/.cache/node-gyp/22.12.0/src -I/home/dysprosium/.cache/node-gyp/22.12.0/deps/openssl/config -I/home/dysprosium/.cache/node-gyp/22.12.0/deps/openssl/openssl/include -I/home/dysprosium/.cache/node-gyp/22.12.0/deps/uv/include -I/home/dysprosium/.cache/node-gyp/22.12.0/deps/zlib -I/home/dysprosium/.cache/node-gyp/22.12.0/deps/v8/include  -fPIC -pthread -Wall -Wextra -Wno-unused-parameter -m64 -O3 -fno-omit-frame-pointer -fno-rtti -fno-exceptions -fno-strict-aliasing -std=gnu++17 -MMD -MF ./Release/.deps/Release/obj.target/addon/hello.o.d.raw   -c
Release/obj.target/addon/hello.o: ../hello.cc \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/node.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/cppgc/common.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8config.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-array-buffer.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-local-handle.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-handle-base.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-internal.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8config.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-object.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-maybe.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-persistent-handle.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-weak-callback-info.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-primitive.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-data.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-value.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-traced-handle.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-container.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-context.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-snapshot.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-isolate.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-callbacks.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-promise.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-debug.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-script.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-memory-span.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-message.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-embedder-heap.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-function-callback.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-microtask.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-statistics.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-unwinder.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-embedder-state-scope.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-date.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-exception.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-extension.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-external.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-function.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-template.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-initialization.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-platform.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-source-location.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-json.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-locker.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-microtask-queue.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-primitive-object.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-proxy.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-regexp.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-typed-array.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-value-serializer.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-version.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-wasm.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/node_version.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/node_api.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/js_native_api.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/js_native_api_types.h \
 /home/dysprosium/.cache/node-gyp/22.12.0/include/node/node_api_types.h
../hello.cc:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/node.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/cppgc/common.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8config.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-array-buffer.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-local-handle.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-handle-base.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-internal.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8config.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-object.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-maybe.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-persistent-handle.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-weak-callback-info.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-primitive.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-data.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-value.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-traced-handle.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-container.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-context.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-snapshot.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-isolate.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-callbacks.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-promise.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-debug.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-script.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-memory-span.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-message.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-embedder-heap.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-function-callback.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-microtask.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-statistics.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-unwinder.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-embedder-state-scope.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-date.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-exception.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-extension.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-external.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-function.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-template.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-initialization.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-platform.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-source-location.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-json.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-locker.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-microtask-queue.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-primitive-object.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-proxy.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-regexp.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-typed-array.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-value-serializer.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-version.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/v8-wasm.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/node_version.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/node_api.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/js_native_api.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/js_native_api_types.h:
/home/dysprosium/.cache/node-gyp/22.12.0/include/node/node_api_types.h:
