
# Author: SAHIL PRACHAND 
# Course: Open Source Software
# Description: Displays system information and Git context
# Concepts: Variables, command substitution $(), echo, formatting


STUDENT_NAME="sahil  prachand "
REG_NUMBER="24mip10025"
SOFTWARE_CHOICE="Git"


KERNEL=$(uname -r)


DISTRO=$(lsb_release -d | cut -f2)


USER_NAME=$(whoami)


HOME_DIR=$(pwd)


UPTIME=$(uptime -p)


DATE=$(date '+%Y-%m-%d %H:%M:%S')


LINUX_LICENSE="GPL v2"


GIT_VERSION=$(git --version)


GIT_LOCATION=$(which git)

# ===== DISPLAY OUTPUT =====
echo ""
echo "=================================="
echo "   OPEN SOURCE AUDIT REPORT"
echo "=================================="
echo ""
echo "Student: $STUDENT_NAME"
echo "Roll Number: $REG_NUMBER"
echo "Software: $SOFTWARE_CHOICE"
echo ""

echo "=== SYSTEM INFORMATION ==="
echo "Linux Distribution: $DISTRO"
echo "Kernel Version: $KERNEL"
echo "Current User: $USER_NAME"
echo "Current Directory: $HOME_DIR"
echo "System Uptime: $UPTIME"
echo "Date/Time: $DATE"
echo "OS License: $LINUX_LICENSE"
echo ""

echo "=== GIT INFORMATION ==="
echo "Git Version: $GIT_VERSION"
echo "Git Location: $GIT_LOCATION"
echo "Git License: GPL v2"
echo ""

echo "=================================="
echo "Report generated: $(date)"
echo "=================================="
echo ""
