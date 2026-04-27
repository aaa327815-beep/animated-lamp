# إعدادات قابلة للتعديل
$RemoteUrl = "git@github.com:USERNAME/REPO.git"   # غيّر إلى رابط الريموت الخاص بك
$Branch = "main"                                  # غيّر إلى الفرع المطلوب
$CommitMsg = "Update project $(Get-Date -Format 'yyyy-MM-dd HH:mm')"

# انتقل إلى مجلد المشروع الحالي
$ProjectDir = (Get-Location).Path
Set-Location $ProjectDir

# تنفيذ خطوات Git
if (-not (Test-Path .git)) { git init }
try { git remote remove origin } catch {}
git remote add origin $RemoteUrl
git add -A
try { git commit -m $CommitMsg } catch { Write-Host "لا توجد تغييرات جديدة للالتزام" }
git branch -M $Branch
git push -u origin $Branch
