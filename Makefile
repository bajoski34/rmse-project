check:
	gnatprove -P default.gpr --mode=check -u adls.ads adls.adb sensors.ads sensors.adb doors.ads doors.adb console.ads console.adb

prove:
	gnatprove -P default.gpr --mode=prove -u adls.ads adls.adb sensors.ads sensors.adb doors.ads doors.adb console.ads console.adb

flow:
	gnatprove -P default.gpr --mode=flow -u adls.ads adls.adb sensors.ads sensors.adb doors.ads doors.adb console.ads console.adb 

build:
	gnatmake test_adls.adb

pkg:
	zip abraham-olaobaju-F21RS *.ads *.adb *.gpr *.dat

clean: 
	rm abraham-olaobaju-F21RS.zip && rm -rf ./gnatprove && rm *.ali *.o log.dat