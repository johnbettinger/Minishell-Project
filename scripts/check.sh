./createzip.sh
cp ../src/Makefile Makefile
cp ../src/libparser.so libparser.so
./checker_os_p2.sh os_p2_100531523_100495775_100531510.zip
rm  os_p2_100531523_100495775_100531510.zip 
rm Makefile
rm libparser.so
rm authors.txt
cat grade.txt
rm grade.txt

echo -e "STUDENTS TEST \n ------------------ \n"
echo "TESTING MYCALC"
cd ./test
./test_mycalc.sh

