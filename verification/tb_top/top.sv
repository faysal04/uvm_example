
module top;

// import packages
import uvm_pkg::*;
import mux_pkg::*;

// create interface
mux_intf pif ();


//dut instantiation
mux dut (
	.a  (pif.x      ),
	.b  (pif.y      ),
	.sel(pif.select ),
	.out(pif.mux_out)
);

// set interface in config db
initial begin
	uvm_config_db#(virtual mux_intf)::set(uvm_root::get(),"","vif",pif);
end

// run test
initial begin
	run_test();
end

endmodule
