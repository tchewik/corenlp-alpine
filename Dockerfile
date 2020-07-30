FROM openjdk:16-jdk-alpine

ENV PORT=9000

RUN apk add wget
RUN apk add unzip
RUN mkdir /server

RUN cd /server && wget http://nlp.stanford.edu/software/stanford-corenlp-4.1.0.zip
RUN unzip /server/stanford-corenlp-4.1.0.zip -d /server

RUN mv /server/stanford-corenlp-4.1.0 /server/corenlp

WORKDIR /server/corenlp

CMD java -mx10g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $PORT -timeout 150000 -parse.maxlen 100 -annotators "tokenize,ssplit,pos,lemma,ner,parse,depparse,natlog,coref,openie" 