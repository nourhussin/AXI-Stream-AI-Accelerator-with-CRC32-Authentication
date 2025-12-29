module control (
    input clk, rst_n,

    input empty,
    output re,

    output start_auth,
    input auth_done, auth_fail,

    output load_param, start_calc,
    input finished_calc,

    input full,
    output we
);

endmodule