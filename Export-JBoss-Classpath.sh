#!/usr/bin/env bash

# @(#)Export-JBoss-Classpath.sh	0.1.0	10/29/2014
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
# @updated      $LastChangedDate: 2014-10-29 14:00:49 -0400 (Wed, 29 Oct 2014) $
# @revision     $LastChangedRevision: 1973 $
#
# Set all of the jars in the JBoss Application Server into an environment variable named J2EE_CLASSPATH.
#
# Usage:
#       . Export-JBoss-Classpath.sh

if [ -z "${JBOSS_HOME}" ]
then
        echo "Environment variable JBOSS_HOME was not found in the environment."
        exit 1
fi

JBOSS_LIBS_HOME=${JBOSS_HOME}/modules/system/layers/base

export J2EE_CLASSPATH=\
${JBOSS_LIBS_HOME}/javax/activation/api/main/activation-1.1.1-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/annotation/api/main/jboss-annotations-api_1.1_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/ejb/api/main/jboss-ejb-api_3.1_spec-1.0.2.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/el/api/main/jboss-el-api_2.2_spec-1.0.4.Final-redhat-1.jar:\
${JBOSS_LIBS_HOME}/javax/enterprise/api/main/cdi-api-1.0-SP4-redhat-4.jar:\
${JBOSS_LIBS_HOME}/javax/enterprise/deploy/api/main/jboss-jad-api_1.2_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/faces/api/1.2/jsf-api-1.2_15-b01-redhat-11.jar:\
${JBOSS_LIBS_HOME}/javax/faces/api/main/jboss-jsf-api_2.1_spec-2.1.28.Final-redhat-1.jar:\
${JBOSS_LIBS_HOME}/javax/inject/api/main/javax.inject-1.redhat-4.jar:\
${JBOSS_LIBS_HOME}/javax/interceptor/api/main/jboss-interceptors-api_1.1_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/jms/api/main/jboss-jms-api_1.1_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/jws/api/main/jsr181-api-1.0-MR1-redhat-6.jar:\
${JBOSS_LIBS_HOME}/javax/mail/api/main/mail-1.4.5-redhat-1.jar:\
${JBOSS_LIBS_HOME}/javax/management/j2ee/api/main/jboss-j2eemgmt-api_1.1_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/persistence/api/main/hibernate-jpa-2.0-api-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/resource/api/main/jboss-connector-api_1.6_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/rmi/api/main/jboss-rmi-api_1.0_spec-1.0.4.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/security/auth/message/api/main/jboss-jaspi-api_1.0_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/security/jacc/api/main/jboss-jacc-api_1.4_spec-1.0.3.Final-redhat-1.jar:\
${JBOSS_LIBS_HOME}/javax/servlet/api/main/jboss-servlet-api_3.0_spec-1.0.2.Final-redhat-1.jar:\
${JBOSS_LIBS_HOME}/javax/servlet/jsp/api/main/jboss-jsp-api_2.2_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/servlet/jstl/api/main/jboss-jstl-api_1.2_spec-1.0.6.Final-redhat-1.jar:\
${JBOSS_LIBS_HOME}/javax/transaction/api/main/jboss-transaction-api_1.1_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/validation/api/main/validation-api-1.0.0.GA-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/ws/rs/api/main/jaxrs-api-3.0.9.Final.jar:\
${JBOSS_LIBS_HOME}/javax/ws/rs/api/main/jboss-jaxrs-api_1.1_spec-1.0.1.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/wsdl4j/api/main/wsdl4j-1.6.3.redhat-1.jar:\
${JBOSS_LIBS_HOME}/javax/xml/bind/api/main/jboss-jaxb-api_2.2_spec-1.0.4.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/xml/registry/api/main/jboss-jaxr-api_1.0_spec-1.0.2.Final-redhat-2.jar:\
${JBOSS_LIBS_HOME}/javax/xml/rpc/api/main/jboss-jaxrpc-api_1.1_spec-1.0.1.Final-redhat-3.jar:\
${JBOSS_LIBS_HOME}/javax/xml/soap/api/main/jboss-saaj-api_1.3_spec-1.0.3.Final-redhat-1.jar:\
${JBOSS_LIBS_HOME}/javax/xml/ws/api/main/jboss-jaxws-api_2.2_spec-2.0.2.Final-redhat-1.jar:\
${JBOSS_LIBS_HOME}/org/hibernate/main/hibernate-core-4.2.14.SP1-redhat-1.jar:\
${JBOSS_LIBS_HOME}/org/hibernate/main/hibernate-entitymanager-4.2.14.SP1-redhat-1.jar:\
${JBOSS_LIBS_HOME}/org/hibernate/main/hibernate-infinispan-4.2.14.SP1-redhat-1.jar

echo "Exported J2EE_CLASSPATH: ${J2EE_CLASSPATH}"
