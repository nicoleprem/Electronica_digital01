//Nicole Prem 18337
//Modulos del lab 8 

//Ejercicio 01
module Contador (input logic [11:0]entrada, input clk, reset, enable, load, output logic [11:0]salida);
always @ (posedge clk, posedge reset, load, entrada)
begin 
    if (reset)
    salida <= 11'b0;    
    else if (load)
    salida <= entrada;
    else if (enable)
    salida <= salida +1;
end
endmodule 

//Ejercicio 02
module ROM (input wire [11:0]in, output reg [7:0]out); 
reg [7:0] memoria [0:4096];

initial begin
    $readmemb("memoria.txt", memoria);
end
always @ (*) 
begin
    out<=memoria[in];
end
endmodule

//Ejercicio 03
module ALU (input wire [2:0]F, input wire [3:0]A, B, output reg [3:0]Y);
always @ (*)
begin 
    case (F)
    'b000: Y <= A & B;
    'b001: Y <= A | B;
    'b010: Y <= A + B; 
    'b100: Y <= A & ~B;
    'b101: Y <= A | ~B;
    'b110: Y <= A - B;
    endcase

    if (F=='b111 && A<B) 
        Y <= 4'b0001;
    else if (F=='b111 && A>B)
        Y <= 4'b0000;
end 
endmodule 




