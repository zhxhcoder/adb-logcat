因为公司测试大多采用Windows电脑，而且往往不会安装Android开发环境，所以为方便测试人员测试埋点信息，就把相关工具集成，双击adb-run.bat就可以直接实时看日志输出。

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


**********************************************************************
测试一定要测试混淆后的效果，但是因为以下代码混淆后app将不再显示log。

#混淆优化，混淆后log函数自动去掉
#-dontoptimize不要优化的意思，导致混淆优化失效，所以不能有这个配置
-assumenosideeffects class android.util.Log {
	public static boolean isLoggable(java.lang.String, int);
	public static int v(...);
	public static int i(...);
	public static int w(...);
	public static int d(...);
	public static int e(...);
}

可以删除该段代码，但是就需要单独给测试一个包，而且也可能会影响其他功能，排除。
可以System.out.println代替，用一个特殊的前缀，进行过滤，并客户端能配置是否展示日志，采用。
