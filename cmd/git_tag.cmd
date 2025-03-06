@echo off


call :start


:start
  goto :dir
:dir
  set /p "_dir=Enter directory: "
  if not defined _dir (if exist ".git" (goto :commit) else (echo Incorrect directory.&& goto :dir))
  if exist "%_dir%\.git" (cd %_dir% && goto :commit) else (echo Incorrect directory.&& goto :dir)
:commit
  set /p "_commit=Enter commit ID (either 7 or 40 symbols long): "
  for /f %%i in ('git cat-file commit %_commit%') do (set _commitfound=%%i)
  if not defined _commitfound (goto :commit) else (goto :addtag)
:addtag
  set /p "_tag=Enter tag: "
  git tag "%_tag%" %_commit%
  git push origin "%_tag%"
  pause