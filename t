local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally2", true))()
local w = library:CreateWindow('Misc')
w:Section('Misc')
local b = w:Button("Find Smallest Servers", function()
    wait(0.5)
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"

    local _place = game.PlaceId
    local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
    function ListServers(cursor)
    local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
    return Http:JSONDecode(Raw)
    end

    local Server, Next; repeat
    local Servers = ListServers(Next)
    Server = Servers.data[1]
    Next = Servers.nextPageCursor
    until Server

    TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
end)

local box = w:Box('WalkSpeed', {
   flag = "ws";
   type = 'number';
}, function(new, old, enter)
   print(new, old, enter)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(new)
end)

local old = workspace.CurrentCamera.FieldOfView
local s = w:Slider("FOV", {
   min = math.floor(workspace.CurrentCamera.FieldOfView);
   max = 120;
   flag = 'fov'
}, function(v)
   workspace.CurrentCamera.FieldOfView = v;
end)
local b2 = w:Button('Reset FOV', function()
   s:Set(old)
end)
