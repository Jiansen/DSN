#Please put this into the example/cifar-10 folder
#!/usr/bin/env sh
# This script converts the cifar data into leveldb format.

EXAMPLES=../../build/examples/cifar10
DATA=../../data/cifar10_gcn
TOOLS=../../build/tools

echo "Creating leveldb..."

rm -rf cifar10-leveldb
mkdir cifar10-leveldb

$EXAMPLES/convert_cifar_float_data.bin $DATA ./cifar10-leveldb

echo "Computing image mean..."

$TOOLS/compute_image_mean.bin ./cifar10-leveldb/cifar-train-leveldb mean.binaryproto

echo "Done."
