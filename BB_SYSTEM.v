/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================

module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_display_OutBUS,
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,

	BB_SYSTEM_startButton_Out, 
	BB_SYSTEM_upButton_Out,
	BB_SYSTEM_downButton_Out,
	BB_SYSTEM_leftButton_Out,
	BB_SYSTEM_rightButton_Out,
	BB_SYSTEM_TEST0,
	BB_SYSTEM_TEST1,
	BB_SYSTEM_TEST2,

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_upButton_InLow,
	BB_SYSTEM_downButton_InLow,
	BB_SYSTEM_leftButton_InLow,
	BB_SYSTEM_rightButton_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_BUS = 8;
 parameter PRESCALER_DATAWIDTH = 15;
 parameter PRESCALER_DATAWIDTH_2 = 27;
 parameter DISPLAY_DATAWIDTH = 12;
 parameter LEVELS_DATAWIDTH = 5; 
 parameter LIVES_DATAWIDTH = 3;

//=======================================================
//  Nivel 1
//======================================================= 
 parameter DATA_FIXED_INITREGBACKG_7_n1 = 8'b11011011;
 parameter DATA_FIXED_INITREGBACKG_6_n1 = 8'b11000011;
 parameter DATA_FIXED_INITREGBACKG_5_n1 = 8'b00000010;
 parameter DATA_FIXED_INITREGBACKG_4_n1 = 8'b00110000;
 parameter DATA_FIXED_INITREGBACKG_3_n1 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_2_n1 = 8'b11001100;
 parameter DATA_FIXED_INITREGBACKG_1_n1 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_0_n1 = 8'b00000000;
 
//=======================================================
//  Nivel 2
//======================================================= 
 parameter DATA_FIXED_INITREGBACKG_7_n2 = 8'b01111110;
 parameter DATA_FIXED_INITREGBACKG_6_n2 = 8'b11000000;
 parameter DATA_FIXED_INITREGBACKG_5_n2 = 8'b00001110;
 parameter DATA_FIXED_INITREGBACKG_4_n2 = 8'b00100010;
 parameter DATA_FIXED_INITREGBACKG_3_n2 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_2_n2 = 8'b00111100;
 parameter DATA_FIXED_INITREGBACKG_1_n2 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_0_n2 = 8'b00000000;
//=======================================================
//  Nivel 3
//======================================================= 
 parameter DATA_FIXED_INITREGBACKG_7_n3 = 8'b11011011;
 parameter DATA_FIXED_INITREGBACKG_6_n3 = 8'b11001100;
 parameter DATA_FIXED_INITREGBACKG_5_n3 = 8'b00001110;
 parameter DATA_FIXED_INITREGBACKG_4_n3 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_3_n3 = 8'b01000010;
 parameter DATA_FIXED_INITREGBACKG_2_n3 = 8'b00111100;
 parameter DATA_FIXED_INITREGBACKG_1_n3 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_0_n3 = 8'b00000000;
//=======================================================
//  Nivel 4
//======================================================= 
 parameter DATA_FIXED_INITREGBACKG_7_n4 = 8'b11011101;
 parameter DATA_FIXED_INITREGBACKG_6_n4 = 8'b11001100;
 parameter DATA_FIXED_INITREGBACKG_5_n4 = 8'b10110010;
 parameter DATA_FIXED_INITREGBACKG_4_n4 = 8'b10011111;
 parameter DATA_FIXED_INITREGBACKG_3_n4 = 8'b10000000;
 parameter DATA_FIXED_INITREGBACKG_2_n4 = 8'b01110011;
 parameter DATA_FIXED_INITREGBACKG_1_n4 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_0_n4 = 8'b00000000;
