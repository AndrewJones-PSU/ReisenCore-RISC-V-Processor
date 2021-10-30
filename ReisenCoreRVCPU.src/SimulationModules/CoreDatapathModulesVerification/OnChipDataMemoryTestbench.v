/**
    This module is used to test the functionality of the OnChipDataMemory
    module.
    @author Andrew Jones (https://github.com/AndrewJones-PSU)
*/

module OnChipDataMemoryTestbench ();
    reg [10:0] address;
    reg [63:0] writeData;
    reg signExtended;
    reg [1:0] writeSize;
    reg writeEnable;
    reg clk;
    reg [191:0] TESTNAME;

    wire [63:0] readData;

    OnChipDataMemory ocdm(address, writeData, signExtended, writeSize, writeEnable, clk, readData);

    initial begin
        // endianness verification
        TESTNAME = "endianness verification";
        address = 0;
        writeData = 64'h0;
        signExtended = 0;
        writeSize = 0;
        writeEnable = 0;
        clk = 0;
        #15
        address = 0;
        writeData = 64'h0123456789ABCDEF; // writes to mem
        writeSize = 2'b11;
        writeEnable = 1;
        #10
        address = 0;
        writeData = 64'h0; // not written to mem
        writeSize = 2'b00;
        writeEnable = 0;
        #10
        address = 1;
        #10
        address = 2;
        #10
        address = 3;
        #10
        address = 4;
        #10
        address = 5;
        #10
        address = 6;
        #10
        address = 7;
        #10
        address = 8;
        

    end

    // create clock signal
    always #5 clk = ~clk;

endmodule