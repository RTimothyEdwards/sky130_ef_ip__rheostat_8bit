#! /bin/bash
magic -dnull -noconsole -rcfile $PDK_ROOT/$PDK/libs.tech/magic/sky130A.magicrc << EOF
load ../mag/sky130_ef_ip__rheostat_8bit
select top cell
expand
drc style drc(full)
drc on
drc check
drc catchup
drc count
set tk_version 8.5
source \${CAD_ROOT}/magic/tcl/drcmgr.tcl
#feedback save drc.log
magic::drc_save_report sky130_ef_ip__rheostat_8bit drc.log
EOF
exit 
