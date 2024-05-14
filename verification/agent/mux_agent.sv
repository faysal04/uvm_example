class mux_agent extends uvm_agent;

  //factory registration
  `uvm_component_utils(mux_agent)

  //constructor
  function new(string name="mux_agent",uvm_component parent);
    super.new(name,parent);
  endfunction

  //declarations
  mux_driver driver;
  uvm_sequencer#(mux_tx) sqr;
  mux_monitor mon;

  //build phase
  function void build_phase(uvm_phase phase);
    sqr = uvm_sequencer#(mux_tx)::type_id::create("sqr",this);
    driver = mux_driver::type_id::create("driver",this);
    mon = mux_monitor::type_id::create("mon",this);
  endfunction

  // connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_warning("mux_agent","Starting connect phase")
    driver.seq_item_port.connect(sqr.seq_item_export);
  endfunction

endclass
