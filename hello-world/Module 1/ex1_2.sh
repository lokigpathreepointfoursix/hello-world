#!/bin/bash

#compile the code
g++ add.cpp -o add
./add < in.txt > out.txt
cat out.txt
