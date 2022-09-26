`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2022 19:06:10
// Design Name: 
// Module Name: rom_tb
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


// ROM testbench

module rom_tb;
  reg clk; //clk
  reg en; //enable
  reg [3:0] addr; //address
  wire [3:0] data; //output data
  
  rom r1(
    .clk(clk),
    .en(en),
    .addr(addr),
    .data(data)
  );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1, rom_tb);       
      
      clk=1'b1;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      en = 1'b0;
      #10;                  
      
      en = 1'b1;      
      addr = 4'b1010;
      #10;
      
      addr = 4'b0110;
      #10;
      
      addr = 4'b0011;
      #10;
      
      en = 1'b0;
      addr = 4'b1111;
      #10;
            
      en = 1'b1;
      addr = 4'b1000;
      #10;
      
      addr = 4'b0000;
      #10;
      
      addr = 4'bxxxx;
      #10;
    end
  
  initial
    begin
      #80 $stop;
    end
  
endmodule  