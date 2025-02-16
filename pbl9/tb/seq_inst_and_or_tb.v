module seq_inst_and_or_tb ();

reg    a; 
reg    b; 
reg    c;
reg    d;
reg    e;
reg    f;
reg    g;
reg  clk;
reg  rst;
wire   n;

//*************************
//	DUT Instantiation
//*************************

seq_inst_and_or u_seq_inst_and_or (.clk (clk),
	       	                   .rst (rst),
	       	                   .a   (a  ),
	       	                   .b   (b  ),
				   .c   (c  ),
				   .d   (d  ),
				   .e   (e  ),
	     	                   .f   (f  ),
                                   .g   (g  ),
				   .n   (n  ));

//****************************    
//	BFM
//****************************

integer i;

always #5 clk =~clk;
initial begin
	rst=1; clk=0;
	#5 rst=0;
	#5 rst = 1; 
	{a,b,c,d} = 1111;
	{e,f,g} = 011;
	@(posedge clk);
	{a,b,c,d} =0000;
	{e,f,g} = 011;
	@(posedge clk);
	{a,b,c,d} =0000;
	{e,f,g} = 000;
	@(posedge clk);
	{a,b,c,d} =1100;
	{e,f,g} = 110;
	@(posedge clk);
	{a,b,c,d} =0011;
	{e,f,g} = 101;

end


endmodule


