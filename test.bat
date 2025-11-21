@echo off
setlocal enabledelayedexpansion

cd /d C:\Users\29084\Desktop\github101

set "counter_file=counter.txt"
set "output_file=test.txt"

if exist %counter_file% (
    set /p n=<%counter_file%
) else (
    set n=1
)

git checkout main
git pull origin main

set "branch=feat/test-%n%"
git checkout -b %branch%

echo test%n%>>%output_file%

git add .
git commit -m "feat: add test%n%"

git push -u origin %branch%
gh pr create --base main --head %branch% --title "feat: add test%n%" --body "Auto PR %n%"

set /a next=n+1
echo %next%>%counter_file%

echo Done: PR created for test%n%
