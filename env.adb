
-- Author:              A. Ireland
--
-- Address:             School Mathematical & Computer Sciences
--                      Heriot-Watt University
--                      Edinburgh, EH14 4AS
--
-- E-mail:              a.ireland@hw.ac.uk
--
-- Last modified:       7.9.2023
--
-- Filename:            env.adb
--
-- Description:         Provides the drivers required for simulating the
--                      environment in which the ADLS operates.


pragma SPARK_Mode (Off);
with Text_IO, Sensors, Console, Doors; 
use type Sensors.Sensor_Type;

package body Env is

   Env_File: Text_IO.File_Type;

   package Integer_INOUT is new Text_IO.Integer_IO(Integer);

   procedure Update is
      
      Sensor_1: Integer;
      Sensor_2: Integer;
      Sensor_3: Integer;
      
      AutoSig: Integer;

   begin
      -- Update env file
      Integer_INOUT.Get(Env_File, Sensor_1);
      Integer_INOUT.Get(Env_File, Sensor_2);
      Integer_INOUT.Get(Env_File, Sensor_3);
      Sensors.Write_Sensors(Sensor_1, Sensor_2, Sensor_3);
      
      Integer_INOUT.Get(Env_File, AutoSig);

      if AutoSig = 1 then
         Console.Enable_Auto_Mode;
      else
         Console.Disable_Auto_Mode;
      end if;
      Text_IO.Put('.');      
   end Update;

   function At_End return Boolean is
   begin
      return Text_IO.End_Of_File(Env_File);
   end At_End;

   procedure Open_File is
   begin
      Text_IO.Open(Env_File, Text_IO.In_File, "env.dat");
   end Open_File;

   procedure Close_File is
   begin
      Text_IO.Close(Env_File);
      Text_IO.Put_Line(" [ complete ]");
   end Close_File;

end Env;

