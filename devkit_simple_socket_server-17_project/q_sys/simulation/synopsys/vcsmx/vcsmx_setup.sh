
# (C) 2001-2021 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 20.1 711 linux 2021.09.19.07:37:33

# ----------------------------------------
# vcsmx - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     q_sys
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries 
# and the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "vcsmx_sim.sh", and modify text as directed.
# 
# You can also modify the simulation flow to suit your needs. Set the
# following variables to 1 to disable their corresponding processes:
# - SKIP_FILE_COPY: skip copying ROM/RAM initialization files
# - SKIP_DEV_COM: skip compiling the Quartus EDA simulation library
# - SKIP_COM: skip compiling Quartus-generated IP simulation files
# - SKIP_ELAB and SKIP_SIM: skip elaboration and simulation
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator. In this case, you must also copy the generated library
# # setup "synopsys_sim.setup" into the location from which you launch the
# # simulator, or incorporate into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# #
# # - If necessary, specify any compilation options:
# #   USER_DEFINED_COMPILE_OPTIONS
# #   USER_DEFINED_VHDL_COMPILE_OPTIONS applied to vhdl compiler
# #   USER_DEFINED_VERILOG_COMPILE_OPTIONS applied to verilog compiler
# #
# source <script generation output directory>/synopsys/vcsmx/vcsmx_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1 \
# USER_DEFINED_COMPILE_OPTIONS=<compilation options for your design> \
# USER_DEFINED_VHDL_COMPILE_OPTIONS=<VHDL compilation options for your design> \
# USER_DEFINED_VERILOG_COMPILE_OPTIONS=<Verilog compilation options for your design> \
# QSYS_SIMDIR=<script generation output directory>
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
# vlogan <compilation options> <design and testbench files>
# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
# source <script generation output directory>/synopsys/vcsmx/vcsmx_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME="'-top <simulation top>'" \
# QSYS_SIMDIR=<script generation output directory> \
# USER_DEFINED_ELAB_OPTIONS=<elaboration options for your design> \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If q_sys is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 20.1 711 linux 2021.09.19.07:37:33
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="q_sys"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="/home/tom/intelFPGA_lite/20.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/error_adapter_0/
mkdir -p ./libraries/a0/
mkdir -p ./libraries/ng0/
mkdir -p ./libraries/epcq_controller_instance_name/
mkdir -p ./libraries/asmi_parallel_instance_name/
mkdir -p ./libraries/soft_asmiblock_instance_name/
mkdir -p ./libraries/timing_adapter_0/
mkdir -p ./libraries/avalon_st_adapter/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/rsp_mux_002/
mkdir -p ./libraries/rsp_mux_001/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux_010/
mkdir -p ./libraries/rsp_demux_003/
mkdir -p ./libraries/rsp_demux_002/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux_010/
mkdir -p ./libraries/cmd_mux_002/
mkdir -p ./libraries/cmd_mux_001/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux_002/
mkdir -p ./libraries/cmd_demux_001/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/ext_flash_avl_mem_burst_adapter/
mkdir -p ./libraries/cpu_data_master_limiter/
mkdir -p ./libraries/router_018/
mkdir -p ./libraries/router_010/
mkdir -p ./libraries/router_009/
mkdir -p ./libraries/router_008/
mkdir -p ./libraries/router_004/
mkdir -p ./libraries/router_002/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/router/
mkdir -p ./libraries/dual_boot_0_avalon_agent_rsp_fifo/
mkdir -p ./libraries/dual_boot_0_avalon_agent/
mkdir -p ./libraries/cpu_data_master_agent/
mkdir -p ./libraries/dual_boot_0_avalon_translator/
mkdir -p ./libraries/cpu_data_master_translator/
mkdir -p ./libraries/c0/
mkdir -p ./libraries/s0/
mkdir -p ./libraries/m0/
mkdir -p ./libraries/p0/
mkdir -p ./libraries/pll0/
mkdir -p ./libraries/rgmii_in4_0/
mkdir -p ./libraries/i_tse_mac/
mkdir -p ./libraries/cpu/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/irq_synchronizer/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/sysid/
mkdir -p ./libraries/sys_clk_timer/
mkdir -p ./libraries/sgdma_tx/
mkdir -p ./libraries/sgdma_rx/
mkdir -p ./libraries/onchip_ram/
mkdir -p ./libraries/mem_if_ddr3_emif_0/
mkdir -p ./libraries/led_pio/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/ext_flash/
mkdir -p ./libraries/eth_tse/
mkdir -p ./libraries/enet_pll/
mkdir -p ./libraries/dual_boot_0/
mkdir -p ./libraries/descriptor_memory/
mkdir -p ./libraries/altpll_shift/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/fiftyfivenm_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_AC_ROM.hex ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_inst_ROM.hex ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_ic_tag_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_bht_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_ociram_default_contents.hex ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_bht_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_dc_tag_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_ic_tag_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_dc_tag_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_rf_ram_b.mif ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_dc_tag_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_ociram_default_contents.mif ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_bht_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_ociram_default_contents.dat ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/submodules/q_sys_cpu_cpu_ic_tag_ram.mif ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                 -work altera_ver      
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                          -work lpm_ver         
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                             -work sgate_ver       
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                         -work altera_mf_ver   
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                     -work altera_lnsim_ver
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/fiftyfivenm_atoms.v"                 -work fiftyfivenm_ver 
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/fiftyfivenm_atoms_ncrypt.v" -work fiftyfivenm_ver 
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"                       -work error_adapter_0                  
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/alt_mem_ddrx_mm_st_converter.v"                                                     -work a0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_addr_cmd.v"                                                            -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_addr_cmd_wrap.v"                                                       -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ddr2_odt_gen.v"                                                        -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ddr3_odt_gen.v"                                                        -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_lpddr2_addr_cmd.v"                                                     -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_odt_gen.v"                                                             -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_rdwr_data_tmg.v"                                                       -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_arbiter.v"                                                             -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_burst_gen.v"                                                           -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_cmd_gen.v"                                                             -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_csr.v"                                                                 -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_buffer.v"                                                              -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_buffer_manager.v"                                                      -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_burst_tracking.v"                                                      -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_dataid_manager.v"                                                      -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_fifo.v"                                                                -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_list.v"                                                                -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_rdata_path.v"                                                          -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_wdata_path.v"                                                          -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_decoder.v"                                                         -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_decoder_32_syn.v"                                                  -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_decoder_64_syn.v"                                                  -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_encoder.v"                                                         -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_encoder_32_syn.v"                                                  -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_encoder_64_syn.v"                                                  -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_encoder_decoder_wrapper.v"                                         -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_axi_st_converter.v"                                                    -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_input_if.v"                                                            -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_rank_timer.v"                                                          -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_sideband.v"                                                            -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_tbp.v"                                                                 -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_timing_param.v"                                                        -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_controller.v"                                                          -work ng0                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS           \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_controller_st_top.v"                                                   -work ng0                              
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS \"+incdir+$QSYS_SIMDIR/submodules/\" "$QSYS_SIMDIR/submodules/alt_mem_if_nextgen_ddr3_controller_core.sv"                                         -work ng0                              
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_epcq_controller_arb.sv"                                                      -work epcq_controller_instance_name    
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_epcq_controller.sv"                                                          -work epcq_controller_instance_name    
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_ext_flash_asmi_parallel_instance_name_asmi_parallel_instance_name.v"          -work asmi_parallel_instance_name      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/soft_asmiblock.sv"                                                                  -work soft_asmiblock_instance_name     
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_avalon_st_adapter_timing_adapter_0.sv"                                        -work timing_adapter_0                 
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_avalon_st_adapter_timing_adapter_0_fifo.sv"                                   -work timing_adapter_0                 
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_avalon_st_adapter.v"                                        -work avalon_st_adapter                
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                                         -work crosser                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                   -work crosser                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                   -work crosser                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                                    -work crosser                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_mux_002.sv"                                             -work rsp_mux_002                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                        -work rsp_mux_002                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_mux_001.sv"                                             -work rsp_mux_001                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                        -work rsp_mux_001                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_mux.sv"                                                 -work rsp_mux                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                        -work rsp_mux                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_demux_010.sv"                                           -work rsp_demux_010                    
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_demux_003.sv"                                           -work rsp_demux_003                    
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_demux_002.sv"                                           -work rsp_demux_002                    
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_demux.sv"                                               -work rsp_demux                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_mux_010.sv"                                             -work cmd_mux_010                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                        -work cmd_mux_010                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_mux_002.sv"                                             -work cmd_mux_002                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                        -work cmd_mux_002                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_mux_001.sv"                                             -work cmd_mux_001                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                        -work cmd_mux_001                      
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_mux.sv"                                                 -work cmd_mux                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                        -work cmd_mux                          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_demux_002.sv"                                           -work cmd_demux_002                    
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_demux_001.sv"                                           -work cmd_demux_001                    
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_demux.sv"                                               -work cmd_demux                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                                     -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                              -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                                                -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                                                 -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                                                     -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                                                     -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                                                  -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                                 -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                 -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                   -work ext_flash_avl_mem_burst_adapter  
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                                   -work cpu_data_master_limiter          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                                    -work cpu_data_master_limiter          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                            -work cpu_data_master_limiter          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                   -work cpu_data_master_limiter          
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_018.sv"                                              -work router_018                       
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_010.sv"                                              -work router_010                       
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_009.sv"                                              -work router_009                       
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_008.sv"                                              -work router_008                       
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_004.sv"                                              -work router_004                       
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_002.sv"                                              -work router_002                       
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_001.sv"                                              -work router_001                       
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router.sv"                                                  -work router                           
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                            -work dual_boot_0_avalon_agent_rsp_fifo
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                       -work dual_boot_0_avalon_agent         
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                                -work dual_boot_0_avalon_agent         
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                                      -work cpu_data_master_agent            
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                                  -work dual_boot_0_avalon_translator    
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                                 -work cpu_data_master_translator       
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_c0.v"                                                      -work c0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0.v"                                                      -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_mm_interconnect_0_router.sv"                            -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_data_broadcast.v"                                                        -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_write_decoder.v"                                                         -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_lfsr12.v"                                                                -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_mm_interconnect_0_cmd_mux.sv"                           -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/sequencer_pll_mgr.sv"                                                               -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                                  -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_mm_interconnect_0_cmd_demux.sv"                         -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/sequencer_phy_mgr.sv"                                                               -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_data_decoder.v"                                                          -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                                 -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_di_buffer.v"                                                             -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_mm_interconnect_0_rsp_mux.sv"                           -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                                      -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_mm_interconnect_0.v"                                    -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_datamux.v"                                                               -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_lfsr72.v"                                                                -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_ram_csr.v"                                                               -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_di_buffer_wrap.v"                                                        -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                            -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_mm_interconnect_0_rsp_demux.sv"                         -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/rw_manager_core.sv"                                                                 -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_ac_ROM_reg.v"                                                            -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/sequencer_m10.sv"                                                                   -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                        -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_bitcheck.v"                                                              -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_dm_decoder.v"                                                            -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_pattern_fifo.v"                                                          -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/rw_manager_generic.sv"                                                              -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_lfsr36.v"                                                                -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_inst_ROM_reg.v"                                                          -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_mem_if_sequencer_rst.sv"                                                     -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_read_datapath.v"                                                         -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_jumplogic.v"                                                             -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                                -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_mm_interconnect_0_avalon_st_adapter.v"                  -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_ram.v"                                                                   -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_s0_mm_interconnect_0_router_001.sv"                        -work s0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                       -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_ddr3.v"                                                                  -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_m10_ac_ROM.v"                                                            -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/rw_manager_m10_inst_ROM.v"                                                          -work s0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/afi_mux_ddr3_ddrx.v"                                                                -work m0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_clock_pair_generator.v"                                 -work p0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_read_valid_selector.v"                                  -work p0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_addr_cmd_datapath.v"                                    -work p0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_reset_m10.v"                                            -work p0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_memphy_m10.sv"                                          -work p0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_dqdqs_pads_m10.sv"                                      -work p0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_reset_sync.v"                                           -work p0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_fr_cycle_shifter.v"                                     -work p0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_read_datapath_m10.sv"                                   -work p0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_write_datapath_m10.v"                                   -work p0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_simple_ddio_out_m10.sv"                                 -work p0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/max10emif_dcfifo.sv"                                                                -work p0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_iss_probe.v"                                            -work p0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_addr_cmd_pads_m10.v"                                    -work p0                               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0_flop_mem.v"                                             -work p0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_p0.sv"                                                     -work p0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_gpio_lite.sv"                                                                -work p0                               
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0_pll0.sv"                                                   -work pll0                             
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_ext_flash_epcq_controller_instance_name.v"                                    -work epcq_controller_instance_name    
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_ext_flash_asmi_parallel_instance_name.v"                                      -work asmi_parallel_instance_name      
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_ext_flash_soft_asmiblock_instance_name.v"                                     -work soft_asmiblock_instance_name     
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_gpio_lite.sv"                                                                -work rgmii_in4_0                      
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_eth_tse_mac.v"                                                      -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_clk_cntl.v"                                                     -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_crc328checker.v"                                                -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_crc328generator.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_crc32ctl8.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_crc32galois8.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_gmii_io.v"                                                      -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_lb_read_cntl.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_lb_wrt_cntl.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_hashing.v"                                                      -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_host_control.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_host_control_small.v"                                           -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_mac_control.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_register_map.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_register_map_small.v"                                           -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rx_counter_cntl.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_shared_mac_control.v"                                           -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_shared_register_map.v"                                          -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_tx_counter_cntl.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_lfsr_10.v"                                                      -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_loopback_ff.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_altshifttaps.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_fifoless_mac_rx.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_mac_rx.v"                                                       -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_fifoless_mac_tx.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_mac_tx.v"                                                       -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_magic_detection.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_mdio.v"                                                         -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_mdio_clk_gen.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_mdio_cntl.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_top_mdio.v"                                                     -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_mii_rx_if.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_mii_tx_if.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_pipeline_base.v"                                                -work i_tse_mac                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/synopsys/altera_tse_pipeline_stage.sv"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_dpram_16x32.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_dpram_8x32.v"                                                   -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_dpram_ecc_16x32.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_fifoless_retransmit_cntl.v"                                     -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_retransmit_cntl.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rgmii_in1.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rgmii_in4.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_nf_rgmii_module.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rgmii_module.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rgmii_out1.v"                                                   -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rgmii_out4.v"                                                   -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rx_ff.v"                                                        -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rx_min_ff.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rx_ff_cntrl.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rx_ff_cntrl_32.v"                                               -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rx_ff_cntrl_32_shift16.v"                                       -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rx_ff_length.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_rx_stat_extract.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_timing_adapter32.v"                                             -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_timing_adapter8.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_timing_adapter_fifo32.v"                                        -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_timing_adapter_fifo8.v"                                         -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_top_1geth.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_top_fifoless_1geth.v"                                           -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_top_w_fifo.v"                                                   -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_top_w_fifo_10_100_1000.v"                                       -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_top_wo_fifo.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_top_wo_fifo_10_100_1000.v"                                      -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_top_gen_host.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_tx_ff.v"                                                        -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_tx_min_ff.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_tx_ff_cntrl.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_tx_ff_cntrl_32.v"                                               -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_tx_ff_cntrl_32_shift16.v"                                       -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_tx_ff_length.v"                                                 -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_tx_ff_read_cntl.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_tx_stat_extract.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_eth_tse_std_synchronizer.v"                                         -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_eth_tse_std_synchronizer_bundle.v"                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_eth_tse_ptp_std_synchronizer.v"                                     -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_false_path_marker.v"                                            -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_reset_synchronizer.v"                                           -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_clock_crosser.v"                                                -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_a_fifo_13.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_a_fifo_24.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_a_fifo_34.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_a_fifo_opt_1246.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_a_fifo_opt_14_44.v"                                             -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_a_fifo_opt_36_10.v"                                             -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_gray_cnt.v"                                                     -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_sdpm_altsyncram.v"                                              -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_altsyncram_dpm_fifo.v"                                          -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_bin_cnt.v"                                                      -work i_tse_mac                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ph_calculator.sv"                                               -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_sdpm_gen.v"                                                     -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_dec_x10.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x10.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x10_wrapper.v"                                          -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_dec_x14.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x14.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x14_wrapper.v"                                          -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_dec_x2.v"                                                   -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x2.v"                                                   -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x2_wrapper.v"                                           -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_dec_x23.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x23.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x23_wrapper.v"                                          -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_dec_x36.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x36.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x36_wrapper.v"                                          -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_dec_x40.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x40.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x40_wrapper.v"                                          -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_dec_x30.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x30.v"                                                  -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_enc_x30_wrapper.v"                                          -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_tse_ecc_status_crosser.v"                                           -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                                    -work i_tse_mac                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_cpu_cpu.v"                                                                    -work cpu                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_cpu_cpu_debug_slave_tck.v"                                                    -work cpu                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_cpu_cpu_debug_slave_wrapper.v"                                                -work cpu                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_cpu_cpu_debug_slave_sysclk.v"                                                 -work cpu                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_cpu_cpu_mult_cell.v"                                                          -work cpu                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_cpu_cpu_test_bench.v"                                                         -work cpu                              
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/synopsys/altera_nios2_gen2_rtl_module.sv"                                           -work cpu                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                          -work rst_controller                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                                        -work rst_controller                   
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_avalon_st_adapter.v"                                                          -work avalon_st_adapter                
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/altera_irq_clock_crosser.sv"                                                        -work irq_synchronizer                 
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_irq_mapper.sv"                                                                -work irq_mapper                       
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0.v"                                                          -work mm_interconnect_0                
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_sysid.v"                                                                      -work sysid                            
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_sys_clk_timer.v"                                                              -work sys_clk_timer                    
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_sgdma_tx.v"                                                                   -work sgdma_tx                         
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_sgdma_rx.v"                                                                   -work sgdma_rx                         
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_onchip_ram.v"                                                                 -work onchip_ram                       
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_mem_if_ddr3_emif_0.v"                                                         -work mem_if_ddr3_emif_0               
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_led_pio.v"                                                                    -work led_pio                          
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_jtag_uart.v"                                                                  -work jtag_uart                        
  vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                      "$QSYS_SIMDIR/submodules/q_sys_ext_flash.sv"                                                                 -work ext_flash                        
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_eth_tse.v"                                                                    -work eth_tse                          
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_enet_pll.vo"                                                                  -work enet_pll                         
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/altera_dual_boot.v"                                                        -work dual_boot_0                      
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/alt_dual_boot_avmm.v"                                                      -work dual_boot_0                      
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/synopsys/alt_dual_boot.v"                                                           -work dual_boot_0                      
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_descriptor_memory.v"                                                          -work descriptor_memory                
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_cpu.v"                                                                        -work cpu                              
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/submodules/q_sys_altpll_shift.vo"                                                              -work altpll_shift                     
  vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS                                                "$QSYS_SIMDIR/q_sys.v"                                                                                                                              
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  vcs -lca -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
