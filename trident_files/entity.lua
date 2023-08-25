-- script hash: 9e22d292e648978549355836f9169318ed87f86e4ee790245882995422a468c444a6723636cc72144e6f4b583a731f20
local v2 = _G.NEXT
local v443 = _G.modules
local v8 = game:GetService("Lighting")
local v11 = game:GetService("ReplicatedStorage")
local v14 = game:GetService("ReplicatedFirst")
local v17 = game:GetService("RunService")
local v20 = game:GetService("StarterGui")
local v23 = game:GetService("SoundService")
local v26 = game:GetService("UserInputService")
local v29 = game:GetService("Chat")
local v31 = workspace.Terrain
local v33 = require(v11.ItemConfigs)
local v36 = require(v11.EntityConfigs)
local v39 = Instance.new("Highlight")
v39.Parent = game:GetService("Players").LocalPlayer.PlayerGui
v39.FillTransparency = 1
local v42 = game
local v43 = v42.Players.LocalPlayer:GetMouse()
v42 = v11.Entities
local v44
local v46 = v443.Network.SendCodes
local v449 = v443.Character
local v47 = v443.UI
local v48 = v443.InputManager
local v49 = v443.Network
local v50 = v443.Sound
local v51 = v443.Camera
local v52
local v53 = math.floor
local v54 = {}
local v55 = unpack
local v56 = table.remove
local v57 = math.min
local v58 = {}
v2.Move = function(p1, p2, p3)
    local v61 = v58
    local v62 = v61[p1]
    if v62 then
        v61 = v62.cfg
        local v63 = v62.special
        if v63 then
            local v64 = v63.onMoveOverride
            if v64 then
                v64 = v63.onMoveOverride
                v64(v62, p2, p3)
                return 
            end
        end
        local v68 = v61.ExpectedPacketInterval
        if v68 then
            v68 = v62.interpolationConnection
            if v68 then
                v68 = v62.interpolationConnection
                v68:Disconnect()
            end
            local v69 = 0
            local v70 = v62.goalCFrame
            if not v70 then
                v70 = v62.model.PrimaryPart.CFrame
            end
            v62.startCFrame = v70
            v72 = CFrame.new
            v71 = p2
            v62.goalCFrame = (v72(v71)) * CFrame.fromOrientation(p3.X, p3.Y, p3.Z)
            v62.interpolationConnection = v17.RenderStepped:Connect(function(p4)
                v69 = v69 + p4
                v62.model:PivotTo(v62.startCFrame:Lerp(v62.goalCFrame, v57((v69) / v61.ExpectedPacketInterval, 1)))
            end)
            return 
        end
        v69 = v62.model
        v73 = (CFrame.new(p2)) * CFrame.fromOrientation(p3.X, p3.Y, p3.Z)
        v69:PivotTo(v73)
        v62.pos = p2
        v62.rot = p3
    end
end
local v152 = {}
v2.Load = function(p14, p15, p16, p17, ...)
    v152[#v152 + 1] = {
        [1] = "make", [2] = true, [3] = p14, [4] = p15, [5] = p16, [6] = p17, [7] = ...
    }
end
v2.LoadNoVFX = function(p18, p19, p20, p21, ...)
    v152[#v152 + 1] = {
        [1] = "make", [2] = false, [3] = p18, [4] = p19, [5] = p20, [6] = p21, [7] = ...
    }
end
v2.Unload = function(p22)
    v152[#v152 + 1] = {
        [1] = "des", [2] = true, [3] = p22
    }
end
v2.UnloadNoVFX = function(p23)
    v152[#v152 + 1] = {
        [1] = "des", [2] = false, [3] = p23
    }
end
v2.BulkLoad = function(p24)
    for v239, v238 in p24, nil, nil do
        v2.LoadNoVFX(v55(v238))
    end
end
v2.BulkUnload = function(p25)
    for v248, v247 in p25, nil, nil do
        v2.UnloadNoVFX(v247)
    end
end
v2.Change = function(p26, p27, ...)
    v152[#v152 + 1] = {
        [1] = "chg", [2] = p26, [3] = p27, [4] = ...
    }
end
v2.GetEntityFromPart = function(p28)
    if not p28 then
        return false
    end
    local v263 = p28.Parent
    local v264 = v58
    for v270, v268 in v264, nil, nil do
        if v268.model == v263 then
            return v263, v270, v268.typ
        end
    end
    v264 = false
    return v264
