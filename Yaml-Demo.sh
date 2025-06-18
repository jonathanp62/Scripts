#!/usr/bin/env bash

# @(#)Yaml-Demo.sh	0.1.0	10/26/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2015-10-27 10:17:40 -0400 (Tue, 27 Oct 2015) $
# @revision     $LastChangedRevision: 3125 $
#
# Usage:
#	Yaml-Demo.sh

CONTACT=${HOME}/NetBeans-Projects/YAML-Demo/contact.yml
REQUEST=${HOME}/NetBeans-Projects/YAML-Demo/request.yml

CLASSPATH=\
${HOME}/NetBeans-Applications/yaml-demo-0.1.0.jar:\
${HOME}/NetBeans-Libraries/snakeyaml-1.16.jar:\
${HOME}/NetBeans-Libraries/yamlbeans-1.09/yamlbeans-1.09.jar

CLASSNAME=net.jonathan.demo.yaml.Main

java -cp "${CLASSPATH}" -Dapp.contact.file=${CONTACT} -Dapp.request.file=${REQUEST} ${CLASSNAME}
