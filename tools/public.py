import os, sys, shutil, time, re, linecache, requests
from configparser import ConfigParser
from subprocess import run

ppl1 = """
................... 欢迎使用 PPL Jmeter ...................
.                                                         .
.     ************     ************     ****              .
.     *** V1.1 ***     *** V1.1 ***     ****              .
.     ***      ***     ***      ***     ****              .
.     ************     ************     ****              .
.     ****             ****             ****              .
.     ****             ****             ****              .
.     ****             ****             *************     .
.     ****             ****             *************     .
...........................................................
"""
ppl2 = """
.........................阿弥陀佛..........................
                         _oo0oo_
                        o8888888o
                        88" . "88
                        (| -_- |)
                        0\\  =  /0
                     ___/‘---’\\___
                    .' \\|       |/ '.
                   / \\\\|||  :  |||// \\
                  / _||||| -卍-|||||_ \\
                 |   | \\\\\\  -  /// |   |
                 | \\_|  ''\\---/''  |_/ |
                 \\  .-\\__  '-'  ___/-. /
               ___'. .'  /--.--\\  '. .'___
           ."" ‘<  ‘.___\\_<|>_/___.’>’ "".
         | | :  ‘- \\‘.;‘\\ _ /’;.’/ - ’ : | |
           \\  \\ ‘_.   \\_ __\\ /__ _/   .-’ /  /
      =====‘-.____‘.___ \\_____/___.-’___.-’=====
                         ‘=---=’
......................佛祖保佑 ,永无BUG....................
"""


def ppl_print(txt, chart=False, sleep=0.1, exe=False):
    txt = str(txt)
    if chart:  # 打印图案
        for i in txt.split('\n'):
            print(f' PPL--->：{i}')
            time.sleep(sleep)
        return 1
    msg = ' PPL--->：' + txt.replace('\n', '\n PPL--->：')
    if exe:  # exe 打印
        if 'linux' in sys.platform:
            count = 5
            for i in range(5):
                print(f'{msg}\n PPL--->：{count}s后自动退出程序！')
                time.sleep(1)
                count -= 1
        else: input(f'{msg}\n PPL--->：请按任意键退出！')
        return sys.exit(0)
    print(msg)
    return msg


def ppl_exists(file, isfile=False, isdir=False, exe=False):
    """ 判断目录或文件是否存在 """
    result = os.path.exists(file)
    if isfile: result = os.path.isfile(file)
    if isdir: result = os.path.isdir(file)
    if exe and not result: ppl_print(f'Error 文件路径不存在：{file}', exe=exe)
    return result


def ppl_remove(path_list: list):
    """ 递归删除文件夹及子目录文件 """
    for path in path_list:
        if ppl_exists(path, isdir=True):
            path_dir = os.listdir(path)
            for f in path_dir:
                filepath = os.path.join(path, f)
                if ppl_exists(filepath, isfile=True): os.remove(filepath)
                elif ppl_exists(filepath, isdir=True): shutil.rmtree(filepath, True)
            shutil.rmtree(path, True)
        if ppl_exists(path, isfile=True): os.remove(path)
    return 1


def ppl_red(file, w=0, new_txt=None, line=False):
    ppl_exists(file, exe=True)
    if line and isinstance(line, int):
        html_txt = linecache.getline(file, line).split('统计详情')[0]
        report_list = re.findall('center">(.+?)</td>', html_txt)
        return report_list
    if w and new_txt:
        with open(file, 'w', encoding='utf-8')as f:
            f.write(new_txt)
        return 'ok'
    with open(file, encoding='utf-8')as f:
        return f.read()


def ppl_param(mini, exe=False):
    """ 获取命令行传参，注意是逗号分割 """
    argv = sys.argv[1:]
    ppl_print(f'自定义参数个数为：{len(argv)} | {argv}')
    if len(argv) < mini:
        ppl_print(f'命令行参数不符合，当前<{mini}', exe=exe)
        sys.exit(0)
    return argv


def ppl_cmd(cmd_str='', echo_print=1):
    """
    执行cmd命令，不显示执行过程中弹出的黑框
    备注：subprocess.run()函数会将本来打印到cmd上的内容打印到python执行界面上，所以避免了出现cmd弹出框的问题
    :param cmd_str: 执行的cmd命令
    :param echo_print: 打印信息
    :return:
    """
    if echo_print == 1:
        print(' PPL--->：执行cmd指令="{}"'.format(cmd_str))
    run(cmd_str, shell=True)


def ppl_notice(txt, key=None):
    """
    txt：消息内容
    key：机器人key
    """
    if not key: return '命令行未配置推送key,本次不推送测试结果！'
    # 默认企微推送
    request_data = {
        'method': 'POST',
        'url': f'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key={key}',
        'json': {
            'msgtype': 'news',
            'news': {'articles': txt}
        }}
    # 如果是钉钉推送需要改动以下，钉钉key=64长度
    if len(key) == 64:
        txt = txt[0]
        request_data['url'] = f'https://oapi.dingtalk.com/robot/send?access_token={key}'
        dd_url = f'![screenshot]({txt.get("picurl")})'
        dd_txt = txt.get('description').replace('\n', '\n\n')
        dd_txt = dd_txt.replace('(点击查看报告详情)', '')
        request_data['json'] = {
            "msgtype": "actionCard",
            "actionCard": {
                "title": txt.get('title'),
                "text": f"{dd_url}{txt.get('title')}{dd_txt}[点击查看报告详情]({txt.get('url')})"
            }}
    return requests.request(**request_data).json()


def ppl_read_cnf(file=None):
    """ 读取 ini 配置文件 """
    config_file = os.path.join(os.getcwd(), 'config.ini')
    if not os.path.exists(config_file): return f'Error config.ini文件路径不存在：{config_file}'
    file = file if file else config_file
    config = ConfigParser()
    config.read(file, encoding="utf-8")
    return config


def ppl_get_key(config, key, value):
    """
    获取config参数
    """
    try:rsp = config.get(key, value)
    except:
        rsp = None
        ppl_print(f'Error 获取config配置不存在：config.get({key}, {value})')
    return rsp
