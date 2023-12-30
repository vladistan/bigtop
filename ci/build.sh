echo Building:

set -e


export JAVA_HOME=/usr/lib/jvm/java-1.8.0/
export PATH=$PATH:/usr/local/apache-maven-3.8.8/bin:/usr/local/pyenv/bin:/var/go/.pyenv/versions/2.7.18/bin

echo "JOB: ${GO_JOB_NAME}"

which mvn
mvn --version

python2 --version


./gradlew "${GO_JOB_NAME}" -Dbuildwithdeps=true -PparentDir=/usr/bigtop -PpkgSuffix

find output -type f

tar -C output -czf "${GO_JOB_NAME}".tgz .

ls -ltra "${GO_JOB_NAME}".tgz
