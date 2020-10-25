//Nicole Prem 18337
//Testbench del lab 8

module Testbench ();

always begin #2 clk = ~clk; end

//Ejercicio 01
reg clk, reset, enable, load; 
reg  [11:0] entrada;
wire [11:0] salida;

Contador Counter(entrada, clk, reset, enable, load, salida);
initial begin 

$display ("\n");
$display ("Ejercicio 01: contador");
$display ("Entrada clk reset enable load | salida");
$display ("------------------------------|-------");
$monitor ("%b %b %b %b %b | %b", entrada, clk, reset, enable, load, salida);

entrada= 12'b000000000000; clk=0; reset=0; enable=0; load=0;
#5 reset=1;
#1 reset=0;
#5 enable=1;
#20 enable=0;
#21 load=1;
#1 entrada = 12'b000000010000;
#1 load=0;
#1 enable=1;

end 

//Ejercicio 02
reg [11:0] in;
wire [7:0] out;

ROM Rom(in, out);
initial begin
$display("\n");
$display ("Ejercicio 02: ROM");
$display ("In | Out");
$display("----|----");
$monitor("%b  | %b ", in, out);

#5 in='h0;
#5 in='h1;
#5 in='h2;
#5 in='h32;
#5 in='h33;
#5 in='h55;
#5 in='h56;
#5 in='h78;
#5 in='h79;
#5 in='hB4;

end

//Ejercicio 03
reg [3:0] A, B;
reg [2:0] F;
wire [3:0] Y;

ALU Alu(F, A, B, Y);
initial begin
$display("\n");
$display("Ejercicio 03: ALU"); 
$display("F A B | Y");
$display("------|--");
$monitor("%b %b %b | %b", F, A, B, Y);

#5 A=0000; B=0000;
#5 F=000; A='b1000; B='b1000;
#5 F=001; A='b0001; B='b1000;
#5 F=010; A='b0001; B='b0011;
#5 F=100; A='b0001; B='b0000;
#5 F=101; A='b0000; B='b1000;
#5 F=110; A='b1000; B='b0100;
#5 F=111; A='b1000; B='b0011;
#5 F=111; A='b0001; B='b1000;
#180 $finish;


end


initial begin
    $dumpfile ("Modulos_Lab8_tb.vcd");
    $dumpvars (0, Testbench);
end

endmodule 





