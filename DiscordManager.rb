require 'discordrb'
require "./DiscordApiData"

class DiscordManager

	def initialize(data)
		# 属性初期化
		@bot = data.bot
		@botID = data.botID
		@botToken = data.bot.token
		@serverID = data.serverID
		@textChannelID = data.textChannelID
		@voiceChannelID = data.voiceChannelID
		@userID = data.userID
		@musicBotID = data.musicBotID

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
	end

	# SendMesseage: キーボードから入力したメッセージをDiscordに投稿
	def sendMessage
		print "Send: "
		message = gets

		# @param [int] channel.id Discord channelのID
		# @param [string] message 送信するメッセージ
		@bot.send_message(@textChannelID, message)
	end

	# sendMessageFromParam
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

	# playMusic: botから音楽を再生する
	def playMusic
		@voiceBot.play_file 'data/music.mp3'
	end

	# stopMusic: botが再生している音楽を停止させる
	def stopMusic
		@voiceBot.stop_playing
	end

	# adJustBotVolume: botが再生している音楽の音量を変更
	def adJustBotVolume value
		@voiceBot.filter_volume value
	end

end
