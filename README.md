<h1>Kubernetes</h1>
<h2>Services in K8S:</h2><br>
1. Nodeport <br>
2. ClusterIP <br>
3. Load Balancer <br>
4. External Name <br><br>
Explanation:<br>
1. Load Balancer accepts external requests to domain sbi.com.<br><br>
2. Based on path (e.g., /login or /transaction), request forwarded to:<br><br>
   <t>NodePort 30001 → for login-service</t><br>
   <t>NodePort 30002 → for transaction-service</t><br><br>
3. NodePort (same on all nodes) forwards request to respective ClusterIP Service.<br><br>
4. ClusterIP Service uses label selectors to send request to any healthy Pod in the cluster, across nodes.<br><br>
5. kube-proxy running on each node handles this internal routing.<br><br>
<img width="1200" height="535" alt="Services in Kubernetes Basic Diagram drawio (2)" src="https://github.com/user-attachments/assets/4082386d-add6-4f0e-8f2e-3650358e378c" /> <br>



<img width="1731" height="992" alt="K8S Architecture drawio" src="https://github.com/user-attachments/assets/2c44735a-5321-469d-b0ec-a173a82e4f73" />
