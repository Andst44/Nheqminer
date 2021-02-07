FROM ubuntu

MAINTAINER stephane.andre1985@gmail.com

RUN apt-get update && \
	apt-get install -y git cmake build-essential libboost-all-dev && \
	git clone -b Linux https://github.com/nicehash/nheqminer.git && \
	cd nheqminer/cpu_xenoncat/Linux/asm/ && \
	sh assemble.sh && \
	cd ../../../Linux_cmake/nheqminer_cpu && \
	cmake . && \
	make -j $(nproc) && \
	cp nheqminer_cpu /bin && \
	./nheqminer_cpu -h

ENTRYPOINT ["nheqminer_cpu"]
