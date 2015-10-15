git clone https://${GH_TOKEN}@github.com/decentral-exchange/wallet
cp -R bitshares-2-ui/dist/* wallet/
cd wallet
git config user.email "info@decentral.exchange"
git config user.name "Decentral Exchange"
git add -A .
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push --quiet origin master > /dev/null 2>&1 
