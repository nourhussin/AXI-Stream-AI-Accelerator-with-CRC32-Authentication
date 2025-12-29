module axi4_stream_master #(parameter WIDTH =32)(
    input wire clk, rst_n,

    // User logic input
    input wire [WIDTH-1:0] data_in,
    input wire data_valid_in, // like write enable in fifo
    input wire packet_done_in, // to calculate packets 

    // AXI4-Stream Master Interface
    output [WIDTH-1:0] m_axi_tdata,
    output m_axi_tvalid,
    output m_axi_tlast,
    input m_axi_tready // like fifo not full 

);

endmodule