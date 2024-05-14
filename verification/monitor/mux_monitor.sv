class mux_monitor extends uvm_monitor;

  // factory registration
  `uvm_component_utils(mux_monitor)

  //constructor
  function new(string name="mux_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction

  // declarations
  mux_tx txx;
  virtual mux_intf vif;

  uvm_analysis_port #(mux_tx) monitor_analysis_port;

  // build_phase
  function void build_phase(uvm_phase phase);
    if(!(uvm_config_db#(virtual mux_intf)::get(this,"","vif",vif))) begin
      `uvm_fatal("monitor","unable to get interface")
    end
    txx = mux_tx::type_id::create("txx",this);
    monitor_analysis_port = new("monitor_analysis_port",this);
  endfunction

  // run_phase
  task run_phase(uvm_phase phase);
    forever begin
      #9;
      txx.a = vif.x;
      txx.b = vif.y;
      txx.select = vif.select;
      txx.out = vif.mux_out;
      monitor_analysis_port.write(txx);
    end
  endtask
  
endclass