//=======================================================
//  Rana
//======================================================= 
 parameter DATA_FIXED_INITREGPOINT_7 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_6 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_5 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_4 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_3 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_2 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_0 = 8'b00010000;
 
 
 // Pantalla Perdida
 parameter DATA_FIXED_LOSEREGBACKG_7 = 8'b10011001;
 parameter DATA_FIXED_LOSEREGBACKG_6 = 8'b01100110;
 parameter DATA_FIXED_LOSEREGBACKG_5 = 8'b01100110;
 parameter DATA_FIXED_LOSEREGBACKG_4 = 8'b10011001;
 parameter DATA_FIXED_LOSEREGBACKG_3 = 8'b00000000;
 parameter DATA_FIXED_LOSEREGBACKG_2 = 8'b00111100;
 parameter DATA_FIXED_LOSEREGBACKG_1 = 8'b01000010;
 parameter DATA_FIXED_LOSEREGBACKG_0 = 8'b01000010;
 
  // Pantalla Next Lvl
 parameter DATA_FIXED_NEXTREGBACKG_7 = 8'b00001000;
 parameter DATA_FIXED_NEXTREGBACKG_6 = 8'b00000100;
 parameter DATA_FIXED_NEXTREGBACKG_5 = 8'b00000010;
 parameter DATA_FIXED_NEXTREGBACKG_4 = 8'b11111111;
 parameter DATA_FIXED_NEXTREGBACKG_3 = 8'b11111111;
 parameter DATA_FIXED_NEXTREGBACKG_2 = 8'b00000010;
 parameter DATA_FIXED_NEXTREGBACKG_1 = 8'b00000100;
 parameter DATA_FIXED_NEXTREGBACKG_0 = 8'b00001000;
 
   // Pantalla Ganaste
 parameter DATA_FIXED_WONREGBACKG_7 = 8'b00000000;
 parameter DATA_FIXED_WONREGBACKG_6 = 8'b01100110;
 parameter DATA_FIXED_WONREGBACKG_5 = 8'b01100110;
 parameter DATA_FIXED_WONREGBACKG_4 = 8'b00000000;
 parameter DATA_FIXED_WONREGBACKG_3 = 8'b01111110;
 parameter DATA_FIXED_WONREGBACKG_2 = 8'b01111110;
 parameter DATA_FIXED_WONREGBACKG_1 = 8'b00000000;
 parameter DATA_FIXED_WONREGBACKG_0 = 8'b00000000;
  
//=======================================================
//  PORT declarations
//=======================================================
output		[DISPLAY_DATAWIDTH-1:0] BB_SYSTEM_display_OutBUS;

output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;

output 		BB_SYSTEM_startButton_Out;
output 		BB_SYSTEM_upButton_Out;
output 		BB_SYSTEM_downButton_Out;
output 		BB_SYSTEM_leftButton_Out;
output 		BB_SYSTEM_rightButton_Out;
output 		BB_SYSTEM_TEST0;
output 		BB_SYSTEM_TEST1;
output 		BB_SYSTEM_TEST2;

input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_upButton_InLow;
input		BB_SYSTEM_downButton_InLow;
input		BB_SYSTEM_leftButton_InLow;
input		BB_SYSTEM_rightButton_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire 	BB_SYSTEM_startButton_InLow_cwire;
wire 	BB_SYSTEM_upButton_InLow_cwire;
wire 	BB_SYSTEM_downButton_InLow_cwire;
wire 	BB_SYSTEM_leftButton_InLow_cwire;
wire 	BB_SYSTEM_rightButton_InLow_cwire;

//POINT
wire	STATEMACHINEPOINT_clear_cwire;
wire	STATEMACHINEPOINT_load0_cwire;
wire	STATEMACHINEPOINT_load1_cwire;
wire	[1:0] STATEMACHINEPOINT_shiftselection_cwire;

wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data7_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data0_Out;

//BACKGROUNG
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data7_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data0_Out;

wire [PRESCALER_DATAWIDTH-1:0] upSPEEDCOUNTER_data_BUS_wire;
wire [PRESCALER_DATAWIDTH_2-1:0] DISPLAYTIMER_data_BUS_wire;
wire SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire;
wire DISPLAYSPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire;
	
wire STATEMACHINEBACKG_clear_cwire;
wire STATEMACHINEGENERAL_load_cwire;
wire [1:0] STATEMACHINEBACKG_shiftselection_cwire;
	
