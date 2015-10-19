
## Get wallet 
git clone https://${GH_TOKEN}@github.com/decentral-exchange/wallet
cp -R bitshares-2-ui/web/dist/* wallet/

## Update Wallet
cd wallet
git config user.email "info@decentral.exchange"
git config user.name "Decentral Exchange"
git add -A .
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push --quiet origin master > /dev/null 2>&1 

## Get webpage
git clone https://${GH_TOKEN}@github.com/decentral-exchange/decentral-exchange.github.io
cd decentral-exchange.github.io/

## Update webpage
hash=$(tail -n1 ~/ipfs.log | awk -F" " '{print $2}')
FILE="$(date +%s).md"
cat <<EOF > $FILE
---
hash: $hash
date: $(date)
---
EOF
git add -A .
git commit -am "[version] $hash"
git push --quiet origin master > /dev/null 2>&1 
