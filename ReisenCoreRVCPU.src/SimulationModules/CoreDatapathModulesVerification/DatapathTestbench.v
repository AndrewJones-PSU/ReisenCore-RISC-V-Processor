/**
    This module acts as a testbench for our datapath.
    @author Andrew Jones (https://github.com/AndrewJones-PSU)
*/

module DatapathTestbench ();

    reg clk;

    CoreDatapath coreDatapath(clk);

    initial clk = 0;
    always #5 clk = ~clk;

endmodule  