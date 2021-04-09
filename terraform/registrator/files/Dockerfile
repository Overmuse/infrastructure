# Version:0.0.1

FROM julia:latest

# install GIT
RUN apt-get update; apt-get install git build-essential apt-utils -y --no-install-recommends

RUN useradd -ms /bin/bash registrator

USER registrator
WORKDIR /home/registrator

RUN julia -e 'using Pkg; pkg"add https://github.com/JuliaRegistries/Registrator.jl.git; precompile"'
ADD . /home/registrator
