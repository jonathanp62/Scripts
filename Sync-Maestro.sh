#!/usr/bin/env zsh

# @(#)Sync-Maestro.sh   0.2.16 	10/04/2025
# @(#)Sync-Maestro.sh   0.2.15 	06/19/2025
# @(#)Sync-Maestro.sh   0.2.12 	04/22/2025
# @(#)Sync-Maestro.sh   0.2.11 	04/07/2025
# @(#)Sync-Maestro.sh   0.2.10 	03/24/2025
# @(#)Sync-Maestro.sh   0.2.9 	07/06/2024
# @(#)Sync-Maestro.sh   0.2.8 	05/11/2024
# @(#)Sync-Maestro.sh   0.2.7 	04/04/2024
# @(#)Sync-Maestro.sh   0.2.6 	03/24/2024
# @(#)Sync-Maestro.sh   0.2.4 	01/14/2024
# @(#)Sync-Maestro.sh   0.2.3 	10/28/2023
# @(#)Sync-Maestro.sh   0.2.2 	09/23/2023
# @(#)Sync-Maestro.sh   0.2.1 	09/16/2023
# @(#)Sync-Maestro.sh   0.2.0 	07/31/2023
# @(#)Sync-Maestro.sh   0.1.33  04/16/2023
# @(#)Sync-Maestro.sh   0.1.32  03/29/2023
# @(#)Sync-Maestro.sh   0.1.31  03/28/2023
# @(#)Sync-Maestro.sh   0.1.30  03/26/2023
# @(#)Sync-Maestro.sh   0.1.28  10/21/2022
# @(#)Sync-Maestro.sh   0.1.27  04/15/2022
# @(#)Sync-Maestro.sh   0.1.26  01/08/2022
# @(#)Sync-Maestro.sh   0.1.25  08/08/2021
# @(#)Sync-Maestro.sh   0.1.24  12/19/2020
# @(#)Sync-Maestro.sh   0.1.23  12/11/2020
# @(#)Sync-Maestro.sh   0.1.22  10/04/2020
# @(#)Sync-Maestro.sh   0.1.21  08/05/2020
# @(#)Sync-Maestro.sh   0.1.20  07/26/2020
# @(#)Sync-Maestro.sh   0.1.19  07/12/2020
# @(#)Sync-Maestro.sh   0.1.18  06/28/2020
# @(#)Sync-Maestro.sh   0.1.17  04/19/2020
# @(#)Sync-Maestro.sh   0.1.16  12/05/2018
# @(#)Sync-Maestro.sh   0.1.15  10/28/2018
# @(#)Sync-Maestro.sh   0.1.14  10/21/2017
# @(#)Sync-Maestro.sh	0.1.13	01/20/2017
# @(#)Sync-Maestro.sh	0.1.12	02/07/2016
# @(#)Sync-Maestro.sh	0.1.11	08/01/2015
# @(#)Sync-Maestro.sh	0.1.10	08/14/2015
# @(#)Sync-Maestro.sh	0.1.9	07/31/2015
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.9
# @version      0.2.16
# @updated      $LastChangedDate: 2025-04-22 16:59:18 -0400 (Tue, 22 Apr 2025) $
# @revision     $LastChangedRevision: 14295 $

# Usage:
#       Sync-Maestro.sh [optional-configuration-file-path]

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

if [ -z "${external_bkup_mount_mini}" ]
then
        echo "ERROR: Variable external_bkup_mount_mini was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${external_bkup_dir_mini}" ]
then
        echo "ERROR: Variable external_bkup_dir_mini was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

BKUP_ROOT="${external_bkup_mount_mini}"
BKUP_DIR="${external_bkup_dir_mini}"

if \[ -d "${BKUP_ROOT}" \]; then
	echo "The external backup drive is mounted; backup will proceed."
else
	echo "The external backup drive is not mounted."
	exit 1
fi

HOME_DIR="${HOME}"
BKUP_DIR="${BKUP_ROOT}/${BKUP_DIR}"

