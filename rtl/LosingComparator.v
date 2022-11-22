//=======================================================================================================================================
//  														COMPARADOR
//=======================================================================================================================================
//=======================================================
//  MODULE Definition
//=======================================================
module CC_MATRIXCOMPARATOR #(parameter MATRIXCOMPARATOR_DATAWIDTH=8)(
//////////// OUTPUTS //////////
	CC_MATRIXCOMPARATOR_crash_OutLow,
//////////// INPUTS //////////
	CC_MATRIXCOMPARATOR_registro7_InBUS,
    CC_MATRIXCOMPARATOR_registro6_InBUS,
    CC_MATRIXCOMPARATOR_registro5_InBUS,
    CC_MATRIXCOMPARATOR_registro4_InBUS,
    CC_MATRIXCOMPARATOR_registro3_InBUS,
    CC_MATRIXCOMPARATOR_registro2_InBUS,
    CC_MATRIXCOMPARATOR_registro1_InBUS,
    CC_MATRIXCOMPARATOR_registro0_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_MATRIXCOMPARATOR_crash_OutLow;
input 	[MATRIXCOMPARATOR_DATAWIDTH-1:0] CC_MATRIXCOMPARATOR_registro7_InBUS;
input 	[MATRIXCOMPARATOR_DATAWIDTH-1:0] CC_MATRIXCOMPARATOR_registro6_InBUS;
input 	[MATRIXCOMPARATOR_DATAWIDTH-1:0] CC_MATRIXCOMPARATOR_registro5_InBUS;
input 	[MATRIXCOMPARATOR_DATAWIDTH-1:0] CC_MATRIXCOMPARATOR_registro4_InBUS;
input 	[MATRIXCOMPARATOR_DATAWIDTH-1:0] CC_MATRIXCOMPARATOR_registro3_InBUS;
input 	[MATRIXCOMPARATOR_DATAWIDTH-1:0] CC_MATRIXCOMPARATOR_registro2_InBUS;
input 	[MATRIXCOMPARATOR_DATAWIDTH-1:0] CC_MATRIXCOMPARATOR_registro1_InBUS;
input 	[MATRIXCOMPARATOR_DATAWIDTH-1:0] CC_MATRIXCOMPARATOR_registro0_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
	if((CC_MATRIXCOMPARATOR_registro7_InBUS == 8'b00000000)&(CC_MATRIXCOMPARATOR_registro6_InBUS == 8'b00000000)&(CC_MATRIXCOMPARATOR_registro5_InBUS == 8'b00000000)&(CC_MATRIXCOMPARATOR_registro4_InBUS == 8'b00000000)&(CC_MATRIXCOMPARATOR_registro3_InBUS == 8'b00000000)&(CC_MATRIXCOMPARATOR_registro2_InBUS == 8'b00000000)&(CC_MATRIXCOMPARATOR_registro1_InBUS == 8'b00000000)&(CC_MATRIXCOMPARATOR_registro0_InBUS == 8'b00000000))
		CC_MATRIXCOMPARATOR_crash_OutLow = 1'b1;
	else 
		CC_MATRIXCOMPARATOR_crash_OutLow = 1'b0;
end

endmodule