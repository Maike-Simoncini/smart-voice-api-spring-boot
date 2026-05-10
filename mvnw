#!/bin/sh
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Maven Wrapper startup script for Unix
#
# Optional ENV vars
# ------------------
# JAVA_HOME - location of a JDK home dir
# MAVEN_OPTS - parameters passed to the Java VM when running Maven
#     e.g. to debug Maven itself, use
#     set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
# ----------------------------------------------------------------------------

case "`uname`" in
  CYGWIN*) cygwin=true ;;
  MINGW*) mingw=true ;;
  Darwin*) darwin=true ;;
esac

## resolve links - $0 may be a link to Maven's home
PRG="$0"

while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG="`dirname "$PRG"`/$link"
  fi
done

saveddir=`pwd`

SET_MAVEN_PROJECT_BASEDIR() {
  MAVEN_PROJECT_BASEDIR=`pwd`
  while [ "$MAVEN_PROJECT_BASEDIR" != "/" ] && [ ! -d "$MAVEN_PROJECT_BASEDIR/.mvn" ]; do
    MAVEN_PROJECT_BASEDIR=`dirname "$MAVEN_PROJECT_BASEDIR"`
  done
  export MAVEN_PROJECT_BASEDIR
}

SET_MAVEN_PROJECT_BASEDIR

DIRNAME=`dirname "$PRG"`

# OS specific support. $var _must_ be set to either true or false.
cygwin=false;
darwin=false;
mingw=false;
case "`uname`" in
  CYGWIN*) cygwin=true ;;
  Darwin*) darwin=true ;;
  MINGW*) mingw=true ;;
esac

if [ -z "$JAVA_HOME" ] ; then
  if [ -r /etc/gentoo-release ] ; then
    JAVA_HOME=`java-config --jre-home`
  fi
fi

if [ -z "$JAVA_HOME" ] ; then
  if $darwin; then
    if [ -x /usr/libexec/java_home ]; then
      JAVA_HOME=`/usr/libexec/java_home`
    fi
  fi
fi

if [ -z "$JAVA_HOME" ] ; then
  javaExecutable="`which java 2>/dev/null`"
  if [ -z "$javaExecutable" ] ; then
    echo "Error: JAVA_HOME is not defined correctly."
    echo "  We cannot execute $javaExecutable"
    exit 1
  fi
  JAVA_HOME="`dirname \"$javaExecutable\"`/.."
fi

if [ -z "$JAVACMD" ] ; then
  JAVACMD="$JAVA_HOME/bin/java"
fi

if [ ! -x "$JAVACMD" ] ; then
  echo "Error: JAVA_HOME is not defined correctly."
  echo "  We cannot execute $JAVACMD"
  exit 1
fi

if [ -z "$MAVEN_HOME" ] ; then
  MAVEN_HOME="$DIRNAME/.mvn/wrapper"
fi

WRAPPER_JAR="$MAVEN_HOME/maven-wrapper.jar"
WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

if [ ! -r "$WRAPPER_JAR" ]; then
  echo "Error: Could not find maven-wrapper.jar"
  exit 1
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
  [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] && CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

# For Darwin, add extra options
if $darwin; then
  MAVEN_OPTS="$MAVEN_OPTS -Xdock:name=Maven"
fi

exec "$JAVACMD" \
  $MAVEN_OPTS \
  -classpath "$WRAPPER_JAR" \
  "-Dmaven.multiModuleProjectDirectory=$MAVEN_PROJECT_BASEDIR" \
  $WRAPPER_LAUNCHER "$@"
