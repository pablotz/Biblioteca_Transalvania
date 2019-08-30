@echo off
set mySqlPath=C:\Program Files (x86)\MySQL\MySQL Server 5.6\bin
set dbUser=root
set dbPassword="root"
set dbName=biblioteca_ts
set file=%dbName%_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.sql
set path=C:\respaldo

echo Running dump for database %dbName% ^> ^%path%\%file%
"%mySqlPath%\\mysqldump.exe" -u %dbUser% -p%dbPassword%  %dbName% >"%path%\\%file%"
echo Done!