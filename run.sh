IMG=ba87dd0123ca

docker run -dt  \
   --ulimit nofile=1024:1024 \
   --net host \
   --privileged \
   -v /var/run/dbus:/var/run/dbus \
   -v /dev/bus/usb:/dev/bus/usb \
   -v $(pwd)/config:/etc/cups/ \
  --name cups-mfc7440n \
  ${IMG}

#   -p 631:631 \
# --restart unless-stopped 