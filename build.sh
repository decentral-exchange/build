export GOPATH=$HOME/gopath
export PATH=$HOME/gopath/bin:$PATH

cd bitshares-2-ui/web
npm run-script build

if [ $? -eq 0 ]
then
	echo "Uploading to IPFS"
	$GOPATH/bin/ipfs add -r dist
fi
