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
# Logstash配置

logstash端日志接收配置

```
input {
 beats {
   port => 5044
  }
}

filter {
  if [fields][program] == "filebeat_k8s" {
    mutate {
      rename => { "log" => "message" }
    }
    grok {
      match => { "source" => "/var/log/containers/%{DATA:k8s_pod}_%{DATA:k8s_namespace}_%{GREEDYDATA:k8s_service}-%{DATA:k8s_container_id}.log" }
      remove_field => ["source"]
    }
  }
}
output {
  elasticsearch {
    hosts => ["127.0.0.1:9200"]
    index => "kube-%{+YYYY.MM.dd}"
  }
}
```