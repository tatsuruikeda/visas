#!/bin/sh

mkdir figs

for i in *.xml
do 
sed "{
    s/subclonal=".*"/transcript="abc"/
    s/transcript=".*"/transcript="$i"/
    /\<\/rr:ResultsReport\>/q
    }" $i
done