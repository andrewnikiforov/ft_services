#echo -ne "\033[32m""Enter your name: "
#read name
#echo "Hello $name, welcome to my FT_SERVICES"
#echo -e "\033[33m""=======Let's set up the project!=======\n"
#echo -e "\033[32m""=======At first start minikube in virtualbox. It start for same time. Keep calm and ask the questions=======\n""\033[37m"
minikube start --vm-driver=virtualbox
#echo -e "\033[32m""Yeah! Minikube started!\n"
#echo -ne "\033[31m""Press Enter if we can go to next part"
#read y
#echo -e "\033[33m""Let's lok for it's addons\n""\033[37m"
#minikube addons list
#echo -e "\033[33m""We need to enable Metallb! Let's do it!\n""\033[37m"
minikube addons enable metallb
#echo -ne "\033[31m""Press Enter if we can go to next part""\033[37m"
#read y
#minikube addons list
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
#echo -e "\033[33m""At now we will build docker image for nginx.\n""\033[37m"
#echo -ne "\033[31m""Press Enter for it""\033[37m"
#read y
docker build -t nginx-image ./srcs/nginx/
docker build -t php-image ./srcs/php/
docker build -t wp-image ./srcs/wordpress/
#echo -e "\033[33m""And now we creat and start Load Balancer pod and service with nginx\n""\033[37m"
#echo -ne "\033[31m""Press Enter for it""\033[37m"	
#read y
kubectl apply -f ./srcs/metallb/configmap.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
#echo -e "\033[33m""At now we will build docker image for php.\n""\033[37m"
kubectl apply -f ./srcs/php/php.yaml
kubectl apply -f ./srcs/wordpress/wp.yaml
minikube dashboard
