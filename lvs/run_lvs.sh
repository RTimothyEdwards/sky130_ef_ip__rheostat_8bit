#!/bin/bash


echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=sky130A} > /dev/null

netgen -batch source run_lvs.tcl | tee netgen.log
#netgen -batch source ../cace/run_project_lvs.tcl | tee netgen.log

