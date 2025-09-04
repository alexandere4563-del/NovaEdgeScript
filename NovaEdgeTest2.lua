local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local selectedTheme = "Amethyst"
local Window = Rayfield:CreateWindow({
   Name = "99 Nights In The Forest - Script By Alex",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "99 Nights In The Forest",
   LoadingSubtitle = "Script By Alex",
   Theme = selectedTheme, -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SaverNITF", -- Create a custom folder for your hub/game
      FileName = "K"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key system",
      Note = "Key not provided here", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local InfoTab = Window:CreateTab("Info")
local PlayerTab = Window:CreateTab("Player")
local EspTab = Window:CreateTab("Esp")
local GameTab = Window:CreateTab("Game")
local BringItemTab = Window:CreateTab("Bring Item")
local DiscordTab = Window:CreateTab("Discord")
local SettingsTab = Window:CreateTab("Settings")
local ActiveEspItems,ActiveDistanceEsp,ActiveEspEnemy,ActiveEspChildren,ActiveEspPeltTrader,ActivateFly,AlrActivatedFlyPC,ActiveNoCooldownPrompt,ActiveNoFog,
ActiveAuoChopTree,ActiveKillAura,ActivateInfiniteJump,ActiveNoclip = false,false,false,false,false,false,false,false,false,false,false,false,false
local ParagraphInfoServer = InfoTab:CreateParagraph({Title = "Info", Content = "Loading"})
local DistanceForKillAura = 25
local DistanceForAutoChopTree = 25
Rayfield:Notify({
   Title = "Cheat Version",
   Content = "V.0.19",
   Duration = 2.5,
   Image = "rewind",
})
local function DragItem(Item)
game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(Item)
wait(0.0000001)
game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(Item)
end
local function getServerInfo()
 local Players = game:GetService("Players")
 local playerCount = #Players:GetPlayers()
local maxPlayers = game:GetService("Players").MaxPlayers
local isStudio = game:GetService("RunService"):IsStudio()

 return {
  PlaceId = game.PlaceId,
  JobId = game.JobId,
  IsStudio = isStudio,
  CurrentPlayers = playerCount,
MaxPlayers =maxPlayers
 }
end
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local IYMouse = Players.LocalPlayer:GetMouse()
local FLYING = false
local QEfly = true
local iyflyspeed = 1
local vehicleflyspeed = 1
