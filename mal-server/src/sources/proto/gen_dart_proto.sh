
script_dir=$(cd `dirname $0`; pwd)
host=`uname`
extra_path=$script_dir/tools/darwin

if [ "$host" = "Linux" ]; then
  extra_path=$script_dir/tools/linux
fi
protoc_path=/Users/wangyaqiang/Documents/ownerproj/mal-server/tools/macos/grpc/cmake/build/out/bin/protoc
proto_in_dir=$script_dir
dart_out_dir=/Users/wangyaqiang/Documents/ownerproj/mal_client/lib/rpc_client/proto_gen
#ts_out_dir=$script_dir/../frontend/packages/editor-kernel/src/protocol_gen
#py_proto_dir=$script_dir/../backend/sdk/py-editor-kernel/ks_editor_kernel/pb
#py_out_dir=$script_dir/../backend/sdk/py-editor-kernel/

# 生成 Dart protobuf 文件
$protoc_path  $proto_in_dir/*.proto -I$proto_in_dir  --dart_out=$dart_out_dir 
if [ $? -ne 0 ]; then
  echo 'protoc Dart generation failed'
  exit 1
fi

echo 'Proto generation completed successfully'
