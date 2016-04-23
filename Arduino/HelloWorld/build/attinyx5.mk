ifeq ($(OS),Windows_NT)
SHELL = $(ComSpec)
RMDIR = rmdir /s /q
mymkdir = if not exist "$1" mkdir "$1"
else
RMDIR = rm -fr
mymkdir = mkdir -p $1
endif

PROJECT_OBJS = \
	attinyx52/project/HelloWorld.cpp.o \

PLATFORM_OBJS = \
	attinyx52/platform/cores/tiny/HardwareSerial.cpp.o \
	attinyx52/platform/cores/tiny/wiring.c.o \
	attinyx52/platform/cores/tiny/WString.cpp.o \
	attinyx52/platform/cores/tiny/TinySoftwareSerial.cpp.o \
	attinyx52/platform/cores/tiny/wiring_pulse.c.o \
	attinyx52/platform/cores/tiny/wiring_digital.c.o \
	attinyx52/platform/cores/tiny/TinySoftwareSPI.cpp.o \
	attinyx52/platform/cores/tiny/wiring_shift.c.o \
	attinyx52/platform/cores/tiny/Tone.cpp.o \
	attinyx52/platform/cores/tiny/main.cpp.o \
	attinyx52/platform/cores/tiny/WMath.cpp.o \
	attinyx52/platform/cores/tiny/WInterrupts.c.o \
	attinyx52/platform/cores/tiny/Print.cpp.o \
	attinyx52/platform/cores/tiny/wiring_analog.c.o \

LIBRARIES_OBJS = \

TARGETS = \
	attinyx52/HelloWorld.hex \

all: $(TARGETS)

attinyx52/HelloWorld.hex: attinyx52/HelloWorld.elf
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-objcopy" -O ihex -R .eeprom  "attinyx52/HelloWorld.elf" "attinyx52/HelloWorld.hex"

attinyx52/HelloWorld.elf: $(PROJECT_OBJS) $(LIBRARIES_OBJS) attinyx52/core.a
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-gcc" -w -Os -Wl,--gc-sections -mmcu=attiny85  -o "attinyx52/HelloWorld.elf" $(PROJECT_OBJS) $(LIBRARIES_OBJS) "attinyx52/core.a" "-Lattinyx52" -lm

attinyx52/core.a:	$(PLATFORM_OBJS)

clean:
	$(RMDIR) attinyx52

size:
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-size" -A "attinyx52/HelloWorld.elf"

attinyx52/project/HelloWorld.cpp.o: ../HelloWorld.cpp attinyx52/project/HelloWorld.cpp.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"

attinyx52/project/HelloWorld.cpp.d: ;

-include attinyx52/project/HelloWorld.cpp.d 


attinyx52/platform/cores/tiny/HardwareSerial.cpp.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/HardwareSerial.cpp attinyx52/platform/cores/tiny/HardwareSerial.cpp.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"

attinyx52/platform/cores/tiny/HardwareSerial.cpp.d: ;

-include attinyx52/platform/cores/tiny/HardwareSerial.cpp.d

attinyx52/platform/cores/tiny/wiring.c.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/wiring.c attinyx52/platform/cores/tiny/wiring.c.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-gcc" -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"
	
attinyx52/platform/cores/tiny/wiring.c.d: ;

-include attinyx52/platform/cores/tiny/wiring.c.d

attinyx52/platform/cores/tiny/WString.cpp.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/WString.cpp attinyx52/platform/cores/tiny/WString.cpp.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"

attinyx52/platform/cores/tiny/WString.cpp.d: ;

-include attinyx52/platform/cores/tiny/WString.cpp.d

attinyx52/platform/cores/tiny/TinySoftwareSerial.cpp.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/TinySoftwareSerial.cpp attinyx52/platform/cores/tiny/TinySoftwareSerial.cpp.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"

attinyx52/platform/cores/tiny/TinySoftwareSerial.cpp.d: ;

