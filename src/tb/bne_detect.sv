module bne_detect();

always_ff @(posedge scr1_top_tb_ahb.i_top.i_imem_ahb.clk) begin
    if (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_resp == 2'b01) begin
        // valid data from ahb router
        if (
            (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[6 : 0] == 7'b1100011) &
            (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[14 : 12] == 3'b001)
        ) begin
            // detect and command
            $display("BNE instruction detected, Program Counter = %0h", scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.curr_pc);
        end
    end
end

endmodule
