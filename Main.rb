require "./ArduinoManager"
require "./DiscordManager"
require "./DiscordApiData"

# 各種データ初期化
discordData = DiscordApiData.new

# オブジェクト初期化
arduino = ArduinoManager.new
controler = DiscordManager.new(discordData)

# message
playMessage = "!play 芝浦工業大学校歌"
message0 = "こんにちは"


# 無限ループ
loop do
	# Arduinoのアップデート
	isUpdate = arduino.getSerialValue

	# アップデートするなら
	if (isUpdate)
		# ユーザーサーバーミュート
		if (arduino.isMuteUser)
			controler.userMicMute
		end
		if (!arduino.isMuteUser)
			controler.userMicUnMute
		end

		# 音楽ボットミュート
		if (arduino.isMuteMusicBot)
			controler.botMicMute
		end
		if (!arduino.isMuteMusicBot)
			controler.botMicUnMute
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

		# 保留

		# 保留音量調節

		# マイクによる自動ミュート
	end

end
