//=======================================================
//  MODULE Definition
//=======================================================
module SC_LIVES_COUNTER #(parameter LIVES_COUNTER_DATAWIDTH=3)(
	//////////// OUTPUTS //////////
	SC_LIVES_COUNTER_senal_OutLow,
	//////////// INPUTS //////////
	SC_LIVES_COUNTER_CLOCK_50,
	SC_LIVES_COUNTER_RESET_InHigh,
	SC_LIVES_COUNTER_upcount_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[LIVES_COUNTER_DATAWIDTH-1:0]	SC_LIVES_COUNTER_senal_OutLow;
input		SC_LIVES_COUNTER_CLOCK_50;
input		SC_LIVES_COUNTER_RESET_InHigh;
input		SC_LIVES_COUNTER_upcount_InLow;	

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [LIVES_COUNTER_DATAWIDTH-1:0] SC_LIVES_COUNTER_Register;
reg [LIVES_COUNTER_DATAWIDTH-1:0] SC_LIVES_COUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_LIVES_COUNTER_upcount_InLow == 1'b0)
		SC_LIVES_COUNTER_Signal = SC_LIVES_COUNTER_Register - 1'b1;
	else
		SC_LIVES_COUNTER_Signal = SC_LIVES_COUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_LIVES_COUNTER_CLOCK_50, posedge SC_LIVES_COUNTER_RESET_InHigh)
begin
	if (SC_LIVES_COUNTER_RESET_InHigh == 1'b1)
		SC_LIVES_COUNTER_Register <= 0;
	else
		SC_LIVES_COUNTER_Register <= SC_LIVES_COUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_LIVES_COUNTER_senal_OutLow = SC_LIVES_COUNTER_Register;

endmodule