end
v2.GetEntityDataFromPart = function(p29)
    if not p29 then
        return false
    end
    local v276 = v58
    for v281, v282 in v276, nil, nil do
        if v280.model == p29.Parent then
            return v280
        end
    end
    v276 = false
    return v276
end
local function GetQueueSize_1()
    return #v152
end
v2.GetQueueSize = GetQueueSize_1
GetQueueSize_1 = RaycastParams.new
local v286 = GetQueueSize_1()
local v287 = {}
local v289 = workspace.Ignore
v287[1] = v289
v286.FilterDescendantsInstances = v287
v286.FilterType = Enum.RaycastFilterType.Exclude
v286.CollisionGroup = "GroundItemsProxy"
local v290 = time()
v289 = false
local function selectRadial_1()
    local v301 = v47
    local v303 = v301.IsRadialMenuOpen()
    if v303 then
        v301 = v47
        v303 = v301.CloseRadialMenu
        v301 = false
        v303(v301)
        v289 = false
    end
end
v2.selectRadial = selectRadial_1
selectRadial_1 = false
v2.interact = function(p31)
    local v307 = v47
    local v309 = v307.isInputReserved()
    if v309 then
        if p31 then
            return 
        end
    end
    v309 = v289
    selectRadial_1 = v309
    v289 = p31
    if not p31 then
        v307 = v47
        v309 = v307.IsRadialMenuOpen
        local v310 = v309()
        if v310 then
            v307 = v47
            v310 = v307.CloseRadialMenu
            if v48.InputDevice == "Mobile" then
                v307 = false
            end
            v307 = true
            v310(v307)
            v289 = false
            return 
        end
    end
    if p31 then
        v313 = time
        v290 = v313()
        return 
    end
    v314 = selectRadial_1
    if v314 then
        v314 = v52
        if v314 then
            v314 = v52[1]
            v312 = v36
            v311 = v52[2]
            v312 = v312[v311].InteractOptions
            v311 = v49.Send
            v311(v46.ENT_USE, v314, v312[1])
        end
    end
end
local function Lerp_1(p32, p33, p34)
    return p32 + (p33 - p32) * p34
