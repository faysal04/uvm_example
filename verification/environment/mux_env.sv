class mux_env extends uvm_env;
  
  //factory registration 
  `uvm_component_utils(mux_env)

  //constructor
  function new(string name="mux_env",uvm_component parent);
    super.new(name,parent);
  endfunction

  //declarations
  mux_agent agent;
  mux_scb   scb;

  // build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    agent = mux_agent::type_id::create("agent",this);
    scb   = mux_scb::type_id::create("scb",this);
  endfunction

  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.mon.monitor_analysis_port.connect(scb.monitor_export);
  endfunction

endclass
