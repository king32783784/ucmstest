# ucmstest

# 简介
   测试基于RobotFramework实现，Robot Framework是一种基于python的关键字驱动自动化测试框架,通过测试库中实现的关键字驱动被测软件。测试启动、测试流程控制、用例组织、测试报告都采用原生的RF框架
   
   本次基于域管用例的特点，进行了关键字的扩展，主要包括多终端执行、配置文件读取，并针对域管web端的特点对RF本身自带的selenium库进行了扩展。
   robotlib目录下为扩展的关键字库，包括CmsBase、MultiClient、SeleniumLibrary；
   CmsBase:辅助测试库，比如配置文件读取、上传文件窗口处理等；
   MultiClient:终端执行库，支持用例控制、用例执行分离，客户端只需部署MultiClient及对应依赖即可
   Selenium: 原生Selenium库，主要针对重复元素进行关键字的扩展
   
   cmstest目录下为RF格式的用例和自定义关键字
   

# 安装
   #### 测试控制端
   1.需要安装RF库及ride；
   2.安装对应的依赖库:
      pip install -r requirements.txt
   3.将新增的库放到python对应site-packages目录下
   #### 客户端
   1.将MultiClient 复制到客户端，安装对应的依赖库：
    pip install -r requirements.txt
   2.进入auto_basic_server目录，运行
    python3 main.py
    当看到如以下信息时，说明客户端已正常启动
[2020-11-16 17:51:59] [INFO] [_internal.py _log:88]  * Running on http://0.0.0.0:20000/ (Press CTRL+C to quit)
[2020-11-16 17:51:59] [INFO] [_internal.py _log:88]  * Restarting with stat
[2020-11-16 17:51:59] [INFO] [main.py <module>:23] 开始运行BASIC_SERVER,端口:20000...
[2020-11-16 17:51:59] [WARNING] [_internal.py _log:88]  * Debugger is active!
[2020-11-16 17:51:59] [INFO] [_internal.py _log:88]  * Debugger PIN: 668-748-129

    
  
# 执行
   用例执行方式和RF一样，可以用RIDE直接运行
   
# 帮助
   直接参考https://robotframework.org/
