# Tcl script to run LVS on the analog swithces

if {[catch {set PDK_ROOT $::env(PDK_ROOT)}]} {set PDK_ROOT /usr/local/share/pdk}
if {[catch {set PDK $::env(PDK)}]} {set PDK sky130A}

set pdklib ${PDK_ROOT}/${PDK}
set techlibs ${pdklib}/libs.tech
set reflibs ${pdklib}/libs.ref

set setupfile ${techlibs}/netgen/sky130A_setup.tcl
set hvlib ${reflibs}/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice

set circuit1 [readnet spice ../netlist/layout/sky130_ef_ip__rheostat_8bit.spice]
set circuit2 [readnet spice $hvlib]
readnet spice ../netlist/schematic/sky130_ef_ip__rheostat_8bit.spice $circuit2

lvs "$circuit1 sky130_ef_ip__rheostat_8bit" "$circuit2 sky130_ef_ip__rheostat_8bit" \
        $setupfile sky130_ef_ip__rheostat_8bit_comp.out
