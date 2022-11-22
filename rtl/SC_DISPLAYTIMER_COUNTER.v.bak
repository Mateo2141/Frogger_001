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
module SC_DISPLAYTIMER_COUNTER #(parameter DISPLAYTIMER_COUNTER_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_DISPLAYTIMER_COUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_DISPLAYTIMER_COUNTER_CLOCK_50,
	SC_DISPLAYTIMER_COUNTER_RESET_InHigh,
	SC_DISPLAYTIMER_COUNTER_upcount_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[DISPLAYTIMER_COUNTER_DATAWIDTH-1:0]	SC_DISPLAYTIMER_COUNTER_data_OutBUS;
input		SC_DISPLAYTIMER_COUNTER_CLOCK_50;
input		SC_DISPLAYTIMER_COUNTER_RESET_InHigh;
input		SC_DISPLAYTIMER_COUNTER_upcount_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [DISPLAYTIMER_COUNTER_DATAWIDTH-1:0] DISPLAYTIMER_COUNTER_Register;
reg [DISPLAYTIMER_COUNTER_DATAWIDTH-1:0] DISPLAYTIMER_COUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_DISPLAYTIMER_COUNTER_upcount_InLow == 1'b0)
		DISPLAYTIMER_COUNTER_Signal = DISPLAYTIMER_COUNTER_Register + 1'b1;
	else
		DISPLAYTIMER_COUNTER_Signal = DISPLAYTIMER_COUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_DISPLAYTIMER_COUNTER_CLOCK_50, posedge SC_DISPLAYTIMER_COUNTER_RESET_InHigh)
begin
	if (SC_DISPLAYTIMER_COUNTER_RESET_InHigh  == 1'b1)
		DISPLAYTIMER_COUNTER_Register <= 0;
	else
		DISPLAYTIMER_COUNTER_Register <= DISPLAYTIMER_COUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_DISPLAYTIMER_COUNTER_data_OutBUS = DISPLAYTIMER_COUNTER_Register;

endmodule
