#!/bin/bash
clear
echo "" > errors.txt
cp gradle_linux.properties gradle.properties
#rm build/libs/vampire_java-all-0.1.0.jar 2> /dev/null
gradle build --stacktrace --warning-mode all > errors.txt 2>&1  && gradle run --warning-mode all>> errors.txt 2>&1 
cat errors.txt
echo "creation jar" && gradle fatJar &&echo "lancement jar" && java -jar app/build/libs/app-all-0.1.0.jar && cat errors.txt && gradle clean test
#echo "creation jar" && gradle fatJar && echo "lancement jar" && java -jar build/libs/systemevil-all-0.1.0.jar  && cat errors.txt
#gradle build --stacktrace >> errors.txt 2>&1  && gradle run >> errors.txt 2>&1

