module mac_engine #(parameter WIDTH = 8, N_PARAMETERS = 4)(
    input wire clk, rst_n, load_param, valid_data
    input wire [WIDTH-1 : 0] i_data,

    output [2*WIDTH:0] data_out, // We might need to do rounding and saturation to reduce it
    output finished_calc
);
    wire [WIDTH-1 : 0] in_mult1, in_mult2;
    wire [2*WIDTH-1 : 0] mult_to_add;
    wire [2*WIDTH : 0] reg_to_add, add_to_reg;

    reg [WIDTH-1 : 0] param_mem [0: N_PARAMETERS-1];
    reg [$clog2(N_PARAMETERS)-1 : 0] param_counter;

    always @(posedge clk) begin
        if(!rst_n) begin
            param_counter <= 0;
        end
        else begin
            if(load_param) begin
                param_mem[param_counter] <= i_data;
            end

        end
    end

    fifo #(.DEPTH(N_PARAMETERS), .WIDTH(WIDTH)) INPUT_MEM (
        .clk(clk),
        .rst_n(rst_n),
        .write_en((!load_param) & valid_data),
        .read_en(1'b1),
        .data_in(i_data),
        .data_out(in_mult1),
    );

    multiplier #(.WIDTH(WIDTH)) MULT (
        .i_num1(in_mult1),
        .i_num2(in_mult2),
        .o_mult(mult_to_add)
    );
    adder #(.WIDTH(2*WIDTH)) ADD (
        .i_num1(mult_to_add),
        .i_num2(reg_to_add[2*WIDTH-1:0]),
        .o_sum(add_to_reg)
    );
    register #(.WIDTH(2*WIDTH)) REG (
        .clk(clk),
        .rst_n(rst_n),
        .d(add_to_reg),
        .q(reg_to_add)
    );

endmodule