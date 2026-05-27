#!/usr/bin/env bash

# @(#)Install-Jetty-Libraries.sh	0.1.0	03/29/2016
#
# MIT License
#
# Copyright (c) 2026 Jonathan M. Parker
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
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
