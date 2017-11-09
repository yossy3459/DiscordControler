# Arduinoから取得したデータを保持するクラス
class ArduinoData

	# アクセサ
	# get
	attr_reader :isMuteUser, :isMuteMusicBot, :isOnHold, :isPlayMusicBot, :isSendMessage0, :isSendMessage1, :volumeInput, :micInput
	# set
	attr_writer :isMuteUser, :isMuteMusicBot, :isOnHold, :isPlayMusicBot, :isSendMessage0, :isSendMessage1, :volumeInput, :micInput

	def initialize
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
	end

end
