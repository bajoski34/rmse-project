--
-- Author:              A. Ireland
-- Updated:             23.8.2023
-- Description:         Models the console subsystem: door lock indicator (system output) and auto mode (driver input).

pragma SPARK_Mode (On); 
package  Console

is
   pragma Elaborate_Body;
   
   IndicatorState: Boolean; -- tells the driver whether or not the doors are locked.
   AutoState:      Boolean; -- Set to True when Auto_Mode enabled and False when Manual_Mode enabled.
   
   procedure Enable_Indicator
   with
     Global => (Output => IndicatorState),
     Depends => (IndicatorState => null);

   procedure Disable_Indicator
   with
     Global => (Output => IndicatorState),
     Depends => (IndicatorState => null);
   
   function Indicator_Enabled return Boolean
   with
     Global => (Input => IndicatorState),
     Depends => (Indicator_Enabled'Result => IndicatorState);
   
   procedure Enable_Auto_Mode
   with
     Global => (Output => AutoState),
     Depends => (AutoState => null);

   procedure Disable_Auto_Mode
   with
     Global => (Output => AutoState),
     Depends => (AutoState => null);

   function Auto_Mode_Enabled return Boolean
   with
     Global => (Input => AutoState),
     Depends => (Auto_Mode_Enabled'Result => AutoState);
   
end Console;
