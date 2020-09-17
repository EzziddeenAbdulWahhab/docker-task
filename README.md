# Docker-task
This is a docker training project. It revolves around the creation of two containers. One is to act as a server and one is to act as a client. The server serves a yum repository with httpd in it 
to the client and the client installs that package from it. Both images are based on centos 7 and both have shell scripts to manage them.

<h3>Server container</h3>
The server container has httpd installed and running on it and a yum repository set up in that httpd server's public directory with httpd's rpms ready to be installed from it. The server listens on port 8899 instead of 80 for connections and is only exposed to the docker bridge internal network.
<h3>Client container</h3>
The client is meant to install the httpd package from the server during its docker image build phase. It adds the repository, gets its metadata and then installs the package from it.
<h3>Installation</h3>
To be able to use this project , you must first have docker installed on your machine https://docs.docker.com/get-docker/.</br>
To run this project locally , clone it then run the following scripts in the following order:
<ol>
<li>/server/server-script.sh</li>
<li>/client/client-script.sh</li>
<li>/client/verification.sh</li>
</ol>
And everything should be up and running. Below , the purpose of every script is explained.
<h4>server-script.sh</h4>
This script is responsible for building the server image and running a container from it. This also includes removing old server images and containers using them.
The steps for building the image are simple , they aim to achieve the following:
<ul>
<li>Install all necessary packages for the image , these include the httpd packages and some yum utilities</li>
<li>Create the repository on part of the installed packages</li>
<li>Run the httpd server on port 8899 instead of 80 with the repository in its public directory</li>
</ul>
<h4>client-script.sh</h4>
This script is responsible for building the client image , it does not run a container from it. This also includes removing old server images and containers using them. It should be noted that this script is also responsible for 
getting the IP address of the running server container and passing it to the docker build process as an argument.</br>
For the client image the following is necessary:
<ul>
<li>Install some yum utilities</li>
<li>Add the server container repository</li>
<li>Install httpd from the server container</li>
</ul>
<h4>verification.sh</h4>
This final script is responsible for verifying that the client image has the httpd package installed on it, it runs a simple yum list command and scans the output for the required httpd packages.
It returns "true" if the package was successfully installed and "false" if it wasn't.
