@echo off

chcp 65001
cd .\.\adb
echo 查看adb端口是否被占用：
netstat -aon|findstr "5037"
echo 启动adb：
.\adb.exe start-server
echo 检测是否已连接手机：
.\adb.exe devices -l
echo 手机连接成功：
.\adb.exe logcat -c
echo 埋点宏路日志：
.\adb.exe logcat | findstr -i CITICSLOG-CSStatsAgent-act_name