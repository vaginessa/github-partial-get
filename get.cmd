@echo off
::------------------------------------------------------------------------::
:: Download a folder+content from a GitHub repository. Using SVN.         ::
:: All dependencies included (SVN binaries).                              ::
::------------------------------------------------------------------------::
:: You can run this batch-file with a single argument,                    ::
:: or run it "as is" and copy&paste the URL from your-browser when asked. ::
::------------------------------------------------------------------------::
:: This batch is 'Unlicensed' (public-domain). The SVN-binaries are not.  ::
::------------------------------------------------------------------------::
::       https://github.com/eladkarako/partial-download-github-repository ::
::                                       Elad Karako. January 30th, 2018. ::
::------------------------------------------------------------------------::
chcp 65001 2>nul >nul

set "SVN=%~dp0bin\svn.exe"
for /f %%a in ("%SVN%") do ( set "SVN=%%~fsa"  )

::use pre-supplied argument.
set "URL=%~1"
if ["%URL%"] NEQ [""] ( goto RUN ) 

::query user for 
set /p "URL=Folder-URL From Browser (https://github.com/USERNAME/REPOSITORY/tree/master/....../Folder): "
if ["%URL%"] NEQ [""] ( goto RUN ) 

echo ERROR: invalid URL.
goto END


:RUN
  echo.
  echo Converting:
  echo ^« %URL%
  set "URL=%URL:.git=%"

::replace 'REPOSITORY_NAME/tree/' with 'REPOSITORY_NAME.git/'
  set "URL=%URL:/tree/=.git/%"

::replace branch name 'master' to 'trunk', to be SVN-compatible (other branch names works fine).
  set "URL=%URL:/master=/trunk%"

::remove last-slash by marking it with '##' suffix.
  set "URL=%URL%##"
  set "URL=%URL:/##=%"
  set "URL=%URL:##=%"

  echo to...
  echo ^» %URL%
  echo.

::SVN, permissive-download.
  echo ------------------------------------------------
  call "%SVN%" "--non-interactive" "--trust-server-cert-failures=unknown-ca,cn-mismatch,expired,not-yet-valid,other" export "%URL%"
  echo ------------------------------------------------
  goto END


:END
  echo.
  echo Done.
  pause
