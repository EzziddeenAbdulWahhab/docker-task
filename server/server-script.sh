docker rm -f $(docker ps -a | awk '{if($2=="ezz/task-server:prod")printf $1 " " }')
docker rmi -f ezz/task-server:prod
docker build /root/docker-task/server -t ezz/task-server:prod
docker run -d --name task-server ezz/task-server:prod
