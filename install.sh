npm install -g coffee-script
npm install -g webpack

git clone https://github.com/bitshares/bitshares-2-ui

cd bitshares-2-ui
for I in cli dl web; do cd $I; npm install; cd ..; done;

cd ..