wire STATEMACHINEBACKG_upcount_cwire;
wire STATEMACHINEBACKG_upcount2_cwire;

wire STATEMACHINEGENERAL_LosingComparator_wire;
wire [1:0]Last_register_comparator_OutBus_wire;
wire loadLastRegister_OutLow_wire;
wire [1:0]SC_COUNTER_LEVELS_wire;
wire SC_STATEMACHINEGENERAL_COMPARATOR_LEVELS_wire;
wire SC_STATEMACHINEGENERAL_COUNTER_LEVELS_wire;
wire SC_STATEMACHINEGENERAL_COUNTER_LIVES_wire;
wire SC_STATEMACHINEGENERAL_COMPARATOR_LIVES_wire;
wire SC_COUNTER_LIVES_wire;
wire STATEMACHINEGENERAL_DisplayResultado_cwire;

//BOTTOMSIDE COMPARATOR
wire BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire;

// GAME
wire [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data0_wire;

wire [DATAWIDTH_BUS-1:0] regOVER_data7_wire;
wire [DATAWIDTH_BUS-1:0] regOVER_data6_wire;
wire [DATAWIDTH_BUS-1:0] regOVER_data5_wire;
wire [DATAWIDTH_BUS-1:0] regOVER_data4_wire;
wire [DATAWIDTH_BUS-1:0] regOVER_data3_wire;
wire [DATAWIDTH_BUS-1:0] regOVER_data2_wire;
wire [DATAWIDTH_BUS-1:0] regOVER_data1_wire;
wire [DATAWIDTH_BUS-1:0] regOVER_data0_wire;

wire 	[7:0] data_max;
wire 	[2:0] add;

wire [DATAWIDTH_BUS-1:0] upCOUNTER_2_BIN2BCD1_data_BUS_wire;
wire [DISPLAY_DATAWIDTH-1:0] BIN2BCD1_2_SEVENSEG1_data_BUS_wire;

//=======================================================
//  Structural coding
//=======================================================

//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_upButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_upButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_downButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_downButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u3 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u4 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_InLow)
);

//######################################################################
//#	POINT
//######################################################################
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_7)) SC_RegPOINTTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_6)) SC_RegPOINTTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_5)) SC_RegPOINTTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_4)) SC_RegPOINTTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_3)) SC_RegPOINTTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_2)) SC_RegPOINTTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_1)) SC_RegPOINTTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out)
);

SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEPOINT_clear_OutLow(STATEMACHINEPOINT_clear_cwire), 
	.SC_STATEMACHINEPOINT_load0_OutLow(STATEMACHINEPOINT_load0_cwire), 
	.SC_STATEMACHINEPOINT_load1_OutLow(STATEMACHINEPOINT_load1_cwire), 
	.SC_STATEMACHINEPOINT_shiftselection_Out(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_upButton_InLow(BB_SYSTEM_upButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_downButton_InLow(BB_SYSTEM_downButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_leftButton_InLow(BB_SYSTEM_leftButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_rightButton_InLow(BB_SYSTEM_rightButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_bottomsidecomparator_InLow(BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire)
);

//######################################################################
//#	BACKGROUND
//######################################################################
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), 
				.DATA_FIXED_nivel_1_INITREGBACKG(DATA_FIXED_INITREGBACKG_7_n1),
				.DATA_FIXED_nivel_2_INITREGBACKG(DATA_FIXED_INITREGBACKG_7_n2),
				.DATA_FIXED_nivel_3_INITREGBACKG(DATA_FIXED_INITREGBACKG_7_n3),
				.DATA_FIXED_nivel_4_INITREGBACKG(DATA_FIXED_INITREGBACKG_7_n4),
				.DATA_FIXED_LOSEREGBACKG (DATA_FIXED_LOSEREGBACKG_7),
				.DATA_FIXED_WONREGBACKG (DATA_FIXED_WONREGBACKG_7)	) SC_RegBACKGTYPE_u7 (

// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data7_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGENERAL_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_transition_selector(SC_COUNTER_LEVELS_wire),
	.SC_RegBACKGTYPE_load2_InBUS(loadLastRegister_OutLow_wire),
	.SC_RegBACKGTYPE_data2_InBUS(regGAME_data7_wire)
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), 
				.DATA_FIXED_nivel_1_INITREGBACKG(DATA_FIXED_INITREGBACKG_6_n1),
				.DATA_FIXED_nivel_2_INITREGBACKG(DATA_FIXED_INITREGBACKG_6_n2),
				.DATA_FIXED_nivel_3_INITREGBACKG(DATA_FIXED_INITREGBACKG_6_n3),
				.DATA_FIXED_nivel_4_INITREGBACKG(DATA_FIXED_INITREGBACKG_6_n4),
				.DATA_FIXED_LOSEREGBACKG (DATA_FIXED_LOSEREGBACKG_6),
				.DATA_FIXED_WONREGBACKG (DATA_FIXED_WONREGBACKG_6)	) SC_RegBACKGTYPE_u6 (

// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data6_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGENERAL_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_transition_selector(SC_COUNTER_LEVELS_wire),
	.SC_RegBACKGTYPE_load2_InBUS()
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), 
				.DATA_FIXED_nivel_1_INITREGBACKG(DATA_FIXED_INITREGBACKG_5_n1),
				.DATA_FIXED_nivel_2_INITREGBACKG(DATA_FIXED_INITREGBACKG_5_n2),
				.DATA_FIXED_nivel_3_INITREGBACKG(DATA_FIXED_INITREGBACKG_5_n3),
				.DATA_FIXED_nivel_4_INITREGBACKG(DATA_FIXED_INITREGBACKG_5_n4),
				.DATA_FIXED_LOSEREGBACKG (DATA_FIXED_LOSEREGBACKG_5),
				.DATA_FIXED_WONREGBACKG (DATA_FIXED_WONREGBACKG_5)	) SC_RegBACKGTYPE_u5 (


// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data5_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGENERAL_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_transition_selector(SC_COUNTER_LEVELS_wire),
	.SC_RegBACKGTYPE_load2_InBUS()
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), 
				.DATA_FIXED_nivel_1_INITREGBACKG(DATA_FIXED_INITREGBACKG_4_n1),
				.DATA_FIXED_nivel_2_INITREGBACKG(DATA_FIXED_INITREGBACKG_4_n2),
				.DATA_FIXED_nivel_3_INITREGBACKG(DATA_FIXED_INITREGBACKG_4_n3),
				.DATA_FIXED_nivel_4_INITREGBACKG(DATA_FIXED_INITREGBACKG_4_n4),
				.DATA_FIXED_LOSEREGBACKG (DATA_FIXED_LOSEREGBACKG_4),
				.DATA_FIXED_WONREGBACKG (DATA_FIXED_WONREGBACKG_4)	) SC_RegBACKGTYPE_u4 (

// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data4_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGENERAL_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_transition_selector(SC_COUNTER_LEVELS_wire),
	.SC_RegBACKGTYPE_load2_InBUS()
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), 
				.DATA_FIXED_nivel_1_INITREGBACKG(DATA_FIXED_INITREGBACKG_3_n1),
				.DATA_FIXED_nivel_2_INITREGBACKG(DATA_FIXED_INITREGBACKG_3_n2),
				.DATA_FIXED_nivel_3_INITREGBACKG(DATA_FIXED_INITREGBACKG_3_n3),
				.DATA_FIXED_nivel_4_INITREGBACKG(DATA_FIXED_INITREGBACKG_3_n4),
				.DATA_FIXED_LOSEREGBACKG (DATA_FIXED_LOSEREGBACKG_3),
				.DATA_FIXED_WONREGBACKG (DATA_FIXED_WONREGBACKG_3)	) SC_RegBACKGTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data3_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGENERAL_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_transition_selector(SC_COUNTER_LEVELS_wire),
	.SC_RegBACKGTYPE_load2_InBUS()
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), 
				.DATA_FIXED_nivel_1_INITREGBACKG(DATA_FIXED_INITREGBACKG_2_n1),
				.DATA_FIXED_nivel_2_INITREGBACKG(DATA_FIXED_INITREGBACKG_2_n2),
				.DATA_FIXED_nivel_3_INITREGBACKG(DATA_FIXED_INITREGBACKG_2_n3),
				.DATA_FIXED_nivel_4_INITREGBACKG(DATA_FIXED_INITREGBACKG_2_n4),
				.DATA_FIXED_LOSEREGBACKG (DATA_FIXED_LOSEREGBACKG_2),
				.DATA_FIXED_WONREGBACKG (DATA_FIXED_WONREGBACKG_2)	) SC_RegBACKGTYPE_u2 (

// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data2_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGENERAL_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_transition_selector(SC_COUNTER_LEVELS_wire),
	.SC_RegBACKGTYPE_load2_InBUS()
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), 
				.DATA_FIXED_nivel_1_INITREGBACKG(DATA_FIXED_INITREGBACKG_1_n1),
				.DATA_FIXED_nivel_2_INITREGBACKG(DATA_FIXED_INITREGBACKG_1_n2),
				.DATA_FIXED_nivel_3_INITREGBACKG(DATA_FIXED_INITREGBACKG_1_n3),
				.DATA_FIXED_nivel_4_INITREGBACKG(DATA_FIXED_INITREGBACKG_1_n4),
				.DATA_FIXED_LOSEREGBACKG (DATA_FIXED_LOSEREGBACKG_1),
				.DATA_FIXED_WONREGBACKG (DATA_FIXED_WONREGBACKG_1)	) SC_RegBACKGTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data1_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGENERAL_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_transition_selector(SC_COUNTER_LEVELS_wire),
	.SC_RegBACKGTYPE_load2_InBUS()
);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), 
				.DATA_FIXED_nivel_1_INITREGBACKG(DATA_FIXED_INITREGBACKG_0_n1),
				.DATA_FIXED_nivel_2_INITREGBACKG(DATA_FIXED_INITREGBACKG_0_n2),
				.DATA_FIXED_nivel_3_INITREGBACKG(DATA_FIXED_INITREGBACKG_0_n3),
				.DATA_FIXED_nivel_4_INITREGBACKG(DATA_FIXED_INITREGBACKG_0_n4),
				.DATA_FIXED_LOSEREGBACKG (DATA_FIXED_LOSEREGBACKG_0),
				.DATA_FIXED_WONREGBACKG (DATA_FIXED_WONREGBACKG_0)	) SC_RegBACKGTYPE_u0 (

// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data0_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEGENERAL_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_transition_selector(SC_COUNTER_LEVELS_wire),
	.SC_RegBACKGTYPE_load2_InBUS()
);
SC_STATEMACHINEBACKG SC_STATEMACHINEBACKG_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEBACKG_clear_OutLow(STATEMACHINEBACKG_clear_cwire), 
	.SC_STATEMACHINEBACKG_shiftselection_Out(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_STATEMACHINEBACKG_upcount_out(STATEMACHINEBACKG_upcount_cwire),
	.SC_STATEMACHINEBACKG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEBACKG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEBACKG_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEBACKG_T0_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire)
);
//#SPEED FOR GAME OBJECTS
SC_upSPEEDCOUNTER #(.upSPEEDCOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upSPEEDCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upSPEEDCOUNTER_data_OutBUS(upSPEEDCOUNTER_data_BUS_wire),
	.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upSPEEDCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upSPEEDCOUNTER_upcount_InLow(STATEMACHINEBACKG_upcount_cwire)
);

