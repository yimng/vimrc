@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set APP_PATH=%HOME%\.lukun-vim
IF NOT EXIST "%APP_PATH%" (
    call git clone -b master https://github.com/yimng/vimrc.git "%APP_PATH%"
) ELSE (
    @set ORIGINAL_DIR=%CD%
    echo updating lukun-vim
    chdir /d "%APP_PATH%"
    call git pull
    chdir /d "%ORIGINAL_DIR%"
    call cd "%APP_PATH%"
)

call mklink "%HOME%\.vimrc" "%APP_PATH%\.vimrc"
call mklink "%HOME%\_vimrc" "%APP_PATH%\.vimrc"
call mklink "%HOME%\.vimrc.fork" "%APP_PATH%\.vimrc.fork"
call mklink "%HOME%\.vimrc.bundles" "%APP_PATH%\.vimrc.bundles"
call mklink "%HOME%\.vimrc.bundles.fork" "%APP_PATH%\.vimrc.bundles.fork"
call mklink "%HOME%\.vimrc.before" "%APP_PATH%\.vimrc.before"
call mklink "%HOME%\.vimrc.before.fork" "%APP_PATH%\.vimrc.before.fork"
call mklink /J "%HOME%\.vim" "%APP_PATH%\.vim"

