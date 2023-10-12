
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
-- Filename:            log.adb
--
-- Description:         Provides logger that records state information on the
--                      component parts of the ADLS at run-time.

pragma SPARK_Mode (Off);
with Text_IO, Sensors, Console, Doors, ADLS;
use type Sensors.Sensor_Type;
package body Log is

   package Sensor_INOUT is new Text_IO.Enumeration_IO(Sensors.Sensor_Type);
   -- use Sensor_INOUT;
   package Integer_INOUT is new Text_IO.Integer_IO(Integer);
   -- use Integer_INOUT;

   Log_File: Text_IO.File_Type;
   
   procedure Update is

   begin
      -- Update log file
      Integer_INOUT.Put(Log_File, Sensors.Read_Sensor(1), 4);
      Integer_INOUT.Put(Log_File, Sensors.Read_Sensor(2), 10);
      Integer_INOUT.Put(Log_File, Sensors.Read_Sensor(3), 10);
      if Sensors.Read_Sensor_Majority = 151 then
	 Text_IO.Put(Log_File, "    UNDEF");
      else
	 Integer_INOUT.Put(Log_File, Sensors.Read_Sensor_Majority, 9);
      end if;
      if Doors.Locked then
         Text_IO.Put(Log_File, "    LOCKED ");
      else
         Text_IO.Put(Log_File, "    ------ ");
      end if;
      if Console.Indicator_Enabled then
         Text_IO.Put(Log_File, "    ON      ");
      else
         Text_IO.Put(Log_File, " ---------  ");
      end if;
      if Console.Auto_Mode_Enabled then
         Text_IO.Put(Log_File, " ENABLED ");
      else
         Text_IO.Put(Log_File, "---------");
      end if;
      Integer_INOUT.Put(Log_File, ADLS.Auto_Mode_Cnt, 6);
      Text_IO.New_Line(Log_File);            
   end Update;      
      
   procedure Open_File is
   begin
      Text_IO.Create(Log_File, Text_IO.Out_File, "log.dat");
      Text_IO.Put_Line(Log_File,
               "SENSOR-1  SENSOR-2  SENSOR-3  MAJOR  DOORS   INDICATOR  AUTO_MODE  AUTO_CNT");
      Text_IO.Put_Line(Log_File, "  ");
   end Open_File;

   procedure Close_File is
   begin
      Text_IO.Close(Log_File);
   end Close_File;

end Log;
