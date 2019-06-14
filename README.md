# distribute-R-tasks-with-pure-R

Hao Li

Functions to distribute R tasks with pure R

contains codes and notations to run R from a remote machine with a cloud disk.

## Scenarios

Imagine you have 1 or more very powerful computers that are not portable, and 1 or more portable computers or tablets that are not capable of running R at high speed. Is it possible to deploy R tasks remotely through a cloud disk, without using SSH or Putty or other services?


## How to use it (current version)?

1. Set up a cloud disk and a shared folder on 2 of your computers. You can use Microsoft OneDrive, Dropbox, NutShell, and any other storage services that enables the shared folder option. It is recommended that you use the same path for the shared folder.
For example, I create a shared folder called "E:\SharedCalc"
and then create a folder for my mission "E:\SharedCalc\demo"

2. Copy the getMission.R file to the folder, set working directory (for any computers involved for the task) to source file location.
You can do this with setwd() function.

Within R:
```r
setwd("E:\\SharedCalc\\demo")
```
3. From the worker computer (as secondary workers), run code below:
```r
getMission()
```
4. From another computer (computer, I mean, anything that have a text editor), create a file called "task1.R" containing the following code (You don't even need to have R installed in this machine):

```r
png()
plot(iris)
dev.off()
```
save in the path, don't run it.

5. As the web disk updates, you will see task1 is running on the worker computer. You will see the plot of iris saved in the path, in this case
"E:\SharedCalc\demo\Rplot001.png"

The next task is to be named task2.R and so on.

## Parallelism?


The functions currently do not support cross-machine parallel computing, all it does is commuting through existing files in a folder. This can be helpful for large scale independent works but useless for extending computer memory.

Still you can run 1-machine parallel computing with R. Config each computer (don't do it with tasks, do in advance):

```r

library(foreach)
library(doParallel)
registerDoParWorkers(4)# using 4, in most cases we expect a parallel loop to be accelerated by 2.5x, timed with my 3 PCs
```

## More than 1 remote machines?

Option to avoid overlaps of tasks for more than 1 machines is to be done. Feel free to drop a message on the issues box.