-include attinyx52/platform/cores/tiny/TinySoftwareSerial.cpp.d

attinyx52/platform/cores/tiny/wiring_pulse.c.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/wiring_pulse.c attinyx52/platform/cores/tiny/wiring_pulse.c.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-gcc" -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"
	
attinyx52/platform/cores/tiny/wiring_pulse.c.d: ;

-include attinyx52/platform/cores/tiny/wiring_pulse.c.d

attinyx52/platform/cores/tiny/wiring_digital.c.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/wiring_digital.c attinyx52/platform/cores/tiny/wiring_digital.c.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-gcc" -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"
	
attinyx52/platform/cores/tiny/wiring_digital.c.d: ;

-include attinyx52/platform/cores/tiny/wiring_digital.c.d

attinyx52/platform/cores/tiny/TinySoftwareSPI.cpp.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/TinySoftwareSPI.cpp attinyx52/platform/cores/tiny/TinySoftwareSPI.cpp.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"

attinyx52/platform/cores/tiny/TinySoftwareSPI.cpp.d: ;

-include attinyx52/platform/cores/tiny/TinySoftwareSPI.cpp.d

attinyx52/platform/cores/tiny/wiring_shift.c.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/wiring_shift.c attinyx52/platform/cores/tiny/wiring_shift.c.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-gcc" -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"
	
attinyx52/platform/cores/tiny/wiring_shift.c.d: ;

-include attinyx52/platform/cores/tiny/wiring_shift.c.d

attinyx52/platform/cores/tiny/Tone.cpp.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/Tone.cpp attinyx52/platform/cores/tiny/Tone.cpp.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"

attinyx52/platform/cores/tiny/Tone.cpp.d: ;

-include attinyx52/platform/cores/tiny/Tone.cpp.d

attinyx52/platform/cores/tiny/main.cpp.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/main.cpp attinyx52/platform/cores/tiny/main.cpp.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"

attinyx52/platform/cores/tiny/main.cpp.d: ;

-include attinyx52/platform/cores/tiny/main.cpp.d

attinyx52/platform/cores/tiny/WMath.cpp.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/WMath.cpp attinyx52/platform/cores/tiny/WMath.cpp.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"

attinyx52/platform/cores/tiny/WMath.cpp.d: ;

-include attinyx52/platform/cores/tiny/WMath.cpp.d

attinyx52/platform/cores/tiny/WInterrupts.c.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/WInterrupts.c attinyx52/platform/cores/tiny/WInterrupts.c.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-gcc" -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"
	
attinyx52/platform/cores/tiny/WInterrupts.c.d: ;

-include attinyx52/platform/cores/tiny/WInterrupts.c.d

attinyx52/platform/cores/tiny/Print.cpp.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/Print.cpp attinyx52/platform/cores/tiny/Print.cpp.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"

attinyx52/platform/cores/tiny/Print.cpp.d: ;

-include attinyx52/platform/cores/tiny/Print.cpp.d

attinyx52/platform/cores/tiny/wiring_analog.c.o: /root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny/wiring_analog.c attinyx52/platform/cores/tiny/wiring_analog.c.d
	@$(call mymkdir,$(dir $@))
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-gcc" -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -mmcu=attiny85 -DF_CPU=8000000L -DARDUINO=10607 -DARDUINO_AVR_ATTINYX5 -DARDUINO_ARCH_AVR   -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/cores/tiny" -I"/root/.arduinocdt/packages/ATTinyCore_Custom/hardware/ATTinyCore_Custom/avr/1.1.0/variants/tinyX5" "$<" -o "$@"
	"/root/.arduinocdt/packages/arduino/tools/avr-gcc/4.8.1-arduino5/bin/avr-ar" rcs  "attinyx52/core.a" "$@"
	
attinyx52/platform/cores/tiny/wiring_analog.c.d: ;

-include attinyx52/platform/cores/tiny/wiring_analog.c.d


