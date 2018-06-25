#/bin/sh
git clone -b monolith https://github.com/express42/reddit.git 
cd reddit
bundle install
cat <<EOF> /etc/systemd/system/puma-reddit.service
[Unit]
Description=Puma HTTP Server
After=network.target

[Service]
Type=simple
User=appuser
WorkingDirectory=/home/appuser/reddit/
ExecStart=/usr/local/bin/puma --pidfile /tmp/puma-reddit.pid
ExecStop=/usr/local/bin/pumactl --pidfile /tmp/puma-reddit.pid stop
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable puma-reddit
systemctl start puma-reddit

