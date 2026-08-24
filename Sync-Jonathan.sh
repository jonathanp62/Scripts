#!/usr/bin/env zsh

# @(#)Sync-Jonathan.sh  0.3.4 	08/24/2026
# @(#)Sync-Jonathan.sh  0.3.3 	07/18/2026
# @(#)Sync-Jonathan.sh  0.3.2 	06/13/2026
# @(#)Sync-Jonathan.sh  0.3.0 	04/14/2026
# @(#)Sync-Jonathan.sh  0.2.16  09/30/2025
# @(#)Sync-Jonathan.sh  0.2.15  06/19/2025
# @(#)Sync-Jonathan.sh  0.2.14  04/22/2025
# @(#)Sync-Jonathan.sh  0.2.13  04/07/2025
# @(#)Sync-Jonathan.sh  0.2.12  03/23/2025
# @(#)Sync-Jonathan.sh  0.2.11  01/26/2025
# @(#)Sync-Jonathan.sh  0.2.10  11/16/2024
# @(#)Sync-Jonathan.sh  0.2.9   07/06/2024
# @(#)Sync-Jonathan.sh  0.2.8   06/15/2024
# @(#)Sync-Jonathan.sh  0.1.27  04/15/2022
# @(#)Sync-Jonathan.sh  0.1.26  01/08/2022
# @(#)Sync-Jonathan.sh  0.1.25  08/08/2021
# @(#)Sync-Jonathan.sh  0.1.24  12/19/2020
# @(#)Sync-Jonathan.sh  0.1.23  12/11/2020
# @(#)Sync-Jonathan.sh  0.1.22  10/04/2020
# @(#)Sync-Jonathan.sh  0.1.21  08/05/2020
# @(#)Sync-Jonathan.sh  0.1.20  07/26/2020
# @(#)Sync-Jonathan.sh  0.1.19  07/12/2020
# @(#)Sync-Jonathan.sh  0.1.18  06/28/2020
# @(#)Sync-Jonathan.sh  0.1.17  04/19/2020
# @(#)Sync-Jonathan.sh  0.1.16  12/09/2018
# @(#)Sync-Jonathan.sh  0.1.15  10/28/2018
# @(#)Sync-Jonathan.sh  0.1.14  10/21/2017
# @(#)Sync-Jonathan.sh	0.1.13	01/20/2017
# @(#)Sync-Jonathan.sh	0.1.12	02/07/2016
# @(#)Sync-Jonathan.sh	0.1.11	09/01/2015
# @(#)Sync-Jonathan.sh	0.1.10	08/14/2015
# @(#)Sync-Jonathan.sh	0.1.9	07/07/2015
# @(#)Sync-Jonathan.sh	0.1.8	03/16/2015
# @(#)Sync-Jonathan.sh	0.1.7	02/28/2015
# @(#)Sync-Jonathan.sh	0.1.6	02/01/2015
# @(#)Sync-Jonathan.sh	0.1.5	01/23/2015
# @(#)Sync-Jonathan.sh	0.1.4	10/26/2014
# @(#)Sync-Jonathan.sh	0.1.3	07/07/2014
# @(#)Sync-Jonathan.sh	0.1.2	06/27/2014
# @(#)Sync-Jonathan.sh	0.1.1	05/28/2014
# @(#)Sync-Jonathan.sh	0.1.0	03/31/2014
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
# @version      0.3.4
# @updated      $LastChangedDate: 2025-04-22 15:31:46 -0400 (Tue, 22 Apr 2025) $
# @revision     $LastChangedRevision: 14294 $

# Usage:
#       Sync-Jonathan.sh [optional-configuration-file-path]

if [ "$#" -eq 0 ]
then
        CONFIG_FILE=${HOME}/Config/Sync.cfg
else
        CONFIG_FILE=${1}
fi

echo "INFO: Using configuration file ${CONFIG_FILE}..."

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${external_bkup_mount_studio}" ]
then
        echo "ERROR: Variable external_bkup_mount_studio was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${external_bkup_dir_studio}" ]
