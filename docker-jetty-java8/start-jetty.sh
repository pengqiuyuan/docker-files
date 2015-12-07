#!/bin/sh

if [ -d /etc/jetty/webapps ];
then
	echo "Copying jetty wars"
	rm -rf /opt/jetty/webapps/*
	cp /etc/jetty/webapps/* /opt/jetty/webapps
fi

# If custom Jetty config folder mapped copy files into jetty/etc/
if [ -d /etc/jetty/config ];
then
	echo "Copying custom config"
	cp /etc/jetty/config/* /opt/jetty/etc/
fi

# If custom Jetty context folder mapped copy files into jetty/contexts/
if [ -d /etc/jetty/contexts ];
then
	echo "Copying custom Contexts"
	rm -rf /opt/jetty/contexts/*
	cp /etc/jetty/contexts/* /opt/jetty/contexts/
fi


# If check if custom init script exists
if [ -e /etc/jetty/init.sh ];
then
	echo "Running custom init script"
	chmod +x /etc/jetty/init.sh
	/etc/jetty/init.sh
fi


/opt/jetty/bin/jetty.sh restart