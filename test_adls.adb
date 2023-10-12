-- Author:              A. Ireland
--
-- Address:             School Mathematical & Computer Sciences
--                      Heriot-Watt University
--                      Edinburgh, EH14 4AS
--
-- E-mail:              a.ireland@hw.ac.uk
--
-- Last modified:       10.9.2022
--
-- Filename:            test_adls.adb
--
-- Description:         Test harness for the ADLS. Note that test data and results
--                      are managed via the Env and Log packages respectively.

pragma SPARK_Mode (Off); 
with Env, Log, ADLS, Sensors, Console, Doors;
use type Sensors.Sensor_Type;
procedure Test_ADLS is
begin
   Env.Open_File;
   Log.Open_File;
   loop
      exit when Env.At_End;
      Env.Update;
      Log.Update;
      ADLS.Controller;
      Log.Update;
   end loop;
   Env.Close_File;
   Log.Close_File;
end Test_ADLS;