require "./ArduinoManager"
require "./DiscordManager"
require "./DiscordApiData"

# 各種データ初期化
discordData = DiscordApiData.new

# オブジェクト初期化
arduino = ArduinoManager.new
controler = DiscordManager.new(discordData)

# message
autoMuteMessage = "周囲で大きな音が発生したため、ユーザのマイクをミュートします！"
playMessage = "!play 芝浦工業大学校歌"
message0 = "こんにちは"
message1 = "お疲れ様でした！"



# 無限ループ
loop do
	# Arduinoのアップデート
	isUpdate = arduino.getSerialValue

	# アップデートするなら
	if (isUpdate)
		# ユーザーサーバーミュート
		if (arduino.isMuteUser)
			controler.muteUserMic
		end
		if (!arduino.isMuteUser)
			controler.unMuteUserMic
		end

		# 音楽ボットミュート
		if (arduino.isMuteMusicBot)
			controler.muteBotMic
		end
		if (!arduino.isMuteMusicBot)
			controler.unMuteBotMic
		end

		# 保留
		if (arduino.isOnHold)
			controler.playMusic
		end
		if (!arduino.isOnHold)
			controler.stopMusic
		end

		# 音楽ボット再生
		if (arduino.isPlayMusicBot)
			controler.sendMessageFromParam playMessage
			arduino.isPlayMusicBot = false
		end

		# message0の送信
		if (arduino.isSendMessage0)
			controler.sendMessageFromParam message0
			arduino.isSendMessage0 = false
		end

		# message1の送信
		if (arduino.isSendMessage1)
			controler.sendMessageFromParam message1
			arduino.isSendMessage1 = false
		end

		# 保留音量調節
		if (arduino.isChangeVolume)
			controler.adjustBotVolume arduino.volumeValue
			arduino.isChangeVolume = false
		end

		# マイクによる自動ミュート
		if (arduino.isMicOverThreshold)
			controler.sendMessageFromParam autoMuteMessage
			controler.muteUserMic
			arduino.isMicOverThreshold = false
		end
	end

end
