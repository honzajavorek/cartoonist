FROM alpine:3.7

WORKDIR /cartoonist

RUN apk add --update --no-cache bash bc coreutils gawk grep imagemagick potrace sed wget

RUN mkdir lib
COPY dependencies/lib.txt lib.txt
RUN cat lib.txt | xargs -I {} wget -O ./lib/{} 'http://www.fmwconcepts.com/imagemagick/downloadcounter.php?scriptname={}&dirname={}'
RUN chmod +x ./lib/*

COPY cartoonist.sh .

ENTRYPOINT ["find", "/input", "-iname", "*.jpg", "-exec", "/cartoonist/cartoonist.sh", "{}", ";"]