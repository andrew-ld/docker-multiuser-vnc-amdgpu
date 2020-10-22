![](https://i.ibb.co/PW1gc3T/aaaaaaaa.png)

# dependencies
- [local-persist](https://github.com/MatchbookLab/local-persist)
- vncpasswd
- openssl

# deploy steps
- create a vnc login password  
`vncpasswd private/passwd`

- create x509 certificate inside /private/cert  
 `openssl  req  -x509  -newkey  rsa:4096  -keyout  key.pem  -out  cert.pem  -nodes  -days  365  -subj  '/CN=$HOSTNAME'`

- create post_install.sh inside /private for add users / packages  

- build docker container  
`docker-compose build`

- start docker container  
`docker-compose up --force-recreate`
 