CC_SPEEDCOMPARATOR #(.SPEEDCOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) CC_SPEEDCOMPARATOR_u0 (
	.CC_SPEEDCOMPARATOR_T0_OutLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.CC_SPEEDCOMPARATOR_data_InBUS(upSPEEDCOUNTER_data_BUS_wire)
);
//#SPEED FOR DISPLAY 
SC_DISPLAYTIMER_COUNTER #(.DISPLAYTIMER_COUNTER_DATAWIDTH(PRESCALER_DATAWIDTH_2)) SC_DISPLAYTIMER_COUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DISPLAYTIMER_COUNTER_data_OutBUS(DISPLAYTIMER_data_BUS_wire),
	.SC_DISPLAYTIMER_COUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DISPLAYTIMER_COUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DISPLAYTIMER_COUNTER_upcount_InLow(STATEMACHINEBACKG_upcount2_cwire)
);

CC_DISPLAYTIMER_COMPARATOR #(.DISPLAYTIMER_DATAWIDTH(PRESCALER_DATAWIDTH_2)) CC_DISPLAYTIMER_COMPARATOR_u0 (
	.CC_DISPLAYTIMER_COMPARATOR_T0_OutLow(DISPLAYSPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.CC_DISPLAYTIMER_COMPARATOR_data_InBUS(DISPLAYTIMER_data_BUS_wire)
);
//######################################################################
//#	COMPARATOR END OF MATRIX (BOTTON SIDE)
//######################################################################

