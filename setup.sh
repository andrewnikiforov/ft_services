minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2		#
docker pull metallb/controller:v0.8.2	#
docker build -t nginx-image ./srcs/nginx/
kubectl apply -f ./srcs/metallb/configmap.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml