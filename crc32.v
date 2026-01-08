module crc32 #(parameter WIDTH = 32)(
    input wire clk, rst_n,

    input wire [WIDTH-1:0] data_in,
    input wire start_auth,

    output reg [WIDTH-1:0]  data_out,
    output reg auth_done,
    output reg auth_fail

);

integer i;
localparam [WIDTH-1:0] POLY = 32'h04C11DB7;
reg [WIDTH-1:0] crc_ini;
///output 
function [WIDTH-1:0]crc_32;
    input [WIDTH-1:0]DataIn;
    input [WIDTH-1:0]crc_init;
    reg [WIDTH-1:0]crc;
    integer i;
    begin 
        crc = crc_init ^ DataIn;
        for (i=0 ; i<32 ; i=i+1)begin
            if (crc[WIDTH-1])
                crc = (crc << 1) ^ POLY;
            else 
                crc = (crc << 1);
        end 
        crc_32 = crc ;
    end 

endfunction

always @(posedge clk) begin    
    if (!rst_n) begin
        crc_ini   <=32'hFFFFFFFF;
        data_out  <=32'h00000000;
        auth_done <= 0;
        auth_fail <= 0;
    end
    else begin 
        if (start_auth) begin
        data_out <= crc_32(data_in, crc_ini);
        auth_done <= 1'b1;
        auth_fail <= 1'b0;
        end else begin
        auth_done <= 1'b0; 
        auth_fail <= 1'b1;
        end
    end 
end 

endmodule