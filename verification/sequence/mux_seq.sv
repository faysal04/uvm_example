class mux_seq extends uvm_sequence#(mux_tx);

  // factory registration
  `uvm_object_utils(mux_seq)

  // constructor
  function new (string name="mux_seq");
    super.new(name);
  endfunction

  // declarations
  mux_tx txn;

  // main task of the sequence
  virtual task body();
    txn=mux_tx::type_id::create("txn");
    repeat(5) begin
      start_item(txn);
      txn.randomizee;
      finish_item(txn);
    end
  endtask

endclass
