//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/06 22:02:00
// Design Name: 
// Module Name: clk_div
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_div(
    input I_clk, //100MHz
    output reg[1:0]sw,
    output reg[3:0]ands
    );
    integer conter = 0;
    always @(posedge I_clk)begin          
       if(conter>=1000) begin
            conter <= 0;
            sw = sw + 1;
        end
        else
            conter <= conter + 1;
        case(sw)
            0:ands = 4'b0111;
            1:ands = 4'b1011;
            2:ands = 4'b1101;
            3:ands = 4'b1110;
        endcase
    end
endmodule
