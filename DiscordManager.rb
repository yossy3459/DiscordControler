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
		@user = @bot.user(@userID)
		@member = @bot.member(@serverID, @userID)
		@musicBotMember = @bot.member(@serverID, @musicBotID)

		# BotをVoice Channelへ接続
		@bot.voice_connect(@voiceChannel)
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
	def sendMessageFromParam(message)
		# @param [int] channel.id Discord channelのID
		# @param [string] message 送信するメッセージ
		@bot.send_message(@textChannelID, message)
	end

	# userMicMute: ユーザのマイクをミュートにする
	def userMicMute
		@member.server_mute
	end

	# userMicUnMute: ユーザのマイクのミュートを解除する
	def userMicUnMute
		@member.server_unmute
	end

	# botMicMute: botのマイクをミュートにする
	def botMicMute
		@musicBotMember.server_mute
	end

	# botMicUnMute: botのマイクのミュートを解除する
	def botMicUnMute
		@musicBotMember.server_unmute
	end

end
