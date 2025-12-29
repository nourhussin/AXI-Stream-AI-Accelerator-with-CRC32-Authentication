module fifo #(parameter DEPTH=8, WIDTH=32) (
    input  wire clk, rst_n, write_en, read_en,
    input  wire [WIDTH-1:0] data_in,
    output reg  [WIDTH-1:0] data_out,
    output wire full, empty
);

    localparam ADDR_W = $clog2(DEPTH);

    reg [ADDR_W:0] write_ptr, read_ptr;
    reg [WIDTH-1:0] fifo [0:DEPTH-1];

    wire [ADDR_W-1:0] w_addr = write_ptr[ADDR_W-1:0];
    wire [ADDR_W-1:0] r_addr = read_ptr[ADDR_W-1:0];

    assign empty = (write_ptr == read_ptr);
    assign full = (write_ptr[ADDR_W-1:0] == read_ptr[ADDR_W-1:0]) &&
                  (write_ptr[ADDR_W]     != read_ptr[ADDR_W]);

    always @(posedge clk) begin
    
        if (!rst_n) begin
            write_ptr <= 0;
            read_ptr  <= 0;
            data_out  <= 0;
        end 
    
        else begin
            if (write_en && !full) begin
                fifo[w_addr] <= data_in;
                write_ptr <= write_ptr + 1;
            end

            if (read_en && !empty) begin
                data_out <= fifo[r_addr];
                read_ptr <= read_ptr + 1;
            end
        end

    end

endmodule
