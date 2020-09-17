docker rm -f $(docker ps -a | awk '{if($2=="ezz/task-client:prod")printf $1 " " }')
docker rmi -f ezz/task-client:prod  
server_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' task-server)
server_url='http://'"$server_ip"':8899'
docker build --build-arg repo_url=$server_url /root/docker-task/client -t ezz/task-client:prod  
