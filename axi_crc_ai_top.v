module axi_crc_ai_top #(parameter WIDTH = 32, parameter FIFO_DEPTH = 8)(
    input wire clk, rst_n,

    // AXI Slave
    input wire [WIDTH-1:0] s_axi_tdata,
    input wire s_axi_tvalid,
    input wire s_axi_tlast,
    output wire s_axi_tready,

    // AXI Master
    output wire [WIDTH-1:0] m_axi_tdata,
    output wire m_axi_tvalid,
    output wire m_axi_tlast,
    input wire m_axi_tready,

    // Authentication Error
    output wire auth_fail
);

endmodule