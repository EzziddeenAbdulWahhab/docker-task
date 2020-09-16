docker build ./../docker-files/server/ -t ezz/task-server:prod
docker run -d --name task-server ezz/task-server:prod
