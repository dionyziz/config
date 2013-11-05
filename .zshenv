typeset -U path
path=(/usr/local/git/bin /usr/bin /bin /usr/sbin /sbin /usr/local/bin /opt/X11/bin /usr/local/git/bin ~/bin .)
export JAVA_TOOL_OPTIONS="-Dfile.encoding=utf8"
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=128m"
alias java6='export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home'
alias java7='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home'
