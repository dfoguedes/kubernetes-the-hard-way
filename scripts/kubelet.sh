KUBE_VERSION=v1.34.0
curl -fsSLO "https://dl.k8s.io/${KUBE_VERSION?}/bin/linux/amd64/kubelet" 
sudo install -m 755 kubelet /usr/local/bin
sudo wget -O /etc/systemd/system/kubelet.service https://labs.iximiuz.com/content/files/courses/kubernetes-the-very-hard-way-0cbfd997/02-worker-node/02-kubelet/__static__/kubelet.service?v=1771369103


# Configure kubelet
cat <<EOF | sudo tee /var/lib/kubelet/config.d/99-cri.conf
apiVersion: kubelet.config.k8s.io/v1beta1
kind: KubeletConfiguration
containerRuntimeEndpoint: unix:///var/run/containerd/containerd.sock
cgroupDriver: systemd
EOF


sudo systemctl daemon-reload
sudo systemctl enable --now kubelet

cat <<EOF | sudo tee /var/lib/kubelet/config.yaml
apiVersion: kubelet.config.k8s.io/v1beta1
kind: KubeletConfiguration
authentication:
  anonymous:
    enabled: true
  webhook:
    enabled: false
authorization:
  mode: AlwaysAllow
EOF


sudo systemctl restart kubelet


curl -k https://localhost:10250/healthz
