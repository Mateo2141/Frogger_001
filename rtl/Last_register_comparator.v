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
module CC_LastRegisterCOMPARATOR #(parameter LastRegisterCOMPARATOR_DATAWIDTH=8)(
//////////// OUTPUTS //////////
	CC_LastRegisterCOMPARATOR_win_OutBUS,
//////////// INPUTS //////////
	CC_LastRegisterCOMPARATOR_dataOR_InBUS,
	CC_LastRegisterCOMPARATOR_dataLastRegister_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output reg	[1:0] CC_LastRegisterCOMPARATOR_win_OutBUS;
input 	[LastRegisterCOMPARATOR_DATAWIDTH-1:0] CC_LastRegisterCOMPARATOR_dataOR_InBUS;
input 	[LastRegisterCOMPARATOR_DATAWIDTH-1:0] CC_LastRegisterCOMPARATOR_dataLastRegister_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
	if( CC_LastRegisterCOMPARATOR_dataOR_InBUS == 8'b11111111)
		CC_LastRegisterCOMPARATOR_win_OutBUS = 2'b00;
	else if(CC_LastRegisterCOMPARATOR_dataOR_InBUS != CC_LastRegisterCOMPARATOR_dataLastRegister_InBUS)
		CC_LastRegisterCOMPARATOR_win_OutBUS = 2'b10;
	else
		CC_LastRegisterCOMPARATOR_win_OutBUS = 2'b11;
end

endmodule