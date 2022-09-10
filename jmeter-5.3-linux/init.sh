chmod 777 ant/bin/ant && chmod 777 ../build && chmod 777 ../docker-build && chmod 777 lib/ext/JMeterPluginsCMD.sh

# Jenkins 持续集成(上述ant、build需先授权777权限)

# 1、如果遇到Jenkins提示无权限，则：chmod 777 jmeter-5.3-linux/*

# 2、运行：./build env,key,add_param:value1,${BUILD_URL}/InterfaceReport,x.jmx
