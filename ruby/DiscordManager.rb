require 'discordrb'
require "./DiscordApiData"

# DiscordManager: Discordを管理するクラス
class DiscordManager

	def initialize()
		# データ読み込み
		@data = DiscordApiData.new

		# 属性初期化
		@bot = @data.bot
		@botID = @data.botID
		@botToken = @data.bot.token
		@serverID = @data.serverID
		@textChannelID = @data.textChannelID
		@voiceChannelID = @data.voiceChannelID
		@userID = @data.userID
		@musicBotID = @data.musicBotID

		# bot: 非同期で開始
		@bot.run :async

		# インスタンス化
		@server = @bot.server(@serverID)
		@textChannel = @bot.channel(@textChannelID)
		@voiceChannel = @bot.channel(@voiceChannelID)
		# @user = @bot.user(@userID)
		@member = @bot.member(@serverID, @userID)
		@musicBotMember = @bot.member(@serverID, @musicBotID)

		# BotをVoice Channelへ接続
		@voiceBot = @bot.voice_connect(@voiceChannel)
		@voiceBot.filter_volume = 1
	end

	# SendMesseage: キーボードから入力したメッセージをDiscordに投稿
	def sendMessage
		print "Send: "
		message = gets

		# @param [int] channel.id Discord channelのID
		# @param [string] message 送信するメッセージ
		@bot.send_message(@textChannelID, message)
	end

	# sendMessageFromParam: 引数に指定したメッセージをDiscordに投稿
	# @param [string] message 送信するメッセージ
	def sendMessageFromParam message
		# @param [int] channel.id Discord channelのID
		# @param [string] message 送信するメッセージ
		@bot.send_message(@textChannelID, message)
	end

	# muteUserMic: ユーザのマイクをミュートにする
	def muteUserMic
		@member.server_mute
	end

	# unMuteUserMic: ユーザのマイクのミュートを解除する
	def unMuteUserMic
		@member.server_unmute
	end

	# botMicMute: botのマイクをミュートにする
	def muteBotMic
		@musicBotMember.server_mute
	end

	# botMicUnMute: botのマイクのミュートを解除する
	def unMuteBotMic
		@musicBotMember.server_unmute
	end

	# adjustBotVolume: botが再生している音楽の音量を変更
	# @param [int] value 音量の値
	def adjustBotVolume value
		@voiceBot.filter_volume = value
	end

	# playMusic: botから音楽を再生する
	def playMusic
		sendMessageFromParam "♪♪♪♪♪ 保留中 ♪♪♪♪♪"
		# スレッド生成
		@playingThread = Thread.start do
			begin
				loop do
					# @param [string] filePass 音楽ファイルのパス
					@voiceBot.play_file './music/HoldOn.mp3'
				end
			ensure
				sendMessageFromParam "保留解除"
			end
		end
	end

	# stopMusic: botが再生している音楽を停止させる
	def stopMusic
		@voiceBot.stop_playing

		# 現在のスレッド以外をkill
		Thread::list.each { |t| Thread::kill(t) if t != Thread::current }
	end

end
