-- script_hash: a0d1f321419725463d22ee17fff8efa4aefbfc5b7052fae33d15b82ec9130be51d63c67fc71d78e4efdf387923983e5c
local v1 = {}
local v3 = _G.modules
local v5 = game:GetService("ReplicatedStorage")
local v8 = require(v5.ItemConfigs)
local v12 = require(v5.Maps.MaterialParticles)
local v15 = require(v5.Maps.MaterialHitSounds)
local v17 = require(v5.ItemSkins)
local v19 = RaycastParams.new()
local v20 = {}
local v21 = workspace
local v22 = v21.Ignore
v20[1] = v22
v19.FilterDescendantsInstances = v20
v20 = Enum.RaycastFilterType.Exclude
v19.FilterType = v20
v22 = v3.Network
v20 = v22.SendCodes
v22 = v3.Sound
v21 = v3.Network
local v23 = v3.Player
local v24 = v3.Entity
local v25 = v3.Particle
local v26 = v3.Camera
local v27 = v3.FPS
local v28
local v29
local v30
local v31 = false
local v32 = 0
local v33 = 0
local v34
local function playIfExists_1(p1)
    if p1 then
        p1:Play()
    end
end
local function stopIfExists_1(p2)
    if p2 then
        p2:Stop()
    end
end
v1.onEquip = function(p3, p4, p5)
    v33 = 0
    v32 = os.clock()
    v29 = p4
    v30 = p5
    local v46 = p5.id
    v34 = v8[v46]
    v28 = nil
    local v64 = v34
    if v64.HandModel then
        v46 = v5
        v64 = v46.HandModels
        local v47 = v34
        v46 = v47.HandModel
        v28 = v64[v46]:Clone()
        if p5.skin then
            v46 = v17
            v64 = v46.GetInfoFromItemAndName
            v47 = v34
            v46 = v47.HandModel
            v47 = p5.skin
            v64(v46, v47).ApplyToModel(v28)
        end
        v28.Parent = workspace.Ignore
        local v53 = Instance.new("Weld")
        v53.Parent = p3[v34.WeldPart]
        v53.Part0 = p3[v34.WeldPart]
        v53.part1 = v28.Handle
    end
    v53 = v29
    v54 = v34
    v55 = v54.VMAnimations
    v56 = v55.Equip
    v50 = v53[v56]
    v56 = v34
    v53 = v56.EquipSound
    if v53 then
        v56 = v22
        v53 = v56.Play
        v55 = v34
        v56 = v55.EquipSound
        v53(v56)
    end
    if v50 then
        v50:Play()
        v54 = v50.Length - 0.01
        v55 = (v54) / v34.EquipTime
        v50:AdjustSpeed(v55)
    end
end
v1.onUnequip = function()
    local v79 = v28
    if v79 then
        v79 = v28
        v79:Destroy()
    end
    local v80 = v29
    for v85, v84 in v80, nil, nil do
        v84:Stop()
    end
    v80 = nil
    v30 = v80
    v31 = false
    v32 = 0
    v33 = 0
    v34 = nil
end
v1.update = function(p6)
    if v34.EquipTime >= os.clock() - v32 then
        return 
    end
    local v95 = v34
    local v96 = v95.VMAnimations
    local v114 = v96.Idle
    local v126 = v29[v114]
    if v126 then
        if not v126.IsPlaying then
            v114 = v29
            v95 = v34.VMAnimations
            v96 = v95.Equip
            v114[v96]:Stop()
            v126:Play()
        end
    end
    local v117 = v34
    if os.clock() - v33 > v117.UseCooldown then
        if v31 then
            v33 = os.clock()
            v97 = v34
            v95 = v97.VMAnimations
            v117 = v95.Use
            local v119 = v29[v117]
            if v119 then
                v119:Play()
                v97 = v119.Length - 0.01
                v95 = (v97) / v34.UseTime
                v119:AdjustSpeed(v95)
            end
            v117 = v22
            v97 = v34
            v117 = v97.Sounds.Use
            v102 = math.random
            v103 = -35
            v97 = (v102(v103, 20)) / 350
            v117.Play(v117, nil, v97, 0)
            v21.Send(v20.INV_USE_ITEM, "Use")
        end
    end
end
v1.onUse1 = function(p7)
    v31 = p7
end
v1.onUse2 = function(p8)
    return nil
end
v1.onUse3 = function(p9)
    return nil
end
v1.onUse4 = function(p10)
    return nil
end
v1.getRadialMenu = function()
    return nil
end
v1.EquipToPlayer = function(p11, p12)
    local v144 = v8[p12.id]
    local v169 = p11.model
    local v170 = p11.anims
    local v145 = false
    local v146 = v144.EquipSound
    if v146 then
        v146 = v22.PlayFromEmitter
        v146(v144.EquipSound, v169.PrimaryPart)
    end
    local v149 = v144.HandModel
    if v149 then
        break
    end
    local v172 = v144.HandModel
    v149 = v5.HandModels[v172]
    local v152 = v149:Clone()
    if p12.skin then
        v172 = v17.GetInfoFromItemAndName
        v172(v144.HandModel, p12.skin).ApplyToModel(v152)
    end
    v152.Parent = workspace.Ignore
    p11.handModel = v152
    local v159 = Instance.new("Weld")
    v159.Parent = v169[v144.WeldPart]
    local v160 = v144.WeldPart
    v159.Part0 = v169[v160]
    local v179 = v152.Handle
    v159.part1 = v179
    p11.cancelEquip = function()
        v145 = true
    end
    local v183 = v170[v144.VMAnimations.Equip]
    if v183 then
        v183:Play()
        v160 = v183.Length - 0.01
        v179 = (v160) / v144.EquipTime
        v183:AdjustSpeed(v179)
    end
    task.wait(v144.EquipTime)
    if not v145 then
        local v168 = v170[v144.VMAnimations.Idle]
        if v168 then
            v168:Play()
        end
    end
end
v1.UnEquipToPlayer = function(p13)
    local v188 = p13.model
    local v190 = p13.handModel
    if v190 then
        v190 = p13.handModel
        v190:Destroy()
    end
    local v191 = p13.handWeld
    if v191 then
        v191 = p13.handWeld
        v191:Destroy()
    end
    for v197, v196 in p13.anims, nil, nil do
        v196:Stop()
    end
end
v1.PlayerUse = function(p14)
    local v202 = v8[p14.equippedItem.id]
    v22.PlayFromEmitter(v202.Sounds.Use, p14.model.PrimaryPart)
    local v215 = v202.VMAnimations
    local v206 = p14.anims[v215.Use]
    if v206 then
        v206:Play()
        v215 = (v206.Length - 0.01) / v202.UseTime
        v206:AdjustSpeed(v215)
    end
end
return v1
