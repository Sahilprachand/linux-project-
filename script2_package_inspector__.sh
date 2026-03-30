#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: SAHIL PRACHAND
#Course: Open Source Software
# Description: Checks if a package is installed, shows version, explains its philosophy
# Concepts: if-then-else condition, case statement, grep piping, package management

PACKAGE="git"

echo ""
echo "===================================="
echo "   FOSS PACKAGE INSPECTOR"
echo "===================================="
echo ""

# ===== CHECK IF PACKAGE IS INSTALLED =====
# Use dpkg (Debian package manager) to check installation
if dpkg -l | grep -q "^ii.*git"; then
    echo "STATUS: $PACKAGE is INSTALLED on this system"
    echo ""
    
    # ===== DISPLAY PACKAGE INFORMATION =====
    echo "=== PACKAGE DETAILS ==="
    # Extract package name, version, and description from dpkg
    dpkg -l | grep "^ii.*git" | head -1 | awk '{
        print "Package Name: " $2
        print "Status: " $1 " (ii = installed)"
        print "Version: " $3
        print "Architecture: " $4
    }'
    echo ""
    
    # ===== DISPLAY PACKAGE DESCRIPTION =====
    echo "=== DESCRIPTION ==="
    apt-cache show git | grep "^Description:" | cut -d: -f2- | head -1
    echo ""
    
else
    # If not installed, exit gracefully
    echo "STATUS: $PACKAGE is NOT installed on this system"
    echo ""
    echo "To install Git, run:"
    echo "  sudo apt update"
    echo "  sudo apt install git"
    echo ""
    exit 1
fi

# ===== PHILOSOPHICAL NOTE USING CASE STATEMENT =====
# This demonstrates how case statements work with different packages
echo "=== OPEN SOURCE PHILOSOPHY ==="
case $PACKAGE in
    git)
        echo "Git - Distributed Version Control System"
        echo ""
        echo "Created: 2005 by Linus Torvalds"
        echo "License: GPL v2 (Copyleft)"
        echo "Philosophy: 'I can build this better than waiting for proprietary tools'"
        echo ""
        echo "Key principle: Every developer has a complete repository history."
        echo "No single point of failure. Decentralized. Transparent."
        echo ""
        echo "Why it matters: Git enabled the modern open-source ecosystem."
        echo "Without it, collaborative coding would not be what it is today."
        ;;
    
    httpd)
        echo "Apache HTTP Server - Web Server"
        echo "Philosophy: The web should be open, free, and transparent"
        ;;
    
    mysql)
        echo "MySQL - Relational Database"
        echo "Philosophy: Databases should be accessible, not locked behind paywalls"
        ;;
    
    firefox)
        echo "Firefox - Web Browser"
        echo "Philosophy: A nonprofit fighting for an open web"
        ;;
    
    python)
        echo "Python - Programming Language"
        echo "Philosophy: Code should be readable and collaborative"
        ;;
    
    *)
        echo "Unknown package: $PACKAGE"
        ;;
esac

echo ""
echo "===================================="
echo ""
