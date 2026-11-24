# AI profile auto sync (Windows)
# 1. Change $repo to the folder where you cloned your PRIVATE ai-profile repo.
# 2. Register an hourly task (run once in a terminal):
#    schtasks /Create /F /TN "AI-profile-sync" /SC HOURLY /TR "powershell -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File C:\path\to\sync.ps1"
# Note: keep this file ASCII-only; Windows PowerShell 5.1 misreads UTF-8 without BOM.

$repo = "C:\Users\YOUR_NAME\ai-profile"
$log  = Join-Path $repo ".sync.log"

Set-Location $repo
git pull -q --rebase origin main 2>&1 | Out-Null
git add -A
git diff --cached --quiet
if ($LASTEXITCODE -ne 0) {
  git commit -q -m ("auto sync " + (Get-Date -Format "yyyy-MM-dd HH:mm"))
}
git push -q origin main 2>&1 | Out-Null
$r = if ($LASTEXITCODE -eq 0) { "ok" } else { "PUSH FAILED" }
Add-Content $log ((Get-Date -Format "yyyy-MM-dd HH:mm") + " " + $r)
