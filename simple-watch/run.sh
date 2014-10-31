
export ZK_HOME=/Applications/zookeeper-3.5.0-alpha
export CLASSPATH=.:$ZK_HOME/zookeeper-3.5.0-alpha.jar:$ZK_HOME/lib/slf4j-api-1.7.5.jar:$ZK_HOME/lib/slf4j-log4j12-1.7.5.jar:$ZK_HOME/lib/log4j-1.2.16.jar:$ZK_HOME/conf
java Executor localhost /stuff output.txt ls

