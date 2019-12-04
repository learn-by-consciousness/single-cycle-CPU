module binding_5_32(
    data1,data2,data
);

    input [4:0]data1;
    input [31:0]data2;
    output [15:0]data;

    assign data[15:13] = 3'b000;
    assign data[12:8] = data1[4:0];
    assign data[7:0] = data2[7:0];


endmodule // selector