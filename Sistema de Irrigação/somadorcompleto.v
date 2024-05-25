module somadorcompleto (a, b, cin, s, cout); 

	//Declaracao das entradas e saidas
	input a, b, cin;
	output s, cout;
	
	//Funcionamento do circuito soma
	assign s = a ^ b ^ cin;
	
	//Funcionamento do circuito do bit de carry
	assign cout = a & b | a & cin | b & cin;

endmodule
