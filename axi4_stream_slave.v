module axi4_stream_slave #(parameter WIDTH) (
    input wire clk, rst_n,

    // AXI4-Stream Slave interface
    input  wire [WIDTH-1:0] s_axi_tdata,
    input  wire s_axi_tvalid,
    output wire s_axi_tready,
    input  wire s_axi_tlast,

    // User logic output
    output reg  [WIDTH-1:0] data_out,
    output reg  data_valid,
    output reg  packet_done // Optional for data calc
);

endmodule