rm -rf ./build
cp -R ./test ./build

for file in ./build/*.jpg
do
  ./cartoonist.sh "$file"
done
