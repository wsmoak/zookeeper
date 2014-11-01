Apache ZooKeeper Simple Watch Example
=========

see http://zookeeper.apache.org/doc/trunk/javaExample.html

Prerequisites:  

Download the Apache ZooKeeper .tar.gz file and unpack it (mine is under /Applications)

You'll need a running ZooKeeper server and a way to connect and modify znodes.

The quickest way to get that is to use the bin/zkServer.sh and bin/zkCli.sh scripts in the .tar.gz distribution.

For more information on the server and command line interface scripts, see http://zookeeper.apache.org/doc/trunk/zookeeperStarted.html

Running The Example:

Assuming you have the server and CLI running, in this project:

Modify the build.sh and run.sh files with your path to the ZooKeeper install.

$ ./build.sh - compiles the two source code files

$ ./run.sh - sets the CLASSPATH and runs the Executor class with the command:

$ java Executor localhost /stuff output.txt ./count.sh

The arguments are:

'localhost' - This tells it that the server is on localhost (at the default 2181 port)

'/stuff' - This is the znode it is going to watch

'output.txt' - The name of the text file it will update with the contents of the znode. (It just writes to the current directory.)

'./count.sh' - The program it will start/stop/restart.  This is a trivial script that simply counts up with a five second delay.

Once the Watcher/Executor is running, you'll need to use a client to modify the znode you told it to 'watch' (/stuff in this case).

In the terminal window with your CLI, execute:

For more information on the command line interface, see http://zookeeper.apache.org/doc/trunk/zookeeperStarted.html

[zk: 127.0.0.1:2181(CONNECTED) 5] create /stuff my_data

You should see the Watcher/Executor example run your program, './count.sh' in this case, which prints integers startng 

You should also see the output.txt file appear, with the contents 'my_data' (from above when you created it).

[zk: 127.0.0.1:2181(CONNECTED) 6] delete /stuff

You should see the Watcher/Executor example say "Killing process" and the script should stop counting.

$ ./clean.sh - deletes the *.class files and the output.txt file

TODO:  How do you modify a znode to see the Watcher/Executor restart the program?

Other Info

If you're having classpath problems (NoClassDefFoundError) 
see http://docs.oracle.com/javase/7/docs/technotes/tools/windows/classpath.html
