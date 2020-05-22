local PlayerCountInt = game.ServerStorage.Game_Data.Player_Counter

while true do
	wait()
	PlayerCountInt.Value = game.Players.NumPlayers
end
