require 'rubygems'
require 'SerialPort'

class ArduinoManager

	# アクセサ
	# get
	attr_reader :isMuteUser, :isMuteMusicBot, :isOnHold, :isPlayMusicBot, :isSendMessage0, :isSendMessage1, :volumeInput, :micInput
	# set
	attr_writer :isMuteUser, :isMuteMusicBot, :isOnHold, :isPlayMusicBot, :isSendMessage0, :isSendMessage1, :volumeInput, :micInput

	def initialize()
		# バッファ (String型で初期化)
		@buf = String.new

		# データ
		# スイッチ (状態保持)
		@isMuteUser = false  # ユーザサーバーミュート
		@isMuteMusicBot = false  # 音楽ボットミュート
		@isOnHold = false  # 保留ボタン

		# スイッチ (状態非保持)
		@isPlayMusicBot = false  # 音楽ボット再生
		@isSendMessage0 = false  # メッセージ0
		@isSendMessage1 = false  # メッセージ1

		# 可変抵抗 (int [0 19])
		@volumeInput = 0

		# マイク
		@micOverThreshold = true

		# シリアルポートオープン
		@serial_port = "/dev/cu.usbmodem1411"
		@serial_bps = 9600
		@sp = SerialPort.new(@serial_port, @serial_bps)
	end

	def getSerialValue
		# 更新するかどうか
		isUpdate = true

		# シリアル値読み取り
		@buf = @sp.gets
		# puts("Arduino: " + @buf.chomp)

		# 読み取ったシリアル値に応じて属性を変更
		case @buf.chomp
		when "sw2: 0"
			@isMuteUser = false
			puts("isMuteUser: false")
		when "sw2: 1"
			@isMuteUser = true
			puts("isMuteUser: true")
		when "sw3: 0"
			@isMuteMusicBot = false
			puts("isMuteMusicBot: false")
		when "sw3: 1"
			@isMuteMusicBot = true
			puts("isMuteMusicBot: true")
		when "sw4: 0"
			@isOnHold = false
			puts("isOnHold: false")
		when "sw4: 1"
			@isOnHold = true
			puts("isOnHold: true")
		when "sw5"
			@isPlayMusicBot = true
			puts("isPlayMusicBot")
		when "sw6"
			@isSendMessage0 = true
			puts("isSendMessage0")
		when "sw7"
			@isSendMessage1 = true
			puts("isSendMessage1")
		else
			isUpdate = false
		end

		return isUpdate
	end
end
