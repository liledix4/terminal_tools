@echo off
set /p "_tag=Enter tag: "
git push --delete origin %_tag%
git tag --delete "%_tag%"
pause