require 'rubygems'
require 'SerialPort'

class ArduinoManager

	# アクセサ
	# get
	attr_reader :isMuteUser, :isMuteMusicBot, :isOnHold, :isPlayMusicBot, :isSendMessage0, :isSendMessage1, :isChangeVolume, :volumeValue, :isMicOverThreshold
	# set
	attr_writer :isMuteUser, :isMuteMusicBot, :isOnHold, :isPlayMusicBot, :isSendMessage0, :isSendMessage1, :isChangeVolume, :volumeValue, :isMicOverThreshold

	def initialize()
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
		@isChangeVolume = false
		@volumeValue = 0

		# マイク
		@isMicOverThreshold = false

		# シリアルポートオープン
		@serial_port = "/dev/cu.usbmodem1411"
		@serial_bps = 9600
		@sp = SerialPort.new(@serial_port, @serial_bps)
	end

	def getSerialValue
		# 更新するかどうか
		isUpdate = true

		# シリアル値読み取り
		@pin = @sp.gets

		# デバッグ
		puts "Arduino: " + @pin.chomp

		case @pin.chomp
		when "sw2", "sw3", "sw4", "vol"
			@value = @sp.gets

			# デバッグ用
			puts "Arduino: value = " + @value.chomp

			# valueを数値に変換
			@value = @value.to_i
		end



		# 読み取ったシリアル値に応じて属性を変更
		case @pin.chomp
		when "sw2"
			if @value == 0
				@isMuteUser = false
				puts("isMuteUser: false")
			end
			if @value == 1
				@isMuteUser = true
				puts("isMuteUser: true")
			end
		when "sw3"
			if @value == 0
				@isMuteMusicBot = false
				puts("isMuteMusicBot: false")
			end
			if @value == 1
				@isMuteMusicBot = true
				puts("isMuteMusicBot: true")
			end
		when "sw4"
			if @value == 0
				@isOnHold = false
				puts("isOnHold: false")
			end
			if @value == 1
				@isOnHold = true
				puts("isOnHold: true")
			end
		when "sw5"
			@isPlayMusicBot = true
			puts("isPlayMusicBot")
		when "sw6"
			@isSendMessage0 = true
			puts("isSendMessage0")
		when "sw7"
			@isSendMessage1 = true
			puts("isSendMessage1")
		when "vol"
			if !@isOnHold
				@isChangeVolume = true
				@volumeValue = @value
				puts("isChangeVolume")
			end
		when "mic"
			@isMicOverThreshold = true
			@isMuteUser = true
			puts("isMicOverThreshold")
		else
			isUpdate = false
		end

		return isUpdate
	end
end
