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
procedure Controller
	with
	Global => (Input => (Sensors.SensorState, Console.AutoState),
			   In_Out => (Doors.LockedState, Console.IndicatorState)),
	Depends => (Doors.LockedState => (Sensors.SensorState, Doors.LockedState, Console.AutoState),
				Console.IndicatorState => (Sensors.SensorState, Doors.LockedState, Console.IndicatorState, Console.AutoState ));
end Adls;
