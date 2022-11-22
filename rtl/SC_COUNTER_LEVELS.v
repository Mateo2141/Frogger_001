module SC_COUNTER_LEVELS #(parameter COUNTER_LEVELS_DATAWIDTH =8)(
	//////////// OUTPUTS //////////
	SC_COUNTER_LEVELS_senal_OutLow,
	//////////// INPUTS //////////
	SC_COUNTER_LEVELS_CLOCK_50,
	SC_COUNTER_LEVELS_RESET_InHigh,
	SC_COUNTER_LEVELS_senal_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[COUNTER_LEVELS_DATAWIDTH-1:0]	SC_COUNTER_LEVELS_senal_OutLow;
input		SC_COUNTER_LEVELS_CLOCK_50;
input		SC_COUNTER_LEVELS_RESET_InHigh;
input		SC_COUNTER_LEVELS_senal_InLow;	

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [COUNTER_LEVELS_DATAWIDTH-1:0]  COUNTER_LEVELS_Register;
reg [COUNTER_LEVELS_DATAWIDTH-1:0]  COUNTER_LEVELS_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_COUNTER_LEVELS_senal_InLow == 1'b0)
		COUNTER_LEVELS_Signal = COUNTER_LEVELS_Register + 1'b1;
	else
		COUNTER_LEVELS_Signal = COUNTER_LEVELS_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_COUNTER_LEVELS_CLOCK_50, posedge SC_COUNTER_LEVELS_RESET_InHigh)
begin
	if (SC_COUNTER_LEVELS_RESET_InHigh == 1'b1)
		COUNTER_LEVELS_Register <= 0;
	else
		COUNTER_LEVELS_Register <= COUNTER_LEVELS_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_COUNTER_LEVELS_senal_OutLow = COUNTER_LEVELS_Register;

endmodule
