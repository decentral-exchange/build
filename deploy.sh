## Get wallet 
echo "Cloning wallet repo"
git clone https://${GH_TOKEN}@github.com/decentral-exchange/wallet
cp -R bitshares-2-ui/web/dist/* wallet/

## Update Wallet
echo "Pushing new wallet repo"
cd wallet
git config user.email "info@decentral.exchange"
git config user.name "Decentral Exchange"
git add -A .
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push --quiet origin master > /dev/null 2>&1 

## Get webpage
echo "Cloning webpage repo"
git clone https://${GH_TOKEN}@github.com/decentral-exchange/decentral-exchange.github.io

## Update webpage
cd decentral-exchange.github.io/
hash=$(tail -n1 ~/ipfs.log | awk -F" " '{print $2}')
FILE="$(date +%s).md"
cat <<EOF > $FILE
---
hash: $hash
date: $(date)
---

$(cat ~/ipfs.log)
EOF

cat $FILE

echo "Updating github webpage repository"
git config user.email "info@decentral.exchange"
git config user.name "Decentral Exchange"
git add -A .
git commit -am "[version] $hash / Travis #$TRAVIS_BUILD_NUMBER"
echo "Pushing new wallet repo"
git push --quiet origin master > /dev/null 2>&1 
