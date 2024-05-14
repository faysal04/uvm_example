class mux_test extends uvm_test;

  `uvm_component_utils(mux_test)

  function new(string name="mux_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  mux_env env;
  mux_seq seq1;

  function void build_phase(uvm_phase phase);
    env = mux_env::type_id::create("env",this);
  endfunction

  // run phase
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    seq1= new();
    seq1.start(env.agent.sqr);
    phase.drop_objection(this);
  endtask

endclass
