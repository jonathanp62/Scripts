#!/usr/bin/env bash

# @(#)Yaml-Demo.sh	0.1.0	10/26/2015
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
