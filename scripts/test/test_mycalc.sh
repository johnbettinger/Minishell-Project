#!/bin/bash

cd ../../src
rm output.txt

# START TESTING: 
echo "TESTING MYCALC"
# Define global variables
test_passed=0
total_test=0
# TEST 1: ADDITION (NORMAL CASE)



echo "TEST 1: ADDITION: 2 + 2 = 4; Acc 4"
# Remove output to clear its contents
rm output.txt
# Call to the ./msh program and redirect the output(all output) to output.txt
./msh  >> output.txt 2>&1  << EOF
mycalc 2 add 2 
EOF

# Remove the MSH>> parts of the output
remove="MSH>>"
string=$(cat output.txt)
result="${string//$remove}"


echo "[OK] 2 + 2 = 4; Acc 4" > expected.txt
echo $result > actual.txt
diff expected.txt actual.txt > diff.txt
if [ -s diff.txt ]
then
    echo "Test 1 failed :( "
    echo -e "Expected value: \n[OK] 2 + 2 = 4; Acc 4"
    echo "Actual value: "
    echo $result
else
    echo "Test 1 passed :) "
fi

# TEST 2: MULTIPLICATION (NORMAL CASE)
# Remove output to clear its contents
rm output.txt

echo "TEST 2: MULTIPLICATION: 2 * 2 = 4"

# Call to the ./msh program and redirect the output(all output) to output.txt
./msh  >> output.txt 2>&1  << EOF
mycalc 2 mul 2 
EOF

# Remove the MSH>> parts of the output
remove="MSH>>"
string=$(cat output.txt)
result="${string//$remove}"


echo "[OK] 2 * 2 = 4" > expected.txt
echo $result > actual.txt
diff expected.txt actual.txt > diff.txt
if [ -s diff.txt ]
then
    echo "Test 2 failed :( "
    cat diff.txt
    cat output.txt
    echo " "
else
    echo "Test 2 passed :) "
    test_passed=$((test_passed+1))
    
fi
total_test=$((total_test+1))


# TEST 3: DIVISION (REMAINDER 0)
# Remove output to clear its contents
rm output.txt

echo "TEST 3: DIVISON: 2 / 2 = 1; Remaider 0"

# Call to the ./msh program and redirect the output(all output) to output.txt
./msh  >> output.txt 2>&1  << EOF
mycalc 2 div 2 
EOF

# Remove the MSH>> parts of the output
remove="MSH>>"
string=$(cat output.txt)
result="${string//$remove}"


echo "[OK] 2 / 2 = 1; Remainder 0" > expected.txt
echo $result > actual.txt
diff expected.txt actual.txt > diff.txt
if [ -s diff.txt ]
then
    echo "Test 3 failed :( "
    cat diff.txt
    cat output.txt
    echo " "
    
else
    echo "Test 3 passed :) "
    test_passed=$((test_passed+1))
fi
total_test=$((total_test+1))


rm output.txt
rm expected.txt
rm actual.txt
rm diff.txt

# TEST 4: DIVISION (REMAINDER NOT 0)
# Remove output to clear its contents
rm output.txt

echo "TEST 4: DIVISON: 3 / 2 = 1; Remaider 1"

# Call to the ./msh program and redirect the output(all output) to output.txt
./msh  >> output.txt 2>&1  << EOF
mycalc 3 div 2 
EOF

# Remove the MSH>> parts of the output
remove="MSH>>"
string=$(cat output.txt)
result="${string//$remove}"


echo "[OK] 3 / 2 = 1; Remainder 1" > expected.txt
echo $result > actual.txt
diff expected.txt actual.txt > diff.txt
if [ -s diff.txt ]
then
    echo "Test 4 failed :( "
    cat diff.txt
    cat output.txt
    echo " "
    
else
    echo "Test 4 passed :) "
    test_passed=$((test_passed+1))
fi
total_test=$((total_test+1))


# TEST 5: DIVISION BY 0 
# Remove output to clear its contents
rm output.txt

echo "TEST 5: DIVISON BY 0"

# Call to the ./msh program and redirect the output(all output) to output.txt
./msh  >> output.txt 2>&1  << EOF
mycalc 3 div 0
EOF

# Remove the MSH>> parts of the output
remove="MSH>>"
string=$(cat output.txt)
result="${string//$remove}"


echo "[ERROR] Division by zero is not allowed." > expected.txt
echo $result > actual.txt
diff expected.txt actual.txt > diff.txt
if [ -s diff.txt ]
then
    echo "Test 5 failed :( "
    cat diff.txt
    cat output.txt
    echo " "
    
else
    echo "Test 5 passed :) "
    test_passed=$((test_passed+1))
