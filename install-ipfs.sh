go version
go get -u github.com/ipfs/go-ipfs/cmd/ipfs

wget https://dist.ipfs.io/go-ipfs/v0.4.2/go-ipfs_v0.4.2_linux-amd64.tar.gz
tar zxf go-ipfs_*.tar.gz
export PATH=$PATH:$PWD/go-ipfs/

ipfs init
ipfs daemon --init &

sleep 10

ipfs cat /ipfs/QmVtU7ths96fMgZ8YSZAbKghyieq7AjxNdcqyVzxTt3qVe/readme 2>&1
