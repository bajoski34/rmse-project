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
	begin
		Sensor_Value:= Sensors.Read_Sensor_Majority;

		-- should only work if previous state is differenct from the current state that auto mode is on.
		if Previous_Auto_Mode_State /= Console.Auto_Mode_Enabled and Console.Auto_Mode_Enabled = TRUE then
			if Auto_Mode_Cnt < Integer'Last then
				Auto_Mode_Cnt := Auto_Mode_Cnt + 1; -- Increment the count when switching from manual to auto mode.
			else
				Auto_Mode_Cnt:= Integer'Last;
			end if;
		end if;

		if Console.Auto_Mode_Enabled then
			if Sensor_Value <= SPEED_LIMIT then
				Doors.Unlock;
				Console.Disable_Indicator;
			else
				Doors.Lock;
				Console.Enable_Indicator;
			end if;
	    end if;

		-- Update the previous state variable
        Previous_Auto_Mode_State := Console.Auto_Mode_Enabled;
	end Controller;
end Adls;