@echo off

rem font-encoding
chcp 65001

rem reports dir make
mkdir reports

rem systeminfo
systeminfo > reports/systeminfo.txt

rem unquoted service path
wmic service get name,displayname,pathname,startmode |findstr /i "auto" |findstr /i /v "c:\windows\\" |findstr /i /v """" > reports/unquoted.txt

rem saved credential
cmdkey /list > reports/cred.txt

rem auto runs
reg query HKLM¥SOFTWARE¥Microsoft¥Windows¥CurrentVersion¥Run > reports/autorun.txt