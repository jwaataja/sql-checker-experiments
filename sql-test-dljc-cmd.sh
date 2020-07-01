#!/bin/sh

## This is an example "one-command with no arguments" script that controls run-dljc.sh. It is copied directly
## from the experiments for the Continuous Compliance paper. If you want to re-use this script, you'll have to change
## different things depending on what you're doing differently:
# * If you are running on a non-CSE machine, change the definitions of JAVA11_HOME and JAVA8_HOME.
# * EVERYONE must change the definitions of CHECKERFRAMEWORK and ANDROID_HOME. Setting ANDROID_HOME is optional.
# * EVERYONE must change all instances of "securerandom" in this file to the name of the .list file containing your target repositories.
# * If you are running a checker other than the no-literal checker, change the -c, -q, -l, and -s arguments to run-dljc.sh to make sense
#   for the checker you are running.
# * Make sure that all the absolute paths in this file match your machine/experimental directory.

export JAVA11_HOME=/usr/lib/jvm/openjdk-11
export JAVA8_HOME=/usr/lib/jvm/openjdk-8
export JAVA_HOME=${JAVA11_HOME}
export CHECKERFRAMEWORK=/home/jason/jsr308/checker-framework

tout=600 # 10 minutes

rm -rf sql-test-results

bash run-dljc.sh -o sql-test \
 -i /home/jason/git/sql-checker-experiments/sql-test.list \
 -c org.checkerframework.checker.sql.SqlChecker \
 -t ${tout}
