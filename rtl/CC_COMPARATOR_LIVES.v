//=======================================================
//  MODULE Definition
//=======================================================
module CC_COMPARATOR_LIVES #(parameter LIVES_COUNTER_DATAWIDTH=3)(
//////////// OUTPUTS //////////
	CC_COMPARATOR_LIVES_senal_OutLow,
//////////// INPUTS //////////
	CC_COMPARATOR_LIVES_senal_InLow
);

//=======================================================
//  PARAMETER declarations
//=======================================================
//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_COMPARATOR_LIVES_senal_OutLow;
input 	[LIVES_COUNTER_DATAWIDTH-1:0] CC_COMPARATOR_LIVES_senal_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(CC_COMPARATOR_LIVES_senal_InLow)
begin
	if( CC_COMPARATOR_LIVES_senal_InLow == 1'b0)
		CC_COMPARATOR_LIVES_senal_OutLow = 1'b0;
	else
		CC_COMPARATOR_LIVES_senal_OutLow = 1'b1;
end

endmodule
