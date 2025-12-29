module multiplier #(parameter WIDTH = 8)(
    input wire [WIDTH-1 : 0] i_num1, i_num2,
    output wire [2*WIDTH -1 : 0] o_mult
);
    assign o_mult = i_num1 * i_num2;
    
endmodule