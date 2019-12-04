module selector(
    data0,data1,data2,data3,data_out,sw
);
    input [15:0]data0;
    input [15:0]data1; 
    input [15:0]data2;
    input [15:0]data3;
    input [1:0]sw;
    output [15:0]data_out;
    reg [15:0]data_out;
    always @(*) begin
        case(sw)
        2'b00:data_out = data0;
        2'b01:data_out = data1;
        2'b10:data_out = data2;
        2'b11:data_out = data3;
        endcase
    end


endmodule // selector