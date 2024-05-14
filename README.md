Following is the directory structure

design/ : contains the design file


verification/ : contains relevant uvm_components


sim/ : Simulation area. contains relevant scripts. Modelsim 2020.1 is used for this purpose. You might need to set the paths in run.do scripts 

General Overview:
Driver gets the sequence items from the sequence via the sequencer and drives on the interface to DUT. Since DUT is combinational circuit, we are using # delay.
Monitor works independent of driver and it monitors the interface after the set delay, it then send the monitored item to scoreboard via analysis port.
Scoreboard passes the packet through reference model to check the correctness of output. It also keeps track of passes and fails. 

Important: Since we are using a combinational circuit, driver and monitor have been implemented independent of each other with monitor being the faster among the two. Monitor at any point in simulation records all the inputs and outputs. Scoreboard then evaluates the expected output for the input combinations and compare it with actual output. 'pass' is incremented when the expected and actual output matches, 'fail' is incremented otherwise.
