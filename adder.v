module adder #(parameter WIDTH = 8)(
    input wire [WIDTH-1 : 0] i_num1, i_num2,
    output wire [WIDTH : 0] o_sum
);
    assign o_sum = i_num1 + i_num2;
    
endmodule