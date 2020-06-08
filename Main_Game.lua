maps = {"Beach", "Town"}
game_mode = {"Team Deathmatch"}

--game board
local Gameboard_Header = game.Workspace.Game_Elements.Model.Game_Board.SurfaceGui.Header.Title
local Gameboard_Body = game.Workspace.Game_Elements.Model.Game_Board.SurfaceGui.Background.Body



--Config Variables
local Min_Players = game.ServerStorage.Configuration.Min_Players
local Intermission_Countdown_Config = game.ServerStorage.Configuration.Intermission_Countdown_config

--Game Data variables
local Players = game.ServerStorage.Game_Data.Players
local Intermission_Countdown = game.ServerStorage.Game_Data.Intermission_Countdown
local Chosen_Map = game.ServerStorage.Game_Data.Chosen_map

--Set default Values
Players.Value = 0
Intermission_Countdown.Value = 0


function Intermission()
	Intermission_Countdown.Value = Intermission_Countdown_Config.Value
	repeat
		wait(1)
		Intermission_Countdown.Value = Intermission_Countdown.Value - 1
		print("Starting game in: " .. (Intermission_Countdown.Value))
		Gameboard_Header.Text = "Starting Game in..."
		Gameboard_Body.Text = (Intermission_Countdown.Value)
	until Intermission_Countdown.Value == 0
	print("Starting game")
	Gameboard_Header.Text = "..."
	Gameboard_Body.Text = "Starting Game"
	Picking_Map()
end

function Choose_Gamemode()
	print("Choosing gamemode")
end
	
	
	
	
function Spawning_Map()
	if Chosen_Map.Value == "Beach"
		then game.ServerStorage.Maps.Beach.Parent = workspace
			print("Spawning Map Beach")
			Gameboard_Header.Text = "Map chosen..."
			Gameboard_Body.Text = "Beach"
			wait(3)
			Choose_Gamemode()
			
		end
	if Chosen_Map.Value == "Town"
		then game.ServerStorage.Maps.Town.Parent = workspace
			print("Spawning Map Town")
			Gameboard_Header.Text = "Map chosen..."
			Gameboard_Body.Text = "Town"
			wait(3)
			Choose_Gamemode()
		end
end




function Picking_Map()
	wait(1)
	print("Picking Map")
	Gameboard_Body.Text = "Picking map..."
	local value = math.random(1,#maps)
	local map_chosen = maps[value]
	print(map_chosen)
	Chosen_Map.Value = map_chosen
	Spawning_Map()
	
end




--Phase one - checking player count
repeat
	wait(1)
	if Players.Value < Min_Players.Value then
		print("Not Enough Players. Current Players: " .. (Players.Value))
		Gameboard_Header.Text = "..."
		Gameboard_Body.Text = "Not Enough Players"
	end
until Players.Value >= Min_Players.Value
print("Enough Players")
Gameboard_Header.Text = "..."
Gameboard_Body.Text = "Enough Players"

Intermission()
