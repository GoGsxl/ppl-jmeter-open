import json
from public import *


def ppl_setup(jmxs, env, argv_list=[]):
    """ 前置：禁用非使用环境的变量，启用使用的环境变量
    env：环境匹配，jmx格式为 定义环境变量--env
    argv_list：追加的替换参数
    """
    # 替换 *.jmx
    if env == 'default': return 0
    for jmx in jmxs:
        txt = ppl_red(jmx)
        env_list = re.findall('定义环境变量--(.+?)\" enabled', txt)
        for e in env_list:
            re_e = f'定义环境变量--{e}" enabled="'
            if e == env:
                txt = txt.replace(f'{re_e}false', f'{re_e}true')
            else:
                txt = txt.replace(f'{re_e}true', f'{re_e}false')
        for k in argv_list:
            key = k.split(':')[0]
            value = k.split(':')[1]
            old_re = f'Argument.name">{key}</stringProp>\n            <stringProp name="Argument.value">(.+?)</stringProp'
            new = f'Argument.name">{key}</stringProp>\n            <stringProp name="Argument.value">{value}</stringProp'
            txt = re.sub(old_re, new, txt)
        ppl_red(jmx, w=1, new_txt=txt)
    return 1


def ppl_post(env, argv_list=[], report_list=[], key=None, url=None, html=None, jmx='*.jmx'):
    """ 后置：读取报告推送消息
    env：执行的环境
    param：追加的参数
    report_list：报告统计数据
    key：机器人key
    url：在线报告链接，如果没有则是 ppl 博客园
    """
    url = url if url else 'https://blog.csdn.net/qq_42675140'
    html = html if html else 'InterfaceReport.html'
    report_list = report_list if report_list else ppl_red(html, line=303)
    count = report_list[0]
    failed = report_list[1]
    success_rate = report_list[2]
    avg_time = report_list[3]
    success = int(count) - int(failed)
    txt = f'\n成功比例：{success_rate}\n接口总数：{count}'
    if argv_list: txt = f'执行脚本：{jmx}\n附加参数：{json.dumps(argv_list)}{txt}'
    txt += f'\n成功数量：{success}\n失败数量：{failed}\n平均耗时：{avg_time}'
    blog_url = 'https://img-blog.csdnimg.cn'
    desc = {
        'title': f'Api冒烟测试：{env}',
        'description': f'{txt}\n(点击查看报告详情)',
        'url': url,
        'picurl': f'{blog_url}/956d5239cf4f4a9eae841730fa7d29ca.jpeg'
    }
    if int(failed) > 0: desc['picurl'] = f'{blog_url}/f48e82d6abc34690a8483445e139711b.jpeg'
    return f'{txt}\n推送结果：{ppl_notice([desc], key)}'


def main(exe, env, key=None, argv_list=[], url=None, jmx=None, jtl=None):
    """
    exe：是否是 exe 运行
    env：运行的环境，需要与 jmeter 定义环境变量使用匹配
    jmx：运行的脚本，全部全部则：*.jmx
    argv_list：附加的替换参数
    key：机器人key
    xml：ant build 时使用的 xml 文件
    url：在线报告链接，如果没有则是 ppl 博客园
    """
    conf = ppl_read_cnf()
    env = env if env else ppl_get_key(conf, 'jmeter', 'tested')
    jmx = jmx if jmx else ppl_get_key(conf, 'jmeter', 'jmx')
    if not env: env = 'default'
    if not jmx: jmx = '*.jmx'
    jmeter, xml = 'jmeter-5.3-win', 'build.xml'
    jmxs = [file for file in os.listdir() if '.jmx' in file]
    # 判断是在 win or linux 下运行
    if 'linux' in sys.platform: jmeter = 'jmeter-5.3-linux'
    # 判断是否是 exe 执行，是则路径需要以当前执行路径为基准
    project_path = os.getcwd()
    if exe: project_path = os.path.dirname(os.path.abspath(sys.executable))
    # jmeter home 目录
    jmeter_path = os.path.join(project_path, jmeter)
    # 文件不存，打印日志退出程序
    xml_path = os.path.join(jmeter_path, xml)
    ppl_exists(jmeter, isdir=True, exe=True)
    ppl_exists(xml_path, isfile=True, exe=True)
    if jmx != '*.jmx' and jmx not in jmxs: ppl_print(f'Error 文件路径不存在：{jmx}', exe=True)
    # 修改 build.xml 文件，指定运行的 jmx
    build_txt = ppl_red(xml_path)
    ppl_red(xml_path, w=1, new_txt=build_txt.replace('*.jmx', jmx))
    # todo 1、前置，替换环境变量及运行的jmx文件
    ppl_setup(jmxs, env, argv_list)
    # todo 2、build jmeter ant
    ant = os.path.join(jmeter_path, 'ant', 'bin', 'ant')
    ppl_exists(ant, isfile=True, exe=True)
    ppl_cmd(f'{ant} -buildfile {xml_path}', 1)
    # 运行后还原：xml 文件
    ppl_red(xml_path, w=1, new_txt=build_txt.replace(jmx, '*.jmx'))
    # 获取 jmeter 的缓存文件删除
    jmeter_jtl = os.path.join(jmeter_path, 'jtl', 'InterfaceReport.jtl')
    jmeter_log = os.path.join(jmeter_path, 'bin', 'jmeter.log')
    jmeter_jtl_dir = os.path.join(jmeter_path, 'jtl')
    # 生成 CSV
    JMeterPluginsCMD = 'JMeterPluginsCMD.bat'
    if 'linux' in sys.platform: JMeterPluginsCMD = 'JMeterPluginsCMD.sh'
    run_bat = os.path.join(jmeter_path, 'lib', 'ext', JMeterPluginsCMD)
    csv_report = f'ppl_report.csv'
    ppl_cmd(fr'{run_bat} --generate-csv {csv_report} --input-jtl {jmeter_jtl} --plugin-type SynthesisReport', 1)
    if not jtl: ppl_remove([jmeter_jtl_dir, jmeter_log])
    # todo 3、后置，读取报告推送消息
    push_msg = ppl_post(env, argv_list, key=key, url=url, jmx=jmx)
    return f'运行已成功！{push_msg}'


if __name__ == '__main__':
    # 获取命令行传参
    ppl_print(ppl1, True, 0.02)
    exe_, env_, jmx_, argv_, key_, url_, jtl_ = False, None, None, [], None, None, None
    if getattr(sys, 'frozen', False): exe_ = True
    argv = ppl_param(0, exe=exe_)
    if '--jtl' in argv: jtl_ = True
    if len(argv) >= 1: env_ = argv[0]
    if env_ in ['-h', 'h', 'help', '--h', '--help']:
        ppl_print('build help：env key param1:value1__param2:value2 build_url xx.jmx', exe=True)
    if len(argv) >= 2: key_ = argv[1]
    if len(argv) >= 3: argv_ = argv[2].split('__')
    if len(argv) >= 4: url_ = argv[3]
    if len(argv) >= 5: jmx_ = argv[4]
    msg = main(exe_, env_, key_, argv_, url_, jmx_, jtl_)
    ppl_print(ppl2, True, 0.01)
    ppl_print(msg)
    ppl_print('', exe=exe_)
    # python tools/build.py env key param1:value1__param2:value2 build_url xx.jmx
