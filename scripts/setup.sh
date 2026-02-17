
#!/bin/bash


ssh-keygen 

for host in node-1 node-2 server; do
	ssh-copy-id root@${host}
done

