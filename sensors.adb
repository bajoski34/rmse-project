-- Author:              A. Olaobaju
-- Created:             11.10.2023
-- Description:         Models the wheel speed sensors. Note that a single sensor reading is calculated using a majority vote algorithm.

pragma SPARK_Mode (On);
package body Sensors is

    procedure Write_Sensors(Value_1, Value_2, Value_3: in Sensor_Type) is
    begin
        SensorState(Sensor_Index_Type'First) := Value_1;
        SensorState(Sensor_Index_Type'First + 1) := Value_2;
        SensorState(Sensor_Index_Type'Last) := Value_3;
    end Write_Sensors;

    function Read_Sensor(Sensor_Index: in Sensor_Index_Type) return Sensor_Type is
    begin
        return SensorState(Sensor_Index);
    end Read_Sensor;

	function Read_Sensor_Majority return Sensor_Type is
    	Majority_Value : Sensor_Type;
    	Majority_Count : Integer := 0;
    begin
		Majority_Value := 0;
        for I in Sensor_Index_Type loop
            if Majority_Count = 0 then
                Majority_Value := SensorState(I);
                Majority_Count := 1;
            elsif Majority_Value = SensorState(I) then
                Majority_Count := Majority_Count + 1;
            else
                Majority_Count := Majority_Count - 1;
            end if;
        end loop;
        return Majority_Value;
    end Read_Sensor_Majority;

begin -- initialization
   SensorState:= (0,0,0);
end Sensors;