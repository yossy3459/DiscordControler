require 'rubygems'
require 'serialport'

@serial_port = "/dev/cu.usbmodem1421" #シリアルのポートを指定。OSによって違うので確認のこと。
@serial_bps = 9600

sp = SerialPort.new(@serial_port,@serial_bps)

count = 0

loop do
  sp.write('y') #serialへの書き込み
  sleep(2)
  sp.write('n')
  sleep(2)
  if count == 20
	break
  end
  count += 1
  puts "#{count}"
end
