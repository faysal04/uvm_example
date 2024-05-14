class mux_driver extends uvm_driver#(mux_tx);

  //factory registration
  `uvm_component_utils(mux_driver)

  //constructor
  function new(string name="mux_driver",uvm_component parent);
    super.new(name,parent);
  endfunction

  //declarations
  virtual mux_intf vif;
  mux_tx tx;

  //build phase
  function void build_phase(uvm_phase phase);
    if(!(uvm_config_db#(virtual mux_intf)::get(this,"","vif",vif))) begin
      `uvm_fatal("driver","unable to get interface")
    end
  endfunction

  //run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(tx);
      vif.x = tx.a;
      vif.y = tx.b;
      vif.select = tx.select;
      #10;
      //tx.print();
      seq_item_port.item_done();
    end
  endtask
endclass
