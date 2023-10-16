--
-- Author:              A. Olaobaju
-- Created:             11.10.2023
-- Description:         Models the console subsystem: door lock indicator (system output) and auto mode (driver input).

pragma SPARK_Mode (On); 
package body Console

is

	procedure Enable_Indicator is
	begin
		IndicatorState:= TRUE;
	end Enable_Indicator;

	procedure Disable_Indicator is
	begin
		IndicatorState:= FALSE;
	end Disable_Indicator;

	function Indicator_Enabled return Boolean
	is
	begin
		return IndicatorState;
	end Indicator_Enabled;

	procedure Enable_Auto_Mode is
	begin
		AutoState:= TRUE;
	end Enable_Auto_Mode;

	procedure Disable_Auto_Mode is
	begin
		AutoState:= FALSE;
	end Disable_Auto_Mode;

	function Auto_Mode_Enabled return Boolean
	is
	begin
		return AutoState;
	end Auto_Mode_Enabled;

end Console;
