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
local function sFLY(vfly)
 repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
 repeat wait() until IYMouse
 if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

 local T = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
 local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
 local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
 local SPEED = 0

 local function FLY()
  FLYING = true
  local BG = Instance.new('BodyGyro')
  local BV = Instance.new('BodyVelocity')
  BG.P = 9e4
  BG.Parent = T
  BV.Parent = T
  BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
  BG.CFrame = T.CFrame
  BV.Velocity = Vector3.new(0, 0, 0)
  BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
  task.spawn(function()
   repeat wait()
    if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
     Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
    end
    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
     SPEED = 50
    elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
     SPEED = 0
    end
    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
     BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
     lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
    elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
     BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
    else
     BV.Velocity = Vector3.new(0, 0, 0)
    end
    BG.CFrame = workspace.CurrentCamera.CoordinateFrame
   until not FLYING
   CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
   lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
   SPEED = 0
   BG:Destroy()
   BV:Destroy()
   if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
    Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
   end
  end)
 end
 flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
  if KEY:lower() == 'w' then
   CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
  elseif KEY:lower() == 's' then
   CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