end
local v327 = 1
local v329 = time()
v2.List = v58
local function init_1()
    local v429 = v36
    local v430
    local v431
    for v439, v433 in v429, v430, v431 do
        local v432 = v433.ClientModule
        if v432 then
            v432 = v54
            v432[v439] = require(script[v433.ClientModule])
        end
    end
    v429 = script
    v429:ClearAllChildren()
    v431 = "UpdateEntity"
    v433 = Enum.RenderPriority.Character
    v439 = v433.Value
    v433 = function(p35)
        local v332 = 1
        local v381 = v152
        local v339 = v57(v53((0.4) / p35), #v381)
        local v340 = v339 + 10
        local v341 = 1
        for v332 = v332, v340, v341 do
            v339 = function()
                local v164 = v152
                if #v164 == 0 then
                    v164 = v2
                    if v164.onChunksLoaded then
                        v164 = v2
                        v164.onChunksLoaded()
                        v164 = nil
                        v2.onChunksLoaded = v164
                    end
                    return 
                end
                v166 = v152[1]
                v56(v152, 1)
                local v169 = v166[1]
                v56(v166, 1)
                if v169 == "make" then
                    (function(p5, p6, p7, p8, p9, ...)
                        local v110 = v54[p7]
                        local v132 = {
                            pos = p8, rot = p9, typ = p7, id = p6, special = v110
                        }
                        local v111 = v36
                        local v112 = v111[p7]
                        v132.cfg = v112
                        if v110 then
                            v112 = v110.getOverrideModel
                            v111 = v132
                            local v113 = v112(v111, ...)
                            if not v113 then
                                v113 = v42[p7]
                                local v115 = v113:Clone()
                            end
                            v132.model = v115
                        else
                            v114 = v42
                            v115 = v114[p7]
                            v132.model = v115:Clone()
                        end
                        v116 = v132.model
                        if not v116 then
                            v116 = error
                            v114 = "failed to create entity of type " .. tostring(p7)
                            v116(v114)
                        end
                        v132.model.Name = "Model"
                        v120 = CFrame.new
                        v117 = (v120(p8)) * CFrame.fromOrientation(p9.X, p9.Y, p9.Z)
                        v132.model:PivotTo(v117)
                        local v134 = workspace
                        v132.model.Parent = v134
                        local v135 = v58
                        v135[p6] = v132
                        if v110 then
                            v135 = v110.onCreate
                            v134 = p5
                            v135(v134, v132, ...)
                        end
                    end)(v55(v166))
                    return 
                end
                if v169 == "des" then
                    (function(p10, p11)
                        local v138 = v58
                        local v139 = v138[p11]
                        if not v139 then
                            v138 = warn
                            v138("Entity with ID", p11, "could not be removed due to it not being loaded to the client")
                            print(debug.traceback())
                            return 
                        end
                        local v145 = v54
                        local v146 = v139.typ
                        local v147 = v145[v146]
                        if v147 then
                            v145 = v147.onDestroy
                            v146 = p10
                            v145(v146, v139)
                        end
                        local v149 = v139.model
                        if v149 then
                            v149 = v139.model
                            v149:Destroy()
                        end
                        v58[p11] = nil
                    end)(v55(v166))
                    return 
                end
                if v169 == "chg" then
                    (function(p12, p13, ...)
                        local v156 = v58[p12]
                        v54[v156.typ][p13](v156, ...)
                    end)(v55(v166))
                end
            end
            v339()
        end
        v340 = v39
        v341 = nil
        v340.Adornee = v341
        local v342 = v47.IsRadialMenuOpen()
        if v342 then
            return 
        end
        v342 = v51.GetCFrame
        local v343 = v342()
        local v347 = workspace:Raycast(v343.Position, (v343.LookVector) * 8, v286)
        v332 = nil
        v52 = v332
        local v387 = false
        local v348 = v47
        local v350 = v348.isInputReserved()
        if not v350 then
            if v347 then
                v348 = v2
                v350 = v348.GetEntityDataFromPart
                v348 = v347.Instance
                local v351 = v350(v348)
                if v351 then
                    local v352 = v351.typ
                    local v353 = v351.id
                    v381 = v36[v352]
                    local v388 = v381.InteractOptions
                    if v388 then
                        v52 = {
                            [1] = v353, [2] = v352
                        }
                        local v389 = v327
                        v327 = v389 + (0 - v389) * 0.2
                        local v397 = v48.GetKeybindString("Entity.interact") .. " " .. v388[1]
                        if #v388 >= 1 then
                            v397 = v397 .. "\10hold for more options"
                        end
                        v47.SetMidTextInfo(v327, v397)
                        v39.OutlineTransparency = v327 + 0.5
                        v39.Adornee = v351.model
                    end
                    v355 = v381.HealthVisible
                    if v355 then
                        v362 = time
                        v364 = v329
                        v355 = v362() - v364
                        if v355 >= 0.1 then
                            v355 = time
                            v329 = v355()
                            local v417 = v49
                            v364 = v46
                            local v418 = v364.ENT_LOOK_AT
                            v364 = v353
                            v418.Send(v418, v364)
                        end
                        v387 = true
                    end
                end
            end
        end
        v351 = v52
        if not v351 then
            v352 = v327
            v354 = 1
            v381 = v354 - v352
            v353 = (v381) * 0.2
            v351 = v352 + v353
            v327 = v351
            v352 = v47
            v351 = v352.SetMidTextInfo
            v352 = v327
            v353 = ""
            v351(v352, v353)
            v52 = nil
        end
        if not v387 then
            v367 = v47.SetEntityHealth
            v367(nil)
        end
        local v371 = v290
        if time() - v371 >= 0.2 then
            if v52 then
                if v289 then
                    v371 = v36
                    v371 = {}
                    v381 = v371[v52[2]].InteractOptions
                    v354 = nil
                    local v373
                    for v376, v374 in v381, v354, v373 do
                        v361 = #v371
                        v363 = v361 + 1
                        v361 = {}
                        v361.desc = v374
                        v361.sub = ""
                        v361.image = v374
                        v371[v363] = v361
                    end
                    v354 = v47
                    v381 = v354.OpenRadialMenu
                    v354 = v371
                    v373 = "Interact Options"
                    v376 = function(p30)
                        v49.Send(v46.ENT_USE, v52[1], p30)
                    end
                    v381(v354, v373, v376)
                    v47.SetMidTextInfo(v327, "")
                    v289 = false
                end
            end
        end
        if v52 then
            v44["Entity.interact"].Visible = true
            return 
        end
        v44["Entity.interact"].Visible = false
    end
    v17:BindToRenderStep(v431, v439, v433)
    v430 = v47
    v44 = v430.GetMobileControls()
end
v2.init = init_1
init_1 = true
return init_1
