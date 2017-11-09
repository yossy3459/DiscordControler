require "./ApiData"
require "./DiscordControler"
require 'rubygems'

# 各種データ初期化
data = ApiData.new
controler = DiscordControler.new(data)

@serial_port = "/dev/cu.usbmodem1411" #シリアルのポートを指定。OSによって違うので確認のこと。
@serial_bps = 9600

sp = SerialPort.new(@serial_port,@serial_bps)

# 無限ループ
loop do

	buf = sp.gets

	# 分岐
	case buf.chomp
	when "sw1"
		puts(buf)
		controler.micMute
	when "!sw1"
		controler.micUnMute
		puts(buf)
	when "sw0"
		controler.sendMessageFromParam("arduinoからの入力")
		puts(buf)
	when "exit"
		break
	else
		next
	end

end
