FROM oraclelinux:8.4

WORKDIR /opt
RUN yum update -y && yum install -y zip wget libaio

RUN wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basic-linux.x64-21.1.0.0.0.zip -O oracle-basic.zip \
    && wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-sqlplus-linux.x64-21.1.0.0.0.zip -O oracle-sqlplus.zip \
    && wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-tools-linux.x64-21.1.0.0.0.zip -O oracle-tools.zip \ 
    && unzip oracle-basic.zip && unzip oracle-sqlplus.zip && unzip oracle-tools.zip \ 
    && rm -f oracle-basic.zip oracle-sqlplus.zip oracle-tools.zip

ENV ORACLE_HOME=/opt/instantclient_21_1
ENV LD_LIBRARY_PATH=$ORACLE_HOME
ENV SQLPATH=$ORACLE_HOME
ENV PATH=$ORACLE_HOME:$PATH

COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["-V"]
