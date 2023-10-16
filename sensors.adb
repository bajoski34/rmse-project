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
        Value_Counts: array (Sensor_Index_Type'Range) of Natural := (others => 0);
        Majority_Value: Sensor_Type;
    begin
        -- Count the occurrences of each sensor value
        for I in Sensor_Index_Type loop
            Value_Counts(SensorState(I)) := Value_Counts(SensorState(I)) + 1;
        end loop;

        -- Find the value with the maximum count
        Majority_Value := Sensor_Type'First;
        for V in Sensor_Type'Range loop
            if Value_Counts(V) > Value_Counts(Majority_Value) then
                Majority_Value := V;
            end if;
        end loop;

        return Majority_Value;
    end Read_Sensor_Majority;


end Sensors;