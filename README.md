
# Kubernetes Filebeat Container
这里包含两个kubernates上收集日志的Filebeat容易，通过这两个容器可以将日志从Filebeat->logstash->elasticsearch>kibana。
这两个容易一个采用Filebeat和logstash双向ssl验证加密传输，而另一个的容器filebeat和logstash之间为采用任何加密传输方式。
对于加密传输的方式，可以实现跨机房的数据安全传输。而未加密的方式一般适用于elk部署在内网环境。
# Configuration


# Running the Container