--
-- Author:              A. Ireland
-- Updated:             23.8.2023
-- Description:         Models the car door locking subsystem.

pragma SPARK_Mode (On);
package Doors

is
   pragma Elaborate_Body;
   
   LockedState: Boolean;
   
   procedure Unlock
   with
     Global => (Output => LockedState),
     Depends => (LockedState => null);

   procedure Lock
   with
     Global => (Output => LockedState),
     Depends => (LockedState => null);

   function Locked return Boolean
   with
     Global => (Input => LockedState),
     Depends => (Locked'Result => LockedState);

end Doors;

