#!/usr/bin/env bash
count=0
until [[ "$?" -ne 0 ]];
do
  count=$(( count+1 ))
  bash buggedScript.sh &> out.txt
done

echo "$count runs for script to fail"
cat out.txt
