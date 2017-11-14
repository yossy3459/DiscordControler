# SerialPortData: シリアルポートの属性を定義するクラス
class SerialPortData

	attr_reader :serialPort, :serialBps

	def initialize
		@serialPort = "/dev/cu.usbmodem1411"  # ここをArduinoのシリアルポートに変更
		@serialBps = 9600
	end

end