echo "Begin backing up to ${BKUP_DIR}..."
rsync -avi ${HOME_DIR}/.activemqrc "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.bash_profile "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.bash_profile_with_python "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.bash_profile.pysave "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.bashrc "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.erlang.cookie "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.gitconfig "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.gitflow_export "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.gitignore_global "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.glassfishadminpass "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.hgignore_global "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.lesshst "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.mysql_history "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.pdfbox.cache "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.profile "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.stCommitMsg "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.vbt5 "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.viminfo "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.zprofile "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.zprofile_with_python "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.zprofile.bak "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.zsh_history "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.zshenv "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.zshrc "${BKUP_DIR}"
rsync -avi ${HOME_DIR}/.zshrc_with_python "${BKUP_DIR}"

rsync -av ${HOME_DIR}/Jonathan.pem "${BKUP_DIR}"
rsync -av ${HOME_DIR}/datamodeler.log "${BKUP_DIR}"
rsync -av ${HOME_DIR}/default-soapui-workspace.xml "${BKUP_DIR}"
rsync -av ${HOME_DIR}/my.cnf "${BKUP_DIR}"
rsync -av ${HOME_DIR}/soapui-settings.xml "${BKUP_DIR}"

echo "Syncing ${HOME_DIR}/.android..."
rsync -av --delete ${HOME_DIR}/.android "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.aspera..."
rsync -av --delete ${HOME_DIR}/.aspera "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.atom..."
rsync -av --delete ${HOME_DIR}/.atom "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.aws..."
rsync -av --delete ${HOME_DIR}/.aws "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.aws-sam..."
rsync -av --delete ${HOME_DIR}/.aws-sam "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cacher..."
rsync -av --delete ${HOME_DIR}/.cacher "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cargo..."
rsync -av --delete ${HOME_DIR}/.cargo "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cisco..."
rsync -av --delete ${HOME_DIR}/.cisco "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.codeium..."
sudo rsync -avir --delete ${HOME_DIR}/.codeium "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.config..."
rsync -av --delete ${HOME_DIR}/.config "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cookiecutter_replay..."
rsync -av --delete ${HOME_DIR}/.cookiecutter_replay "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.cups..."
rsync -av --delete ${HOME_DIR}/.cups "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.docker..."
rsync -av --delete ${HOME_DIR}/.docker "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.dropbox..."
rsync -av --delete ${HOME_DIR}/.dropbox "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.gradle..."
rsync -av --delete ${HOME_DIR}/.gradle "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.groovy..."
rsync -av --delete ${HOME_DIR}/.groovy "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.handoff..."
rsync -av --delete ${HOME_DIR}/.handoff "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.hawtjni..."
rsync -avir --delete ${HOME_DIR}/.hawtjni "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.idm..."
rsync -av --delete ${HOME_DIR}/.idm "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.ipython..."
rsync -av --delete ${HOME_DIR}/.ipython "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.javacpp..."
rsync -av --delete ${HOME_DIR}/.javacpp "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.jenkins..."
rsync -av --delete ${HOME_DIR}/.jenkins "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.jupyter..."
rsync -av --delete ${HOME_DIR}/.jupyter "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.logseq..."
rsync -av --delete ${HOME_DIR}/.logseq "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.m2..."
rsync -av --delete ${HOME_DIR}/.m2 "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.matplotlib..."
rsync -av --delete ${HOME_DIR}/.matplotlib "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.mongodb..."
rsync -av --delete ${HOME_DIR}/.mongodb "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.mysqlsh..."
rsync -av --delete ${HOME_DIR}/.mysqlsh "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.netbeans-derby..."
rsync -av --delete ${HOME_DIR}/.netbeans-derby "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.npm..."
rsync -av --delete ${HOME_DIR}/.npm "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.openjfx..."
rsync -av --delete ${HOME_DIR}/.openjfx "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.oracle_jre_usage..."
rsync -av --delete ${HOME_DIR}/.oracle_jre_usage "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.pkl..."
rsync -av --delete ${HOME_DIR}/.pkl "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.pm2..."
rsync -av --delete ${HOME_DIR}/.pm2 "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.putty..."
rsync -av --delete ${HOME_DIR}/.putty "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.pyenv..."
rsync -av --delete ${HOME_DIR}/.pyenv "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.python-eggs..."
rsync -av --delete ${HOME_DIR}/.python-eggs "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.redis-insight..."
rsync -avir --delete ${HOME_DIR}/.redis-insight "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.rustup..."
rsync -av --delete ${HOME_DIR}/.rustup "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.scenebuilder..."
rsync -av --delete ${HOME_DIR}/.scenebuilder "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.soapuios..."
rsync -av --delete ${HOME_DIR}/.soapuios "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.sonarlint..."
rsync -av --delete ${HOME_DIR}/.sonarlint "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.sqldeveloper..."
rsync -av --delete ${HOME_DIR}/.sqldeveloper "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.ssh..."
rsync -av --delete ${HOME_DIR}/.ssh "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.subversion..."
rsync -av --delete ${HOME_DIR}/.subversion "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.swiftpm..."
rsync -av --delete ${HOME_DIR}/.swiftpm "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.tooling..."
rsync -av --delete ${HOME_DIR}/.tooling "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.vim..."
rsync -av --delete ${HOME_DIR}/.vim "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.vscode..."
rsync -av --delete ${HOME_DIR}/.vscode "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.vscode-cli..."
rsync -av --delete ${HOME_DIR}/.vscode-cli "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.warp..."
rsync -av --delete ${HOME_DIR}/.warp "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.windsurf..."
rsync -avir --delete ${HOME_DIR}/.windsurf "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/.zsh_sessions..."
rsync -avir --delete ${HOME_DIR}/.zsh_sessions "${BKUP_DIR}"

