FROM debian:stretch
MAINTAINER Jacopo Mauro

RUN apt-get update && \
	apt-get install -y \
		wget \
		unzip \
		openjdk-8-jdk && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir /tool && \
	cd /tool && \
	wget http://ima.udg.edu/recerca/lap/fzn2smt/version/fzn2smt-2-0-02.zip && \
	unzip fzn2smt-2-0-02.zip && \
	mv fzn2smt-2-0-02 fzn2smt && \
  rm -rf fzn2smt-2-0-02.zip && \
  cd fzn2smt && \
  wget http://central.maven.org/maven2/org/antlr/antlr-runtime/3.2/antlr-runtime-3.2.jar
	
ENV CLASSPATH "$CLASSPATH:/tool/fzn2smt:/tool/fzn2smt/antlr-runtime-3.2.jar"

