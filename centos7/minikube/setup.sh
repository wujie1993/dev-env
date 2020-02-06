#!/bin/sh

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum install -y kubectl-1.15.5

yum install -y https://storage.googleapis.com/minikube/releases/latest/minikube-1.3.1.rpm

systemctl stop firewalld
systemctl disable firewalld

swapoff -a && sed -i '/ swap / s/^/#/' /etc/fstab

minikube start --vm-driver=none --kubernetes-version v1.15.5 --extra-config=apiserver.enable-admission-plugins="NamespaceLifecycle,LimitRanger,ServiceAccount,PersistentVolumeLabel,DefaultStorageClass,DefaultTolerationSeconds,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,ResourceQuota" -v 10 --logtostderr --image-repository="registry.cn-hangzhou.aliyuncs.com/google_containers"

minikube addons enable ingress

docker pull quay.azk8s.cn/kubernetes-ingress-controller/nginx-ingress-controller:0.25.0

docker tag quay.azk8s.cn/kubernetes-ingress-controller/nginx-ingress-controller:0.25.0  quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.25.0

kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default
minikube dashboard --url=true
