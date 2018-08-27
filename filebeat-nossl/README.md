# Kubernates filebeat 容器
一个简单的filebeat容器，用于在k8s中收集日志。

# 配置
两个必须的环境变量配置

- LOGSTASH_HOST(logstash的服务器ip或者是域名)
- LOGSTASH_PORT(logstash的端口号)

# 运行容器
## 日志处理
filebeat启动后，所有容器的日志都会被发送到logstash中。

我们应该把容器的数据卷挂载到该容器中
- /var/log
- /var/lib/docker/containers

## k8s中部署filebeat
在k8s中以DaemonSet的方式来部署filebeat,部署的配置模板在deploy文件夹中

```
kubectl create -f ds-filebeat.yml
```
