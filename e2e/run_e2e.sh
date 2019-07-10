#!/bin/bash
TESTS="go
python_3.6.7
ruby_2.5.1
nginx_1.15.6
node_v11.5.0"

if [ -d /tmp/e2erun ] ; then
    rm -r /tmp/e2erun
fi
mkdir /tmp/e2erun

FAILED=0
for test in $TESTS
do
    cd $test
    ./test.sh >>/tmp/e2erun/$test.log 2>&1
    if [ $? -eq 0 ] ; then
        echo "$test: PASSED"
    else
        echo "$test: FAILED"
        FAILED=1
    fi
    cd ..
done
if [ $FAILED -eq 1 ] ; then
    echo "Please see artifacts for failed tests."
fi
exit $FAILED
