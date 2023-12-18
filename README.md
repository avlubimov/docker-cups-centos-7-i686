Docker image of the cups print server.


The image is built based on centos-7-i686 image, because the main purpose of this image is to install drivers for Brother mfc7440n printer, which are only available for i386.

The following problems are solved:

Yum hangs. The ulimit limit is set to ulimit -n 1024 to resolve.
Use this hack if you run yum in a container. See Dockerfile

cups is not installed completely because some of the web interface files in the cups package are marked as documentation and are not installed due to the nodocs option in yum.

Solution: sed -i '/nodocs/d' /etc/yum.conf
see Dockerfile

Cupsd does not start in docker version 23.  
The log says bind failed bad address
It is solved by setting --ulimit nofile=1024:1024 see run.sh

When creating a container, configuration and logs are available on the host.
Container serves host dbus and can work with usb printers.

If you create the file /etc/cups/START_CUPS_BROWSED in the container 
then not only cupsd but also cups-browsed will be started, which allows to use printers from other systems.

to build the image use the build.sh script
In the rpm directory put the drivers to be added to the system and they will be installed.

to create a container use the run.sh script
The cups and cups-browsed configs will appear in the config directory.
in the logs directory you will see the logs.

You can run the shell in the container with the exec.sh script.

Don't forget to set the root password in the container, otherwise you won't be able to add a printer in the web-interface. 

You can access cups at http://localhost:631.



Translated with DeepL.com (free version)
