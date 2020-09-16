server_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' task-server)
server_url='http://'"$server_ip"':8899'
docker build --build-arg repo_url=$server_url ./../docker-files/client/ -t ezz/task-client:prod  
