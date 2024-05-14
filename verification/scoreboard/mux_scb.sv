`uvm_analysis_imp_decl(_monitor)

class mux_scb extends uvm_scoreboard;

  //factory registration
  `uvm_component_utils(mux_scb)

  //constructor
  function new(string name="mux_scb",uvm_component parent);
    super.new(name,parent);
  endfunction

  //declarations
  uvm_analysis_imp_monitor #(mux_tx, mux_scb) monitor_export;
  int    total_monitored   ;
  int    pass              ;
  int    fail              ;

  //build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor_export = new("monitor_export", this);
    total_monitored = 0;
    pass = 0;
    fail = 0;
  endfunction

  // analysis port write function
  virtual function void write_monitor(mux_tx item);
    total_monitored++;
    ref_model(item);
    print_results(item);
  endfunction

  // refence model function
  function void ref_model(mux_tx item);
    if(item.select == 0) begin
      if(item.out == item.a) begin
        pass++;
      end
      else begin
        fail++;
      end
    end
    else begin
      if(item.out == item.b) begin
        pass++;
      end
      else begin
        fail++;
      end
    end
  endfunction

  // print function
  function void print_results(mux_tx item);
    $display("==========================");
    $display("A   = %0d", item.a);
    $display("B   = %0d", item.b);
    $display("SEL = %0d", item.select);
    $display("OUT = %0d", item.out);
    $display("==========================");
    $display("---------------------");
    $display("PASS = %0d", pass);
    $display("FAILS = %0d", fail);
    $display("TOTAL = %0d", total_monitored);
    $display("---------------------");
  endfunction

endclass