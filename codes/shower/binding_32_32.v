module binding_32_32(
    data1,data2,data
);
    input [31:0]data1;
    input [31:0]data2;
    output [15:0]data;

    assign data[15:8] = data1[7:0];
    assign data[7:0] = data2[7:0];

endmodule // selector