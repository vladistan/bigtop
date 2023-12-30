echo Building:


export JAVA_HOME=/usr/lib/jvm/java-1.8.0/

echo "JOB: ${GO_JOB_NAME}"

./gradlew "${GO_JOB_NAME}" -Dbuildwithdeps=true -PparentDir=/usr/bigtop -PpkgSuffix

find output -type f

tar -C output -czf "${GO_JOB_NAME}".tgz .

ls -ltra "${GO_JOB_NAME}".tgz