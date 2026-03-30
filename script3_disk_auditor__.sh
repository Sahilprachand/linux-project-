#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: SAHIL PRACHAND
# Course: Open Source Software
# Description: Audits directory sizes, ownership, permissions, and Git configuration
# Concepts: for loop, if-then conditions, ls -ld, du, awk, cut, string comparison

echo ""
echo "===================================="
echo "   DISK & PERMISSION AUDITOR"
echo "===================================="
echo ""

#  KEY SYSTEM DIRECTORIES 
# Array of important system directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/root")

echo "=== SYSTEM DIRECTORY AUDIT ==="
echo ""

#LOOP THROUGH EACH DIRECTORY
# For loop: iterate through each directory in the DIRS array
for DIR in "${DIRS[@]}"; do
    # Check if directory exists
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" 2>/dev/null | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" 2>/dev/null | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" 2>/dev/null | awk '{print $4}')
        
        # Get directory size using du (disk usage)
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        # Display results
        echo "Directory: $DIR"
        echo "  Permissions: $PERMS"
        echo "  Owner: $OWNER | Group: $GROUP"
        echo "  Size: $SIZE"
        echo ""
    else
        # Directory doesn't exist
        echo "Directory: $DIR"
        echo "DOES NOT EXIST on this system"
        echo ""
    fi
done

# GIT-SPECIFIC CONFIGURATION AUDIT
echo "=== GIT CONFIGURATION AUDIT ==="
echo ""

GIT_CONFIG="$HOME/.gitconfig"
GIT_CONFIG_GLOBAL="/etc/gitconfig"

# Check for user-level Git config
if [ -f "$GIT_CONFIG" ]; then
    echo "User Git Config: $GIT_CONFIG"
    PERMS=$(ls -l "$GIT_CONFIG" | awk '{print $1}')
    OWNER=$(ls -l "$GIT_CONFIG" | awk '{print $3}')
    SIZE=$(ls -lh "$GIT_CONFIG" | awk '{print $5}')
    
    echo "  Permissions: $PERMS"
    echo "  Owner: $OWNER"
    echo "  Size: $SIZE"
    echo ""
    echo "  Configuration contents:"
    # Display .gitconfig with indentation
    sed 's/^/    /' "$GIT_CONFIG"
    echo ""
else
    echo "User Git Config: $GIT_CONFIG"
    echo " NOT CONFIGURED (run: git config --global user.name ADARSH BHARDWAJ)"
    echo ""
fi

# Check for system-level Git config
if [ -f "$GIT_CONFIG_GLOBAL" ]; then
    echo "System Git Config: $GIT_CONFIG_GLOBAL"
    PERMS=$(ls -l "$GIT_CONFIG_GLOBAL" | awk '{print $1}')
    SIZE=$(ls -lh "$GIT_CONFIG_GLOBAL" | awk '{print $5}')
    
    echo "  Permissions: $PERMS"
    echo "  Size: $SIZE"
    echo ""
else
    echo "System Git Config: $GIT_CONFIG_GLOBAL"
    echo "NOT CONFIGURED (system-wide config)"
    echo ""
fi

#  GIT REPOSITORIES AUDIT 
echo "=== GIT REPOSITORIES ON SYSTEM ==="
echo ""

# Find all .git directories (local repositories)
if find "$HOME" -maxdepth 3 -type d -name ".git" 2>/dev/null | grep -q "."; then
    echo "Git repositories found in $HOME:"
    find "$HOME" -maxdepth 3 -type d -name ".git" 2>/dev/null | while read repo; do
        REPO_PATH=$(dirname "$repo")
        REPO_SIZE=$(du -sh "$repo" 2>/dev/null | cut -f1)
        echo "  Repository: $REPO_PATH"
        echo "  Size: $REPO_SIZE"
    done
    echo ""
else
    echo "No Git repositories found in $HOME"
    echo "(Tip: Create a test repo with: git init test-repo)"
    echo ""
fi

echo "===================================="
echo "Audit completed: $(date)"
echo "===================================="
echo ""