then
        echo "ERROR: Variable external_bkup_dir_studio was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

BKUP_ROOT="${external_bkup_mount_studio}"
BKUP_DIR="${external_bkup_dir_studio}"

if \[ -d "${BKUP_ROOT}" \]; then
	echo "The external backup drive is mounted; backup will proceed."
else
	echo "The external backup drive is not mounted."
	exit 1
fi

HOME_DIR="${HOME}"
BKUP_DIR="${BKUP_ROOT}/${BKUP_DIR}"

RSYNC=/opt/homebrew/bin/rsync
OPTS_DELETE=(-avK "--iconv=utf-8-mac,utf-8" "--itemize-changes" "--delete")
OPTS_NO_DELETE=(-avK "--iconv=utf-8-mac,utf-8" "--itemize-changes")

echo "Begin backing up to ${BKUP_DIR}..."
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.activemqrc "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.bash_profile "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.bash_profile_with_python "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.bash_profile.pysave "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.bashrc "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.erlang.cookie "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.gitconfig "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.gitflow_export "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.gitignore_global "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.glassfishadminpass "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.hgignore_global "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.kotlinc_history "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.lesshst "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.mysql_history "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.pdfbox.cache "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.profile "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.stCommitMsg "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.vbt5 "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.viminfo "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.zprofile "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.zprofile_with_python "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.zprofile.bak "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.zsh_history "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.zshenv "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.zshrc "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/.zshrc_with_python "${BKUP_DIR}"

