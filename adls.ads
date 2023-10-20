--
-- Author:              A. Olaobaju
-- Created:             11.10.2023
-- E-mail:              ajo2002@hw.ac.uk
--
-- Last modified:       16/10/2023
--
-- Filename:            adls.ads
--
-- Description:         Implements the controller associated with the adls.

pragma SPARK_MODE (On);
with Sensors, Doors, Console;
package Adls
is
	SPEED_LIMIT: constant Integer:= 4;
	Auto_Mode_Cnt: Integer:= 0;
	Previous_Auto_Mode_State : Boolean := False;
procedure Controller
with
	Global => (Input => (Sensors.SensorState, Console.AutoState),
			   In_Out => (Doors.LockedState, Console.IndicatorState, Auto_Mode_Cnt, Previous_Auto_Mode_State)),
	Depends => (Doors.LockedState => (Sensors.SensorState, Doors.LockedState, Console.AutoState),
				Console.IndicatorState => (Sensors.SensorState, Console.IndicatorState, Console.AutoState), 
				Auto_Mode_Cnt => (Auto_Mode_Cnt, Console.AutoState, Previous_Auto_Mode_State), Previous_Auto_Mode_State => (Console.AutoState));
end Adls;