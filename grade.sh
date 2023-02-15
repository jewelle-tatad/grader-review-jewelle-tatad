CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -e ListExamples.java ]]
then
    echo 'ListExamples.java found!!'
else
    echo 'ListExamples.java not found. Please check that ListExamples.java is in your submission.'
    exit
fi

cd ..

cp student-submission/ListExamples.java ./

pwd

javac -cp $CPATH *.java

if [[ $? -eq 0 ]]
then
    echo 'Files successfully compiled!!'
else
    echo 'Compilation error!!'
    exit
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > grade.txt

