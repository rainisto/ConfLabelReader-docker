FROM ubuntu:jammy
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y git cmake apt-utils build-essential tstools

RUN git clone https://github.com/rwl/exip.git
RUN git clone https://github.com/jimcavoy/ConfLabelReader.git
RUN git clone https://github.com/jimcavoy/IReflx.git
RUN git clone https://github.com/jimcavoy/mp2tp.git

RUN cp ConfLabelReader/exipCMake/CMakeLists.txt exip/.
RUN cd exip && cmake . && cmake --build . && cmake --install .
RUN cd mp2tp && cmake . && cmake --build . && cmake --install .
RUN cd ConfLabelReader && cmake . && cmake --build . && cmake --install .
RUN cd IReflx && cmake . && cmake --build . && cmake --install .
