check:
	gnatprove -P default.gpr --mode=check -u sensors.adb sensors.adb doors.ads doors.adb console.ads console.adb adls.ads adls.adb

prove:
	gnatprove -P default.gpr --mode=prove -u sensors.adb sensors.adb doors.ads doors.adb console.ads console.adb adls.ads adls.adb

flow:
	gnatprove -P default.gpr --mode=flow -u sensors.adb sensors.adb doors.ads doors.adb console.ads console.adb adls.ads adls.adb

build:
	gnatmake test_adls.adb

pkg:
	zip adls *.ads *.adb Makefile *gpr

clean:
	rm adls.zip