module crc32 #(parameter WIDTH = 32)(
    input wire clk, rst_n,

    input wire [WIDTH-1:0] data_in,
    input wire start_auth,

    output [WIDTH-1:0] data_out,
    output auth_done,
    output auth_fail

);

endmodule