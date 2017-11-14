# MessageData: 送信するメッセージを定義するクラス
class MessageData

	# アクセサ
	attr_reader :autoMuteMessage, :playMessage, :message0, :message1

	def initialize
		# message
		@autoMuteMessage = "周囲で大きな音が発生したため、ユーザのマイクをミュートします！"
		@playMessage = "!play 芝浦工業大学校歌"
		@message0 = "こんにちは"
		@message1 = "お疲れ様でした！"
	end

end
