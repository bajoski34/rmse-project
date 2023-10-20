--
-- Author:              A. Olaobaju
-- Created:             11.10.2023
-- Description:         Models the car door locking subsystem.
pragma SPARK_MODE (On);
package body Doors 

is

	procedure Unlock
	is
	begin
		LockedState:= FALSE;
	end Unlock;

	procedure Lock
	is
	begin
		LockedState:= TRUE;
	end Lock;

	function Locked return Boolean
	is
	begin
		return LockedState;
	end Locked;

begin -- initialization
   LockedState:= False;
end Doors;