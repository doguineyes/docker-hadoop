FROM openjdk:8

# Use chinese apt mirror
COPY sources.list /etc/apt/sources.list

# Delete net-tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
	curl \
	netcat \
&& rm -rf /var/lib/apt/lists/*

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS \ 
	&& gpg --import KEYS

ENV HADOOP_VERSION 3.1.3
ENV HADOOP_URL http://mirror-hk.koddos.net/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_KEY_URL http://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
	&& curl -fSL "$HADOOP_KEY_URL.asc" -o /tmp/hadoop.tar.gz.asc \
	&& curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
	&& gpg --verify /tmp/hadoop.tar.gz.asc \
	&& tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
	&& rm /tmp/hadoop.tar.gz* \
	&& ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
	&& mkdir /opt/hadoop-$HADOOP_VERSION/logs \
	&& mkdir /hadoop-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
