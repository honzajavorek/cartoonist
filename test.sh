rm -rf ./build
cp -R ./test ./build

for file in ./build/*.jpg
do
  echo Converting "$file"
  ./cartoonist.sh "$file"
done
