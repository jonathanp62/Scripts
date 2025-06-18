#!/usr/bin/env bash

# @(#)Install-Jetty-Libraries.sh	0.1.0	03/29/2016
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2016-03-29 10:09:45 -0400 (Tue, 29 Mar 2016) $
# @revision     $LastChangedRevision: 3996 $

# Usage:
#       Install-Jetty-LIbraries.sh

mvn install:install-file -Dfile=${HOME}/NetBeans-Libraries/jaxrs-r1/lib/jersey-container-servlet-core.jar -DgroupId=org.glassfish.jersey.container -DartifactId=jersey-container-servlet-core -Dversion=2.22.2 -Dpackaging=jar -DcreateChecksum=true

if [ "$?" -ne 0 ]
then
	exit 1
fi

mvn install:install-file -Dfile=${HOME}/NetBeans-Libraries/jaxrs-r1/api/javax.ws.rs-api-2.0.1.jar -DgroupId=javax.ws.rs -DartifactId=javax.ws.rs-api -Dversion=2.0.1 -Dpackaging=jar -DcreateChecksum=true

if [ "$?" -ne 0 ]
then
	exit 1
fi

mvn install:install-file -Dfile=${HOME}/NetBeans-Libraries/eclipse-persistence/org.eclipse.persistence.moxy-2.6.2.jar -DgroupId=org.eclipse.persistence -DartifactId=org.eclipse.persistence.moxy -Dversion=2.6.2 -Dpackaging=jar -DcreateChecksum=true
