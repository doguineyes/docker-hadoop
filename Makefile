DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
# current_branch := $(shell git rev-parse --abbrev-ref HEAD)
current_branch := 3.1.3
build:
	docker build -t doguin/hadoop-base:$(current_branch) ./base
	docker build -t doguin/hadoop-namenode:$(current_branch) ./namenode
	docker build -t doguin/hadoop-datanode:$(current_branch) ./datanode
	docker build -t doguin/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t doguin/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t doguin/hadoop-historyserver:$(current_branch) ./historyserver
