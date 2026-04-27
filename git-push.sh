#!/usr/bin/env bash
set -euo pipefail

# إعدادات قابلة للتعديل
REMOTE_URL="git@github.com:USERNAME/REPO.git"   # غيّر إلى رابط الريموت الخاص بك
BRANCH="main"                                   # غيّر إلى الفرع المطلوب
COMMIT_MSG="Update project $(date +'%Y-%m-%d %H:%M')" 

# انتقل إلى مجلد المشروع الحالي (أو استبدل بالمسار الكامل)
PROJECT_DIR="$(pwd)"

# تنفيذ خطوات Git
cd "$PROJECT_DIR"
git init 2>/dev/null || true
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE_URL"
git add -A
git commit -m "$COMMIT_MSG" || echo "لا توجد تغييرات جديدة للالتزام"
git branch -M "$BRANCH"
git push -u origin "$BRANCH"
