git svn fetch
git push origin origin/trunk:trunk

git fetch upstream
git push origin upstream/master:master

git submodule update --init --recursive

docker run --rm -ti --isolation process --device class/5B45201D-F2F2-4F3B-85BB-30FF1F953599 -v%CD%:C:\code -wC:\code galeksandrp/travistest:docker-servercore-ltsc2022-mpc-be update_gcc.bat
docker run --rm -ti --isolation process --device class/5B45201D-F2F2-4F3B-85BB-30FF1F953599 -v%CD%:C:\code -wC:\code galeksandrp/travistest:docker-servercore-ltsc2022-mpc-be cmd /c set MPCBE_MINGW=%%SYSTEMDRIVE%%\mingw^&^& update_gcc.bat
docker run --rm -ti --isolation process --device class/5B45201D-F2F2-4F3B-85BB-30FF1F953599 -v%CD%:C:\code -wC:\code galeksandrp/travistest:docker-servercore-ltsc2022-mpc-be build.bat x64 Packages

pause
