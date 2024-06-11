#!/bin/bash

netgen -batch source ../cace/run_project_lvs_flat.tcl | tee netgen.log
mv ../reports/sky130_ef_ip__rheostat_8bit_comp.out .
