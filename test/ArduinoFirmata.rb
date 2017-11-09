#!/usr/bin/env ruby
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require "rubygems"
require "arduino_firmata"
require "./ArduinoData"

# Arduinoと通信を行う
#class ArduinoFirmata

arduino = ArduinoFirmata.connect ARGV.shift

arduino.pin_mode 3, ArduinoFirmata::INPUT  # isMuteUser
arduino.pin_mode 4, ArduinoFirmata::INPUT  # isMuteMusicBot
arduino.pin_mode 5, ArduinoFirmata::INPUT  # isOnHold
arduino.pin_mode 6, ArduinoFirmata::INPUT  # isPlayMusicBot
arduino.pin_mode 7, ArduinoFirmata::INPUT  # isSendMessage0


# arduino.pin_mode 8, ArduinoFirmata::OUTPUT  # ledMuteUser
# arduino.pin_mode 9, ArduinoFirmata::OUTPUT  # ledMuteMusicBot
# arduino.pin_mode 10, ArduinoFirmata::OUTPUT  # ledOnHold


arduino.digital_write 8, false
arduino.digital_write 9, false
arduino.digital_write 10, false

loop do
	if arduino.digital_read 3
		puts "on"
		arduino.digital_write 8, true
	else
		puts "off"
		arduino.digital_write 8, false
	end
	sleep 0.1

end


#end
