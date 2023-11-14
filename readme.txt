sdk\platform-tools 目录中，文件以adb开头的三个文件放到adb目录中

中命令行或者powershell中，cd 到adb 目录，

1，  .\adb.exe devices -查看当前在线的设备
2，  .\adb.exe logcat -打印日志



具体步骤：
步骤一：把目录adb-logcat放到任意目录，并打开cmd或powershell窗口
步骤二：输入：cd .\.\adb（进入adb目录）
步骤三：输入：.\adb.exe devices -l（l是L检查手机是否与ADB建立联系，输出设备信息代表成功）
步骤四：输入：.\adb.exe logcat -c（清除日志缓存）
步骤五：输入：.\adb.exe logcat zhxhDebug-:D *:S（输出特定日志并过滤其他无关日志）


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
.\adb.exe logcat | findstr -i zhxhDebug


**********************************************************************

也可以直接双击运行adb-run批处理文件

--------- beginning of main
--------- beginning of system

当出现以上信息时，表示一切准备就绪

- waiting for device -

当出现以上信息时，表示设备未与ADB建立有效连接


