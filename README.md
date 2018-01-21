# Oray DDNS 脚本

花生壳 DDNS 更新脚本。

### 一、配置安装
配置目录 `oray_ddns/etc`
#### 用户名和密码

```bash
# file: oray_ddns/etc/secret
## 花生壳用户名
username=""
## 花生壳用户密码
password=""
## 花生壳注册的个人域名
my_domain=""
```

#### 服务器及日志

```bash
# file: oray_ddns/etc/config
server="ddns.oray.com"
logfile="${WORKDIR}/log/oray.log"
```

#### 自动任务
放置到 crontab，每 30 分钟执行一次：

```bash
*/30 * * * * /path/to/oray_ddns/oray.sh > /dev/null 2>&1
```

也可以根据实际需求调整执行频率。

### 二、返回码
日志路径：`oray_ddns/log/oray.log`

| 返回码 | 说明 |
|:-----|:--------|
| good | 更新成功，域名的IP地址已经更新，同时会返回本次更新成功的IP，用空格隔开，如：good 1.2.3.4 |
| nochg | 更新成功，但没有改变IP。一般这种情况为本次提交的IP跟上一次的一样|
| notfqdn | 未有激活花生壳的域名|
| nohost | 域名不存在或未激活花生壳|
| nochg | 更新成功，但没有改变IP。一般这种情况为本次提交的IP跟上一次的一样|
| abuse | 请求失败，频繁请求或验证失败时会出现|
| !donator | 表示此功能需要付费用户才能使用，如https|
| 911 | 系统错误|

### 三、参考链接
http://service.oray.com/question/3820.html
