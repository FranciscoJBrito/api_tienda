#For deploy (Production)
FROM ruby:3.0-bullseye 
#For arch 64 Macbook Air M1 (Local)
#FROM arm64v8/ruby:3.0-bullseye 
# add user and permissions
RUN useradd -m -s /bin/bash developer
# create folder developer
RUN mkdir -p home/developer
# set folder
WORKDIR /home
# set permission to folder
RUN chown -R developer:developer developer
RUN chmod 755 developer
# set user 
USER developer
# create folder app
RUN mkdir -p /home/developer/app
# set permission to folder
RUN chown -R developer:developer /home/developer/app
RUN chmod 755 /home/developer/app
# use folder app
WORKDIR /home/developer/app
# copy files
COPY ./Gemfile .
COPY ./Gemfile.lock .
# install gems
RUN bundle install
# copy the main app
COPY ./ .
# expose port
EXPOSE 3000
# run server
ENTRYPOINT [ "./entrypoints/docker-entrypoints.sh" ]
USER root
# Otorga permisos de ejecución al script de entrada
RUN chmod +x entrypoints/docker-entrypoints.sh