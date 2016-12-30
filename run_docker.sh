#docker run -it -v `pwd`:/app negabaro2/hello_express_react_node /bin/bash 
docker rm -f `docker ps |grep hello_express_react_node | awk '{print $1}'`
docker run  -v `pwd`:/app -p 5000:5000 -p 5001:5001 --name hello_express_react_node negabaro2/hello_express_react_node 