CC_MATRIXCOMPARATOR #(.MATRIXCOMPARATOR_DATAWIDTH(DATAWIDTH_BUS))CC_MATRIXCOMPARATOR_u0(
	 .CC_MATRIXCOMPARATOR_crash_OutLow(STATEMACHINEGENERAL_LosingComparator_wire),
	 .CC_MATRIXCOMPARATOR_registro7_InBUS(regOVER_data0_wire),
    .CC_MATRIXCOMPARATOR_registro6_InBUS(regOVER_data1_wire),
    .CC_MATRIXCOMPARATOR_registro5_InBUS(regOVER_data2_wire),
    .CC_MATRIXCOMPARATOR_registro4_InBUS(regOVER_data3_wire),
    .CC_MATRIXCOMPARATOR_registro3_InBUS(regOVER_data4_wire),
    .CC_MATRIXCOMPARATOR_registro2_InBUS(regOVER_data5_wire),
    .CC_MATRIXCOMPARATOR_registro1_InBUS(regOVER_data6_wire),
    .CC_MATRIXCOMPARATOR_registro0_InBUS(regOVER_data7_wire)

);

CC_LastRegisterCOMPARATOR #(.LastRegisterCOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) CC_LastRegisterCOMPARATOR_u0(
	.CC_LastRegisterCOMPARATOR_win_OutBUS(Last_register_comparator_OutBus_wire),
	.CC_LastRegisterCOMPARATOR_dataOR_InBUS(regGAME_data7_wire),
	.CC_LastRegisterCOMPARATOR_dataLastRegister_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data7_Out)
);



CC_BOTTOMSIDECOMPARATOR #(.BOTTOMSIDECOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) CC_BOTTOMSIDECOMPARATOR_u0 (
	.CC_BOTTOMSIDECOMPARATOR_bottomside_OutLow(BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire),
	.CC_BOTTOMSIDECOMPARATOR_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);

SC_COUNTER_LEVELS #(.COUNTER_LEVELS_DATAWIDTH(LEVELS_DATAWIDTH)) SC_COUNTER_LEVELS_u0 (
	.SC_COUNTER_LEVELS_senal_OutLow(SC_COUNTER_LEVELS_wire),
	.SC_COUNTER_LEVELS_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_COUNTER_LEVELS_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_COUNTER_LEVELS_senal_InLow(SC_STATEMACHINEGENERAL_COUNTER_LEVELS_wire)
);

CC_COMPARATOR_LEVELS #(.COUNTER_LEVELS_DATAWIDTH(LEVELS_DATAWIDTH)) CC_COMPARATOR_LEVELS_u0 (
	.CC_COMPARATOR_LEVELS_senal_OutLow(SC_STATEMACHINEGENERAL_COMPARATOR_LEVELS_wire),
	.CC_COMPARATOR_LEVELS_senal_InLow(SC_COUNTER_LEVELS_wire)
);

