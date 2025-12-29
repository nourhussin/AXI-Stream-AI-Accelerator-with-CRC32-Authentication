module register #(parameter WIDTH = 8)(
    input wire clk, rst_n,
    input wire [WIDTH-1 : 0] d,

    output wire [WIDTH-1 : 0] q
);

    always @(posedge clk) begin
        if(!rst_n)
            q <= 0;
        else
            q <= d;
    end

endmodule