fi
total_test=$((total_test+1))


# TEST 6: INCORRECT PARAMETERS 
# Remove output to clear its contents
rm output.txt

# Testing parameters
# Expected value: 
expected="[ERROR] The structure of the command is mycalc <operand 1> <add/mul/div> <operand 2>"
# Input value
input=" mycalc 2 div"
# Test number
test_number=6


echo "TEST $test_number: Incorrect Parameters"

# Call to the ./msh program and redirect the output(all output) to output.txt
./msh  >> output.txt 2>&1  << EOF
$input
EOF

# Remove the MSH>> parts of the output
remove="MSH>>"
string=$(cat output.txt)
result="${string//$remove}"


echo $expected > expected.txt
echo $result > actual.txt
diff expected.txt actual.txt > diff.txt
if [ -s diff.txt ]
then
    echo "Test $test_number failed :( "
    cat diff.txt
    cat output.txt
    echo " "
    
else
    echo "Test $test_number passed :) "
    test_passed=$((test_passed+1))
fi
total_test=$((total_test+1))

# TEST 7: INCORRECT OPERATOR  
# Remove output to clear its contents
rm output.txt

# Testing parameters
# Expected value: 
expected="[ERROR] The structure of the command is mycalc <operand_1> <add/mul/div> <operand_2>"
# Input value
input=" mycalc 2 sub 3"
# Test number
test_number=7
# Test description
description="Incorrect Operator"


echo "TEST $test_number: $description"

# Call to the ./msh program and redirect the output(all output) to output.txt
./msh  >> output.txt 2>&1  << EOF
$input
EOF

# Remove the MSH>> parts of the output
remove="MSH>>"
string=$(cat output.txt)
result="${string//$remove}"


echo $expected > expected.txt
echo $result > actual.txt
diff expected.txt actual.txt > diff.txt
if [ -s diff.txt ]
then
    echo "Test $test_number failed :( "
    cat diff.txt
    cat output.txt
    echo " "
    
else
    echo "Test $test_number passed :) "
    test_passed=$((test_passed+1))
fi
total_test=$((total_test+1))


# TEST 8: NON-INTEGER INPUTS

# For this case it is expected that the program will convert to int. Rounding to the lower integer

# Remove output to clear its contents
rm output.txt

# Testing parameters
# Expected value: 
expected="[OK] 2 + 3 = 5; Acc 5"
# Input value
input=" mycalc 2.6 add 3.2"
# Test number
test_number=8
# Test description
description="NON-INTEGER INPUTS"


echo "TEST $test_number: $description"

# Call to the ./msh program and redirect the output(all output) to output.txt
./msh  >> output.txt 2>&1  << EOF
$input
EOF

# Remove the MSH>> parts of the output
remove="MSH>>"
string=$(cat output.txt)
result="${string//$remove}"


echo $expected > expected.txt
echo $result > actual.txt
diff expected.txt actual.txt > diff.txt
if [ -s diff.txt ]
then
    echo "Test $test_number failed :( "
    cat diff.txt
    cat output.txt
    echo " "
    
else
    echo "Test $test_number passed :) "
    test_passed=$((test_passed+1))
fi
total_test=$((total_test+1))

# TEST 9: CHECK ENVIROMENT VARIABLE

# For this case it is expected that the program will convert to int. Rounding to the lower integer

# Remove output to clear its contents
rm output.txt

# Testing parameters
# Expected value: 
expected= $'[OK] 2 + 3 = 5; Acc 5 \n [OK] 2 + 3 = 5; Acc 10'
# Input value
input=$ 'mycalc 2 add 3 \n mycalc 2 add 3'
# Test number
test_number=9
# Test description
description="CHECK ENVIROMENT VARIABLE"


echo "TEST $test_number: $description"

# Call to the ./msh program and redirect the output(all output) to output.txt
./msh  >> output.txt 2>&1  << EOF
$input
EOF

# Remove the MSH>> parts of the output
remove="MSH>>"
string=$(cat output.txt)
result="${string//$remove}"


echo $expected > expected.txt
echo $result > actual.txt
diff expected.txt actual.txt > diff.txt
if [ -s diff.txt ]
then
    echo "Test $test_number failed :( "
    cat diff.txt
    cat output.txt
    echo " "
    
else
    echo "Test $test_number passed :) "
    test_passed=$((test_passed+1))
fi
total_test=$((total_test+1))


echo "Total number of test $total_test"
echo "Test passed $test_passed"
grade=$((test_passed*100/total_test))
echo "Grade: $grade"
rm output.txt
rm expected.txt
rm actual.txt
rm diff.txt