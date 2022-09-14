## PPL-Jmeter
    build.exe：   Windows使用
    build：       linux使用 非docker-jenkins部署
    build-docker：linux使用 docker-jenkins部署

### 流程图
![十尾仙狸 --扬帆起航-博客园](https://img-blog.csdnimg.cn/7b4864d356804738b05451626646c727.png "PPL博客园")

1、Windows(默认配置)双击运行：`build.exe`

2、Windows命令行执行：build.exe params 格式如下(win及linux一致)

    格   式：build.exe env,key,param1:value1,url,jmx

    参数说明：
        env：环境唯一标识,详细看 `jmx编写规范`
        key：机器人推送的key(企微)
        param1:value1：追加的参数替换(多个时使用2个下划线连接`__`),如 k:v__k1:v1
        url：推送的在线报告链接,通常用于jenkins持续集成生成的报告链接
        jmx：指定运行的jmx文件(默认为项目根目录的所有jmx)如：demo.jmx,通常不需要改变

    注意事项：`不要改变jmeter目录及文件,否则build不起来别怪我不提醒`

3、`start_jmeter.vbs`是Windows下运行jmeter\bin\ApacheJMeter.jar

### 二、Jmeter jmx 编写规范
使用本软件必须遵循以下规范,否则会影响你的使用体验！可查阅tools\demo.jmx规范更清晰！
    
    1、jmx环境变量必须使用`用户定义的变量`,如：①定义环境变量--test ②定义环境变量--pro
       其中`test`、`pro`为自定义的环境唯一标识。
    使用场景：可根据命令行匹配指定执行的环境
    
    2、追加替换的参数,比如demo中`用户定义的变量`的`add_param`,使用时命令行追加替换
       如：build.exe pro,k1:v1__k2:v2,key
    使用场景：环境变量中需要运行时动态更换参数,进行测试~

### 三、build使用文档
1、场景：适用`Windows`用户

    1、直接双击运行：`build.exe`,默认执行当前所有的jmx,不做任何环境切换及替换
    
    2、指定test环境执行cmd：build.exe pro
       `可接更多参数,请查阅本文档开始的`参数格式说明`

2、场景：适用`Linux`用户
    
    pwd=./ppl-jmeter

    1、777权限设置：chmod 777 jmeter-5.3-linux/ant/bin/ant 

    2、777权限设置：chmod 777 build 
    
    3、运行demo：./build `可接更多参数,请查阅本文档开始的`参数格式说明`

3、场景：使用`Windows/Linux` Jenkins持续集成 [点击查看博客园](https://blog.csdn.net/qq_42675140/article/details/126783757 "PPL博客园")
    
    1、结合上述1-2 Windows/Linux场景 先尝试简单跑通,您可能会遇到的问题：

       1)Linux下操作权限不足：chmod 777 `提示没权限的文件或目录`

       2)提示无 java 环境？安装环境即可，因为Jmeter是java程序所以依赖它

    2、Jenkins设置及报告、参数化请查阅博客进行~

## [十尾仙狸 博客园，有问题看我的简介"有话好好说"](https://blog.csdn.net/qq_42675140 "PPL博客园")

github：[https://github.com/ppl-jmeter-open](https://github.com/git-gsxl/ppl-jmeter-open)

gitee ：[https://gitee.com/ppl-jmeter-open](https://gitee.com/qq772262624/ppl-jmeter-open)

如果觉得还可以请点个**star**！