${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/Jonathan.pem "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/datamodeler.log "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/default-soapui-workspace.xml "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/my.cnf "${BKUP_DIR}"
${RSYNC} "${OPTS_NO_DELETE[@]}" ${HOME_DIR}/soapui-settings.xml "${BKUP_DIR}"

echo "Syncing ${HOME_DIR}/.android..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.android "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.aspera..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.aspera "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.atom..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.atom "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.aws..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.aws "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.aws-sam..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.aws-sam "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cache..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.cache "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cacher..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.cacher "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cagent..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.cagent "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cargo..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.cargo "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cisco..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.cisco "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.claude..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.claude "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.codeium..."
sudo ${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.codeium "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.config..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.config "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cookiecutter_replay..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.cookiecutter_replay "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.copilot..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.copilot "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cups..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.cups "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.devin..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.devin "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.devin-shared..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.devin-shared "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.djl.ai..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.djl.ai "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.docker..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.docker "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.dropbox..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.dropbox "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.gfclient..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.gfclient "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.gnupg..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.gnupg "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.gradle..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.gradle "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.groovy..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.groovy "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.handoff..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.handoff "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.hawtjni..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.hawtjni "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.homebrew..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.homebrew "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.idea..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.idea "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.idm..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.idm "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.imq..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.imq "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.ipython..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.ipython "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.javacpp..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.javacpp "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.jenkins..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.jenkins "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.jupyter..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.jupyter "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.logseq..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.logseq "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.m2..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.m2 "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.matplotlib..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.matplotlib "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.mongodb..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.mongodb "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.mysqlsh..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.mysqlsh "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.netbeans-derby..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.netbeans-derby "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.notepad++..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.notepad++ "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.npm..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.npm "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.openjfx..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.openjfx "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.oracle_jre_usage..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.oracle_jre_usage "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.pkl..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.pkl "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.pm2..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.pm2 "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.putty..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.putty "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.pyenv..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.pyenv "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.python-eggs..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.python-eggs "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.redis-insight..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.redis-insight "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.rustup..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.rustup "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.scenebuilder..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.scenebuilder "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.soapuios..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.soapuios "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.sonar..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.sonar "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.sonarlint..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.sonarlint "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.sqldeveloper..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.sqldeveloper "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.ssh..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.ssh "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.subversion..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.subversion "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.swiftpm..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.swiftpm "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.tooling..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.tooling "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.vim..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.vim "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.vscode..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.vscode "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.vscode-cli..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.vscode-cli "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.vscode-shared..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.vscode-shared "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.warp..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.warp "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.windsurf..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.windsurf "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.zsh_sessions..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/.zsh_sessions "${BKUP_DIR}"

echo "Syncing ${HOME_DIR}/Antlr-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Antlr-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Applications..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Applications "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Books..."
${RSYNC} "${OPTS_DELETE[@]}" -L ${HOME_DIR}/Books "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Boost..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Boost "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/CascadeProjects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/CascadeProjects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/CMake-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/CMake-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Certificates..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Certificates "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/CLionProjects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/CLionProjects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Cobol-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Cobol-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Color-Profiles..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Color-Profiles "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Config..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Config "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Cucumber..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Cucumber "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/DataGripProjects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/DataGripProjects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/DTDs..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/DTDs "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Desktop..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Desktop "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Docker..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Docker "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Documents..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Documents "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Downloads..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Downloads "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/FileMaker..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/FileMaker "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Flash..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Flash "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/GitInPractice..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/GitInPractice "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Go-Examples..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Go-Examples "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Go-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Go-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/GoLand-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/GoLand-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Gradle-Scripts..."
${RSYNC} "${OPTS_DELETE[@]}" "${HOME_DIR}/Gradle-Scripts" "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Groovy Projects..."
${RSYNC} "${OPTS_DELETE[@]}" "${HOME_DIR}/Groovy Projects" "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Applications..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/IDEA-Applications "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Branches..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/IDEA-Branches "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Libraries..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/IDEA-Libraries "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Project-Archives..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/IDEA-Project-Archives "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/IDEA-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/JNDI..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/JNDI "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/JSON..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/JSON "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Java..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Java "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/JavaFX..."
${RSYNC} "${OPTS_DELETE[@]}" -L ${HOME_DIR}/JavaFX "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Javadoc..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Javadoc "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/JetBrains-Academy..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/JetBrains-Academy "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/LSPCobol..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/LSPCobol "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Learning-Gradle..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Learning-Gradle "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Maven Projects..."
${RSYNC} "${OPTS_DELETE[@]}" "${HOME_DIR}/Maven Projects" "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/MediaFire..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/MediaFire "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Movies..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Movies "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Music..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Music "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/MySQL..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/MySQL "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Applications..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/NetBeans-Applications "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Branches..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/NetBeans-Branches "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Libraries..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/NetBeans-Libraries "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Project-Archives..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/NetBeans-Project-Archives "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" --exclude-from=${HOME}/Config/Rsync.cfg ${HOME_DIR}/NetBeans-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Sites..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/NetBeans-Sites "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Node-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Node-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Old Projects..."
${RSYNC} "${OPTS_DELETE[@]}" "${HOME_DIR}/Old Projects" "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Pictures..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Pictures "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Pkl..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Pkl "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Public..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Public "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/PycharmProjects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/PycharmProjects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/React-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/React-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Recovery..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Recovery "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Rust-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Rust-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/S3..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/S3 "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/SQL..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/SQL "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Schemas..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Schemas "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Scripts..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Scripts "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Sites..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Sites "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/SoapUI-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/SoapUI-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Solarized..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Solarized "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Temp..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Temp "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Textbook-Examples..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Textbook-Examples "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Udemy..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Udemy "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Xcode-Projects..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/Xcode-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/ePub..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/ePub "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/go..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/go "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/lib..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/lib "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/wekafiles..."
${RSYNC} "${OPTS_DELETE[@]}" ${HOME_DIR}/wekafiles "${BKUP_DIR}"

echo "Syncing /opt..."
sudo ${RSYNC} "${OPTS_DELETE[@]}" /opt "${BKUP_ROOT}/jonathan-opt"
echo "Syncing /usr/local..."
sudo ${RSYNC} "${OPTS_DELETE[@]}" /usr/local "${BKUP_ROOT}/jonathan-usr-local"

echo "Backup has completed."
echo "End backing up to ${BKUP_DIR}."

exit 0
