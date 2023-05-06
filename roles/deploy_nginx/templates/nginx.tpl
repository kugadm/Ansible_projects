server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name _;

        location / {
           try_files $uri $uri/ =404;
        }

location  /api/ {
    proxy_pass http://127.0.0.1:{{ app_ports }};
        }
}

