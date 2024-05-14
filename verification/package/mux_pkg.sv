package mux_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "../sequence_item/mux_tx.sv";
  `include "../sequence/mux_seq.sv";
  `include "../driver/mux_driver.sv";
  `include "../monitor/mux_monitor.sv";
  `include "../agent/mux_agent.sv";
  `include "../scoreboard/mux_scb.sv";
  `include "../environment/mux_env.sv";
  `include "../test/mux_test.sv";

endpackage : mux_pkg