require "./ArduinoManager"
require "./DiscordManager"
require "./DiscordApiData"
require "./MessageData"

# オブジェクト初期化
arduino = ArduinoManager.new
controler = DiscordManager.new
message = MessageData.new

# 無限ループ
loop do
	# Arduinoのアップデート
	isUpdate = arduino.getSerialValue

	# アップデートするなら
	if isUpdate
		# ユーザーサーバーミュート
		if arduino.isMuteUser
			controler.muteUserMic
		end
		if !arduino.isMuteUser
			controler.unMuteUserMic
		end

		# 音楽ボットミュート
		if arduino.isMuteMusicBot
			controler.muteBotMic
		end
		if !arduino.isMuteMusicBot
			controler.unMuteBotMic
		end

		# 保留
		if arduino.isOnHold
			controler.playMusic
		end
		if !arduino.isOnHold
			controler.stopMusic
		end

		# 音楽ボット再生
		if arduino.isPlayMusicBot
			controler.sendMessageFromParam message.playMessage
			arduino.isPlayMusicBot = false
		end

		# message0の送信
		if arduino.isSendMessage0
			controler.sendMessageFromParam message.message0
			arduino.isSendMessage0 = false
		end

		# message1の送信
		if arduino.isSendMessage1
			controler.sendMessageFromParam message.message1
			arduino.isSendMessage1 = false
		end

		# 保留音量調節
		if arduino.isChangeVolume
			controler.adjustBotVolume arduino.volumeValue
			arduino.isChangeVolume = false
		end

		# マイクによる自動ミュート
		if arduino.isMicOverThreshold
			controler.sendMessageFromParam message.autoMuteMessage
			controler.muteUserMic
			arduino.isMicOverThreshold = false
		end
	end

end
