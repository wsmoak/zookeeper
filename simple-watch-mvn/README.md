Apache ZooKeeper Simple Watch Example with Maven
=========

The [Apache ZooKeeper](http://zookeeper.apache.org) coordination service helps you with maintaining configuration information,
naming, providing distributed synchronization, and providing group services for distributed applications. 

This project was inspired by the [Hacker School](http://www.hackerschool.com) Paper of the Week on Google's
[Chubby Lock Service for Loosely-Coupled Distributed Systems](https://www.hackerschool.com/blog/49-paper-of-the-week-the-chubby-lock-service-for-loosely-coupled-distributed-systems).

Here I expand on the "Simple Watch Client" provided in the ZooKeeper docs, and turn it into a full running example, built with Maven.

## Read These First:

- http://zookeeper.apache.org/doc/trunk/zookeeperStarted.html (Download, configure, start, and use the CLI)
- http://wiki.wsmoak.net/cgi-bin/wiki.pl?ZooKeeperGettingStarted (My notes on getting started)
- http://zookeeper.apache.org/doc/trunk/javaExample.html (Detailed explanation of the code in this example project)

## Prerequisites

[Download](http://zookeeper.apache.org/releases.html) an Apache ZooKeeper .tar.gz file and unpack it.

(I used Apache ZooKeeper 3.5.0-alpha and put it under /Applications.)

You'll need a running ZooKeeper server and a way to connect and modify znodes.

The quickest way to get that is to use the `zkServer.sh` and `zkCli.sh` scripts in the bin directory of the .tar.gz distribution.

I suggest running `bin/zkServer.sh start-foreground` so you can see the output (and not forget that it's running).

For more information on the server and command line interface scripts, see http://zookeeper.apache.org/doc/trunk/zookeeperStarted.html

## Running This Example

Assuming you have the server and CLI running, in this project:

  mvn install
  
  mvn exec:java
  
The command it runs is:  `java Executor localhost /stuff output.txt src/main/scripts/count.sh`

The arguments are:

- 'localhost' - This tells it that the server is on localhost (at the default 2181 port)

- '/stuff' - This is the znode it is going to watch

- 'output.txt' - The name of the text file it will update with the contents of the znode. (It just writes to the current directory.)

- 'src/main/scripts/count.sh' - The program it will start/stop/restart.  This is a trivial script that simply counts up with a five second delay, 
and displays the contents of its "configuration file".

Once the Watcher/Executor is running, you'll need to use a client to modify the znode you told it to 'watch' (/stuff in this case).

In the terminal window with your CLI, execute:

    ] create /stuff my_data

You should see the Watcher/Executor example run your program, './count.sh' in this case, which prints consecutive integers starting with 1.

You should also see the output.txt file appear, with the contents 'my_data' (from above when you created it).  Now modify the znode:

    ] set /stuff other_data

You should see the Watcher/Executor example stop and start your program.  In this case it will stop counting and then start over at 1.

You should also see the contents of the output.txt file change to 'other_data', the new contents of the znode.

Try setting the znode to another string of text and see what happens.

    ] delete /stuff

You should see the Watcher/Executor example say "Killing process" and the script should stop counting.

For more information on the command line interface, see http://zookeeper.apache.org/doc/trunk/zookeeperStarted.html

## Sample Output

In the command line interface

    [zk: localhost:2181(CONNECTED) 16] create /stuff my_data
    Created /stuff
    [zk: localhost:2181(CONNECTED) 17] set /stuff other_data
    [zk: localhost:2181(CONNECTED) 18] delete /stuff

In the running the watcher example

    2014-11-01 11:05:43,908 [myid:] - INFO [main-SendThread(localhost:2181):ClientCnxn$SendThread@1346] - 
    Session establishment complete on server localhost/127.0.0.1:2181, sessionid =
    0x1496bca44fe0002, negotiated timeout = 4000
    Starting child
    Count: 1 using my_data
    Count: 2 using my_data
    Count: 3 using my_data
    Count: 4 using my_data
    Stopping child
    Starting child
    Count: 1 using other_data
    Count: 2 using other_data
    Count: 3 using other_data
    Killing process

## Cleanup

  mvn clean 
  
deletes the target directory and the output.txt file
