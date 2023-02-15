CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cp student-submission/ListExamples.java ./

if [[ -e ListExamples.java ]]
then
    echo 'ListExamples.java found!!'
else
    echo 'ListExamples.java not found. Please check that ListExamples.java is in your submission.'
    exit
fi

javac -cp $CPATH *.java 2>error-output.txt

if [[ $? -eq 0 ]]
then
    echo 'Files successfully compiled!!'
else
    echo 'Compilation error!!'
    cat error-output.txt
    exit
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > grade.txt

cat grade.txt

