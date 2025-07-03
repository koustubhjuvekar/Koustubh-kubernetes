sudo swapoff -a
sleep 5
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo systemctl enable --now kubelet

kubeadm init
sleep 10

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=/etc/kubernetes/admin.conf  
sleep 5

curl https://raw.githubusercontent.com/projectcalico/calico/v3.30.2/manifests/calico.yaml -O
kubectl apply -f calico.yaml
sleep 5

kubeadm token create --print-join-command

