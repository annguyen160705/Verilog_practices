module full_adder_2b;

reg [1:0]a,b;
reg cin;
wire [1:0]cout;
wire [1:0]sum;



full_adder u0 (a[0],b[0],cin,sum[0],cout[0]);
full_adder u1 (a[1],b[1],cout[0],sum[1],cout[1]);

integer i,j;
initial begin

cin = 0;

for(i=0;i<4;i=i+1)begin
    for(j=0;j<4;j=j+1)begin
        a = i;
        b = j;
        #5;
    end
end

end






endmodule



module full_adder (input a,b,cin, output reg sum,cout);

always @ (a or b or cin) begin
    {cout,sum} = a + b + cin;
end

endmodule