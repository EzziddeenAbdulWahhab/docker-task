returned_lines=$(docker run ezz/task-client:prod yum list installed | grep -e "httpd.x86_64" -e "httpd-tools.x86_64" | wc -l)
if [ $returned_lines == "2" ]; then 
 echo "true"
else 
 echo "false"
fi
