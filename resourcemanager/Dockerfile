FROM doguin/hadoop-base:3.1.3

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENV SPARK_VERSION 2.4.6
ENV SPARK_URL https://mirror-hk.koddos.net/apache/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop-scala-2.12.tgz
ENV SPARK_KEY_URL http://www.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop-scala-2.12.tgz.asc

RUN set -x \
    && curl -OL https://downloads.apache.org/spark/KEYS \
    && gpg --import KEYS \
    && curl -fSL "$SPARK_KEY_URL" -o /tmp/spark.tgz.asc \
    && curl -fSL "$SPARK_URL" -o /tmp/spark.tgz \
    && gpg --verify /tmp/spark.tgz.asc \
    && tar -xvf /tmp/spark.tgz -C /opt/ \
    && rm /tmp/spark.tgz* \
    && mv /opt/spark-$SPARK_VERSION-bin-without-hadoop-scala-2.12 /opt/spark-$SPARK_VERSION \
    && cp /opt/spark-$SPARK_VERSION/conf/spark-env.sh.template /opt/spark-$SPARK_VERSION/conf/spark-env.sh \
    && echo "SPARK_DIST_CLASSPATH='$(hadoop classpath)'" >> /opt/spark-$SPARK_VERSION/conf/spark-env.sh

EXPOSE 8088

CMD ["/run.sh"]
