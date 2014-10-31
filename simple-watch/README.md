Apache ZooKeeper Simple Watch Example
=========

see http://zookeeper.apache.org/doc/trunk/javaExample.html

Download the Apache ZooKeeper .tar.gz file and unpack it (mine is under /Applications)

Modify the build.sh and run.sh files with your path to the ZooKeeper install.

$ ./build.sh - compiles the two source code files

$ ./run.sh - sets the CLASSPATH and runs the Executor class with the command:

$ java Executor localhost /stuff output.txt ls

Once this is running, you'll need to use a client to modify the znode you told it to 'watch' (/stuff in this case).

In another terminal window, change to the ZooKeeper installation directory and execute:

$ bin/zkCli.sh -server 127.0.0.1:2181

[zk: 127.0.0.1:2181(CONNECTED) 5] create /stuff my_data

You should see the Watcher/Executor example run your program, 'ls' in this case.

You should also see the output.txt file appear, with the contents 'my_data' (from above when you created it).

[zk: 127.0.0.1:2181(CONNECTED) 6] delete /stuff

You should see the Watcher/Executor example say "Killing process".  It's intended to start a program that stays running,
and then restart or kill it later, so 'ls' is not the best example here.

$ ./clean.sh - deletes the *.class files and the output.txt file

If you're having classpath problems (NoClassDefFoundError) 
see http://docs.oracle.com/javase/7/docs/technotes/tools/windows/classpath.html