echo "Syncing ${HOME_DIR}/Antlr-Projects..."
rsync -avir --delete ${HOME_DIR}/Antlr-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Applications..."
rsync -avir --delete ${HOME_DIR}/Applications "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Books..."
rsync -avir -L --delete ${HOME_DIR}/Books "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Boost..."
rsync -avir --delete ${HOME_DIR}/Boost "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/CascadeProjects..."
rsync -avir --delete ${HOME_DIR}/CascadeProjects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/CMake-Projects..."
rsync -avir --delete ${HOME_DIR}/CMake-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Certificates..."
rsync -avir --delete ${HOME_DIR}/Certificates "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/CLionProjects..."
rsync -avir --delete ${HOME_DIR}/CLionProjects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Cobol-Projects..."
rsync -avir --delete ${HOME_DIR}/Cobol-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Color-Profiles..."
rsync -avir --delete ${HOME_DIR}/Color-Profiles "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Config..."
rsync -avir --delete ${HOME_DIR}/Config "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Cucumber..."
rsync -avir --delete ${HOME_DIR}/Cucumber "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/DataGripProjects..."
rsync -avir --delete ${HOME_DIR}/DataGripProjects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/DTDs..."
rsync -avir --delete ${HOME_DIR}/DTDs "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Desktop..."
rsync -avir --delete ${HOME_DIR}/Desktop "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Docker..."
rsync -avir --delete ${HOME_DIR}/Docker "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Documents..."
rsync -avir --delete ${HOME_DIR}/Documents "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Downloads..."
rsync -avir --delete ${HOME_DIR}/Downloads "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/FileMaker..."
rsync -avir --delete ${HOME_DIR}/FileMaker "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Flash..."
rsync -avir --delete ${HOME_DIR}/Flash "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/GitInPractice..."
rsync -avir --delete ${HOME_DIR}/GitInPractice "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Go-Examples..."
rsync -avir --delete ${HOME_DIR}/Go-Examples "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Go-Projects..."
rsync -avir --delete ${HOME_DIR}/Go-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/GoLand-Projects..."
rsync -avir --delete ${HOME_DIR}/GoLand-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Gradle-Scripts..."
rsync -avir --delete "${HOME_DIR}/Gradle-Scripts" "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Groovy Projects..."
rsync -avir --delete "${HOME_DIR}/Groovy Projects" "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Applications..."
rsync -avir --delete ${HOME_DIR}/IDEA-Applications "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Branches..."
rsync -avir --delete ${HOME_DIR}/IDEA-Branches "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Libraries..."
rsync -avir --delete ${HOME_DIR}/IDEA-Libraries "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Project-Archives..."
rsync -avir --delete ${HOME_DIR}/IDEA-Project-Archives "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/IDEA-Projects..."
rsync -avir --delete ${HOME_DIR}/IDEA-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/JNDI..."
rsync -avir --delete ${HOME_DIR}/JNDI "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/JSON..."
rsync -avir --delete ${HOME_DIR}/JSON "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Java..."
rsync -avir --delete ${HOME_DIR}/Java "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/JavaFX..."
rsync -avir -L --delete ${HOME_DIR}/JavaFX "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Javadoc..."
rsync -avir --delete ${HOME_DIR}/Javadoc "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/JetBrains-Academy..."
rsync -avir --delete ${HOME_DIR}/JetBrains-Academy "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/LSPCobol..."
rsync -avir --delete ${HOME_DIR}/LSPCobol "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Learning-Gradle..."
rsync -avir --delete ${HOME_DIR}/Learning-Gradle "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Maven Projects..."
rsync -avir --delete "${HOME_DIR}/Maven Projects" "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/MediaFire..."
rsync -avir --delete ${HOME_DIR}/MediaFire "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Movies..."
rsync -avir --delete ${HOME_DIR}/Movies "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Music..."
rsync -avir --delete --exclude-from=${HOME_DIR}/rsync-exclude-from.txt ${HOME_DIR}/Music "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/MySQL..."
rsync -avir --delete ${HOME_DIR}/MySQL "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Applications..."
rsync -avir --delete ${HOME_DIR}/NetBeans-Applications "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Branches..."
rsync -avir --delete ${HOME_DIR}/NetBeans-Branches "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Libraries..."
rsync -avir --delete ${HOME_DIR}/NetBeans-Libraries "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Project-Archives..."
rsync -avir --delete ${HOME_DIR}/NetBeans-Project-Archives "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Projects..."
rsync -avir --delete --exclude-from=${HOME}/Config/Rsync.cfg ${HOME_DIR}/NetBeans-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/NetBeans-Sites..."
rsync -avir --delete ${HOME_DIR}/NetBeans-Sites "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Node-Projects..."
rsync -avir --delete ${HOME_DIR}/Node-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Old Projects..."
rsync -avir --delete "${HOME_DIR}/Old Projects" "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Oracle..."
rsync -avir --delete ${HOME_DIR}/Oracle "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Pictures..."
rsync -avir --delete ${HOME_DIR}/Pictures "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Pkl..."
rsync -avir --delete ${HOME_DIR}/Pkl "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Public..."
rsync -avir --delete ${HOME_DIR}/Public "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/PycharmProjects..."
rsync -avir --delete ${HOME_DIR}/PycharmProjects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/React-Projects..."
rsync -avir --delete ${HOME_DIR}/React-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Recovery..."
rsync -avir --delete ${HOME_DIR}/Recovery "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/S3..."
rsync -avir --delete ${HOME_DIR}/S3 "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/SQL..."
rsync -avir --delete ${HOME_DIR}/SQL "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Schemas..."
rsync -avir --delete ${HOME_DIR}/Schemas "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Scripts..."
rsync -avir --delete ${HOME_DIR}/Scripts "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Sites..."
rsync -avir --delete ${HOME_DIR}/Sites "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/SoapUI-Projects..."
rsync -avir --delete ${HOME_DIR}/SoapUI-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Solarized..."
rsync -avir --delete ${HOME_DIR}/Solarized "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Sony..."
rsync -avir --delete ${HOME_DIR}/Sony "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Temp..."
rsync -avir --delete ${HOME_DIR}/Temp "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Textbook-Examples..."
rsync -avir --delete ${HOME_DIR}/Textbook-Examples "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Udemy..."
rsync -avir --delete ${HOME_DIR}/Udemy "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/Xcode-Projects..."
rsync -avir --delete ${HOME_DIR}/Xcode-Projects "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/ePub..."
rsync -avir --delete ${HOME_DIR}/ePub "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/go..."
rsync -avir --delete ${HOME_DIR}/go "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/lib..."
rsync -avir --delete ${HOME_DIR}/lib "${BKUP_DIR}"
echo "Syncing ${HOME_DIR}/wekafiles..."
rsync -avir --delete ${HOME_DIR}/wekafiles "${BKUP_DIR}"

echo "Syncing /opt/homebrew..."
sudo rsync -avir --delete /opt/homebrew "${BKUP_ROOT}/maestro-opt-homebrew"
echo "Syncing /usr/local..."
sudo rsync -avir --delete /usr/local "${BKUP_ROOT}/maestro-usr-local"

echo "Backup has completed."
echo "End backing up to ${BKUP_DIR}."

exit 0
