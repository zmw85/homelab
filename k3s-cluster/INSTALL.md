
K10500804bf0aa15c0fc44817c897735fbce377a57c1e2d2b4c5f6afdf06ce636d4::server:87110c48934ab011918d29e7179545ae

1. installation script on the first server node
```
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.26.9+k3s1 sh -s - server \
  --datastore-endpoint="mysql://k3s_db_user:xMH97fLHGLgANKrsyC99@tcp(127.0.0.1:3306)/k3s_cluster" \
  --write-kubeconfig-mode 644 --advertise-address 10.0.30.21
```

2. installation script on the second server node
```
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.26.9+k3s1 sh -s server --server https://10.0.30.21:6443 \
  --token K10500804bf0aa15c0fc44817c897735fbce377a57c1e2d2b4c5f6afdf06ce636d4::server:87110c48934ab011918d29e7179545ae \
  --datastore-endpoint="mysql://k3s_db_user:xMH97fLHGLgANKrsyC99@tcp(127.0.0.1:3306)/k3s_cluster" \
  --write-kubeconfig-mode 644 --advertise-address 10.0.30.22
```

3. installation script on the first agent node
```
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.26.9+k3s1 sh -s - agent \
  --server="https://10.0.30.21:6443" \
  --token K10500804bf0aa15c0fc44817c897735fbce377a57c1e2d2b4c5f6afdf06ce636d4::server:87110c48934ab011918d29e7179545ae
```

4. installation script on the second agent node
```
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.26.9+k3s1 sh -s - agent \
  --server="https://10.0.30.22:6443" \
  --token K10500804bf0aa15c0fc44817c897735fbce377a57c1e2d2b4c5f6afdf06ce636d4::server:87110c48934ab011918d29e7179545ae
```

5. install rancher
```
helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=rancher.home.io \
  --set replicas=1 \
  --set bootstrapPassword=<password> \
  --set privateCA=true \
  --set tls=external \
  --set privateCA=true
```