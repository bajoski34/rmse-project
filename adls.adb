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
package body Adls
is
	procedure Controller
	is
		Sensor_Value: Sensors.Sensor_Type;
		Auto_Mode_Cnt: Integer;
	begin
		Sensor_Value:= Sensors.Read_Sensor_Majority;
		Auto_Mode_Cnt:= 0;

		if Console.Auto_Mode_Enabled then
			if Sensor_Value < SPEED_LIMIT and Doors.Locked then
				Doors.Unlock;
				Console.Disable_Indicator;
			else
				Doors.Lock;
				Console.Enable_Indicator;
			end if;
		end if;
	end Controller;
end Adls;
