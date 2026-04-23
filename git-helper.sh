#!/bin/bash
# =========================================================
# Git Auto-Assistant Script (Version 1 - Basic)
# This script automates: add → commit → push
# =========================================================


# ---------- 1. Check if current folder is a Git repository ----------
# A Git repository always contains a hidden ".git" directory
if [ ! -d ".git" ]; then
    echo "❌ Error: This is not a Git repository."
    echo "👉 Please navigate to a folder initialized with Git."
    exit 1   # Stop execution with error status
fi


# ---------- 2. Stage all changes ----------
# This adds all new, modified, and deleted files to staging area
echo "📦 Adding all changes..."
git add .

# Check if git add failed
if [ $? -ne 0 ]; then
    echo "❌ Failed to add files."
    exit 1
fi


# ---------- 3. Ask user for commit message ----------
echo "✏️ Enter your commit message:"
read commit_message

# Check if message is empty
if [ -z "$commit_message" ]; then
    echo "❌ Commit message cannot be empty."
    exit 1
fi


# ---------- 4. Create commit ----------
echo "📝 Committing changes..."
git commit -m "$commit_message"

# Check if commit failed (e.g., nothing to commit)
if [ $? -ne 0 ]; then
    echo "⚠️ Nothing to commit or commit failed."
    exit 1
fi


# ---------- 5. Push to remote repository ----------
echo "🚀 Pushing to remote..."
git push

# Check if push failed
if [ $? -ne 0 ]; then
    echo "❌ Push failed. Check your connection or permissions."
    exit 1
fi


# ---------- 6. Success message ----------
echo "✅ All done! Your code is safely pushed."
