#!/bin/bash
for i in `cat $1`; do
    python3 readJson.py $i
    #python3 searchJson.py $i
done