SC_LIVES_COUNTER #(.LIVES_COUNTER_DATAWIDTH(LIVES_DATAWIDTH)) SC_LIVES_COUNTER_u0 (

	.SC_LIVES_COUNTER_senal_OutLow(SC_COUNTER_LIVES_wire), 
	.SC_LIVES_COUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_LIVES_COUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_LIVES_COUNTER_upcount_InLow(SC_STATEMACHINEGENERAL_COUNTER_LIVES_wire)
);

CC_COMPARATOR_LIVES #(.LIVES_COUNTER_DATAWIDTH(LIVES_DATAWIDTH)) CC_COMPARATOR_LIVES_u0 (
	.CC_COMPARATOR_LIVES_senal_OutLow(SC_STATEMACHINEGENERAL_COMPARATOR_LIVES_wire),
	.CC_COMPARATOR_LIVES_senal_InLow(SC_COUNTER_LIVES_wire)
);

SC_STATEMACHINEGENERAL SC_STATEMACHINEGENERAL_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEGENERAL_contador_niveles_OutLow(SC_STATEMACHINEGENERAL_COUNTER_LEVELS_wire),
	.SC_STATEMACHINEGENERAL_contador_vidas_OutLow(SC_STATEMACHINEGENERAL_COUNTER_LIVES_wire),
	.SC_STATEMACHINEGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEGENERAL_COMPARATOR_LIVES(SC_STATEMACHINEGENERAL_COMPARATOR_LIVES_wire),
	.SC_STATEMACHINEGENERAL_COMPARATOR_LEVELS(SC_STATEMACHINEGENERAL_COMPARATOR_LEVELS_wire),
	.SC_STATEMACHINEGENERAL_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEGENERAL_Losing_InLow(STATEMACHINEGENERAL_LosingComparator_wire),
	.SC_STATEMACHINEGENERAL_LastRegisterComparator_InLow(Last_register_comparator_OutBus_wire),
	.SC_STATEMACHINEGENERAL_Load_OutLow(STATEMACHINEGENERAL_load_cwire)
); 

//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = RegPOINTTYPE_2_POINTMATRIX_data0_Out | RegBACKGTYPE_2_BACKGMATRIX_data0_Out;
assign regGAME_data1_wire = RegPOINTTYPE_2_POINTMATRIX_data1_Out | RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
assign regGAME_data2_wire = RegPOINTTYPE_2_POINTMATRIX_data2_Out | RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
assign regGAME_data3_wire = RegPOINTTYPE_2_POINTMATRIX_data3_Out | RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
assign regGAME_data4_wire = RegPOINTTYPE_2_POINTMATRIX_data4_Out | RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
assign regGAME_data5_wire = RegPOINTTYPE_2_POINTMATRIX_data5_Out | RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
assign regGAME_data6_wire = RegPOINTTYPE_2_POINTMATRIX_data6_Out | RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
assign regGAME_data7_wire = RegPOINTTYPE_2_POINTMATRIX_data7_Out | RegBACKGTYPE_2_BACKGMATRIX_data7_Out;

assign regOVER_data0_wire = RegPOINTTYPE_2_POINTMATRIX_data0_Out & RegBACKGTYPE_2_BACKGMATRIX_data0_Out;
assign regOVER_data1_wire = RegPOINTTYPE_2_POINTMATRIX_data1_Out & RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
assign regOVER_data2_wire = RegPOINTTYPE_2_POINTMATRIX_data2_Out & RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
assign regOVER_data3_wire = RegPOINTTYPE_2_POINTMATRIX_data3_Out & RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
assign regOVER_data4_wire = RegPOINTTYPE_2_POINTMATRIX_data4_Out & RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
assign regOVER_data5_wire = RegPOINTTYPE_2_POINTMATRIX_data5_Out & RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
assign regOVER_data6_wire = RegPOINTTYPE_2_POINTMATRIX_data6_Out & RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
assign regOVER_data7_wire = RegPOINTTYPE_2_POINTMATRIX_data7_Out & RegBACKGTYPE_2_BACKGMATRIX_data7_Out;


assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
	       (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
	       (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
	       (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
	       (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
	       (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
	       (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
						{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};
									 
matrix_ctrl matrix_ctrl_unit_0( 
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InHigh) //~lowRst_System
 ); 
 
//~ imagen img1(
//~ .act_add(add), 
//~ .max_in(data_max) );

//~ SC_CTRLMATRIX SC_CTRLMATRIX_u0( 
//~ .SC_CTRLMATRIX_max7219DIN_Out(BB_SYSTEM_max7219DIN_Out),	//max7219_din 
//~ .SC_CTRLMATRIX_max7219NCS_out(BB_SYSTEM_max7219NCS_Out),	//max7219_ncs 
//~ .SC_CTRLMATRIX_max7219CLK_Out(BB_SYSTEM_max7219CLK_Out),	//max7219_clk
//~ .SC_CTRLMATRIX_dispdata(data_max), 
//~ .SC_CTRLMATRIX_dispaddr(add),
//~ .SC_CTRLMATRIX_intensity(4'hA),
//~ .SC_CTRLMATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
//~ .SC_CTRLMATRIX_RESET_InHigh(~BB_SYSTEM_RESET_InHigh) 		//~lowRst_System
 //~ ); 
 
//~ SC_IMAGE SC_IMAGE_u0(
//~ .SC_IMAGE_actadd(add), 
//~ .SC_IMAGE_maxin(data_max) );

//######################################################################
//#	TO TEST
//######################################################################

assign BB_SYSTEM_startButton_Out = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_upButton_Out = BB_SYSTEM_upButton_InLow_cwire;
assign BB_SYSTEM_downButton_Out = BB_SYSTEM_downButton_InLow_cwire;
assign BB_SYSTEM_leftButton_Out = BB_SYSTEM_leftButton_InLow_cwire;
assign BB_SYSTEM_rightButton_Out = BB_SYSTEM_rightButton_InLow_cwire;
//TO TEST
assign BB_SYSTEM_TEST0 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST1 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST2 = BB_SYSTEM_startButton_InLow_cwire;

//######################################################################
//#	TO 7SEG
//######################################################################

CC_BIN2BCD1 CC_BIN2BCD1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_BIN2BCD_bcd_OutBUS(BIN2BCD1_2_SEVENSEG1_data_BUS_wire),
	.CC_BIN2BCD_bin_InBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire)
);

CC_SEVENSEG1 CC_SEVENSEG1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_SEVENSEG1_an(BB_SYSTEM_display_OutBUS[11:8]),
	.CC_SEVENSEG1_a(BB_SYSTEM_display_OutBUS[0]),
	.CC_SEVENSEG1_b(BB_SYSTEM_display_OutBUS[1]),
	.CC_SEVENSEG1_c(BB_SYSTEM_display_OutBUS[2]),
	.CC_SEVENSEG1_d(BB_SYSTEM_display_OutBUS[3]),
	.CC_SEVENSEG1_e(BB_SYSTEM_display_OutBUS[4]),
	.CC_SEVENSEG1_f(BB_SYSTEM_display_OutBUS[5]),
	.CC_SEVENSEG1_g(BB_SYSTEM_display_OutBUS[6]),
	.CC_SEVENSEG1_dp(BB_SYSTEM_display_OutBUS[7]),
	.CC_SEVENSEG1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.CC_SEVENSEG1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.CC_SEVENSEG1_in0(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[3:0]),
	.CC_SEVENSEG1_in1(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[7:4]),
	.CC_SEVENSEG1_in2(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8]),
	.CC_SEVENSEG1_in3(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8])
);

SC_upCOUNTER #(.upCOUNTER_DATAWIDTH(DATAWIDTH_BUS)) SC_upCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upCOUNTER_data_OutBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire),
	.SC_upCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upCOUNTER_upcount_InLow(STATEMACHINEPOINT_load0_cwire)
);

endmodule
