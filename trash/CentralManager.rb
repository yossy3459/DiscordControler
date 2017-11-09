require "./ApiData"
require "./DiscordControler"

# 各種データ初期化
data = ApiData.new
controler = DiscordControler.new(data)

# 無限ループ
loop do
	# コマンドの入力, endで終了
	print "Command: "
	command = gets

	# 分岐
	case command.chomp
	when "send"
		controler.sendMessage
	when "sendtemp"
		controler.sendTemporaryMessage
	when "mute"
		controler.micMute
	when "unmute"
		controler.micUnMute
	when "exit"
		break
	else
		puts "(Command: send, sendtemp, mute, unmute, exit)"
	end

end
