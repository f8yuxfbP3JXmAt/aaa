-- script_hash: bc3b775d195371f82ff8efd8caed7e75d74bbbb34bec4e90d762fe9fcd7ac5756cb29f686d86474f19d9172a1c793115
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
v20 = "WeaponRaycast"
v19.CollisionGroup = v20
v22 = v3.Network
v20 = v22.SendCodes
v22 = v3.Sound
v21 = v3.Network
local v23 = v3.Player
local v24 = v3.Entity
local v25 = v3.Particle
local v26 = v3.Camera
local v27 = v3.FPS
local v28 = v3.Character
local v29
local v30
local v31
local v32 = false
local v33 = false
local v34 = 0
local v35 = 0
local v36 = 0
local v37
v1.onEquip = function(p1, p2, p3)
    v35 = os.clock()
    v34 = os.clock()
    v30 = p2
    v31 = p3
    v37 = v8[p3.id]
    local v64 = v5.HandModels
    local v45 = v37
    local v65 = v45.HandModel
    v29 = v64[v65]:Clone()
    if p3.skin then
        v65 = v17
        v64 = v65.GetInfoFromItemAndName
        v45 = v37
        v65 = v45.HandModel
        v45 = p3.skin
        v64(v65, v45).ApplyToModel(v29)
    end
    v29.Parent = workspace.Ignore
    local v51 = Instance.new("Weld")
    v51.Parent = p1[v37.WeldPart]
    v51.Part0 = p1[v37.WeldPart]
    v51.part1 = v29.Handle
    local v78 = v30[v37.VMAnimations.Equip]
    v22.Play(v37.EquipSound)
    v78:Play()
    v78:AdjustSpeed((v78.Length - 0.01) / v37.EquipTime)
end
v1.onUnequip = function()
    v29:Destroy()
    local v89 = v30
    local v90
    for v94, v93 in v89, v90, nil do
        v93:Stop()
    end
    v89 = nil
    v31 = v89
    v32 = false
    v33 = false
    v34 = 0
    v35 = 0
    v36 = 0
    v37 = nil
    v90 = v28
    v90.SetSprintBlocked(false)
end
v1.update = function(p4)
    local v216 = (p4) * 60
    if 0 > v31.cnd then
        v27.UnEquipItem()
        return 
    end
    if v37.EquipTime >= os.clock() - v34 then
        return 
    end
    local v222 = v37
    local v223 = v222.VMAnimations
    local v250 = v223.Idle
    local v267 = v30[v250]
    local v251 = v267.IsPlaying
    if not v251 then
        v250 = v30
        v222 = v37.VMAnimations
        v223 = v222.Equip
        v251 = v250[v223]
        v251:Stop()
        v267:Play()
    end
    local v252 = v28
    local v227 = v252.IsGrounded()
    if v227 then
        v252 = os.clock
        v223 = v35
        v227 = v252() - v223
        v223 = v37
        if v227 > v223.AttackCooldown then
            v227 = v32
            if v227 then
                v227 = os.clock
                v35 = v227()
                v33 = true
                v36 = os.clock()
                v224 = v37
                v222 = v224.VMAnimations
                v223 = v222.Swing
                local v256 = v30[v223]
                if v256 then
                    v256:Play()
                end
                v223 = v22
                v224 = v37
                v222 = v224.SwingSound
                v223 = v222 or "MeleeSwing"
                v222 = nil
                v224 = (math.random(-35, 20)) / 350
                v223.Play(v223, v222, v224, 0)
                v21.Send(v20.INV_USE_ITEM, "Swing")
            end
        end
    end
    v230 = v33
    if v230 then
        v230 = v28.SetSprintBlocked
        v230(true)
    else
        v28.SetSprintBlocked(false)
    end
    local v242 = v33
    if v242 then
        v242 = os.clock() - v36
        if v242 > v37.AttackDelay then
            v242 = false
            v33 = v242
            v242 = function()
                local v106 = v26.GetCFrame()
                local v109 = v37
                local v110 = v109.Range
                local v112 = workspace:Raycast(v106.Position, (v106.LookVector) * v110, v19)
                if not v112 then
                    return 
                end
                local v113 = v37
                local v114 = v113.NoSwingInterrupt
                if not v114 then
                    v113 = v30
                    v110 = v37
                    v114 = v113[v110.VMAnimations.Swing]
                    v114:Stop()
                end
                local v117 = v112.Instance
                local v185 = v112.Position
                v115 = v117.Name
                if v115 ~= "Head" then
                    v116 = false
                end
                v116 = true
                v115 = v23.GetModelFromPart
                local v118, v119 = v115(v117)
                if v118 then
                    v109 = v25.Play
                    v109("Blood", v185, v112.Normal)
                    if v116 then
                        v22.Play("Dink")
                        v22.Play("PlayerHitHeadshot")
                    else
                        v22.Play("PlayerHit2")
                    end
                    v21.Send(v20.INV_USE_ITEM, "Hit", v119, v185, v117.Name, v185 - v118.PrimaryPart.Position)
                    return 
                end
                local v140 = v24.GetEntityDataFromPart(v112.Instance)
                if v140 then
                    v135 = v140.model.PrimaryPart.Position
                    v136 = v185 - v135
                    v21.Send(v20.INV_USE_ITEM, "Hit", v140.id, v185, v117.Name, v136)
                    local v149 = v140.cfg
                    local v150 = v149.OverrideHitParticle
                    if v150 then
                        v149 = v25
                        v150 = v149.Play
                        v149 = v140.cfg.OverrideHitParticle
                        v150(v149, v112.Position, v112.Normal)
                    else
                        v25.Play(v12[v112.Material], v112.Position, v112.Normal)
                    end
                    local v157 = v140.cfg
                    local v158 = v157.UsePlayerAnatomyForTargeting
                    if v158 then
                        local v159 = v112.Instance
                        v157 = v159.Name
                        if v157 ~= "Head" then
                            v158 = false
                        end
                        v158 = true
                        if v158 then
                            v159 = v22
                            v157 = v159.Play
                            v159 = "Dink"
                            v157(v159)
                            v22.Play("PlayerHitHeadshot")
                            return 
                        end
                        v22.Play("PlayerHit2")
                        return 
                    end
                    v158 = v22.PlayFromPosition
                    v158(v15[v112.Material], v112.Position, (math.random(-35, 20)) / 350, 0)
                    return 
                end
                v25.Play(v12[v112.Material], v112.Position, v112.Normal)
                v22.PlayFromPosition(v15[v112.Material], v112.Position, (math.random(-35, 20)) / 350, 0)
            end
            v242()
        end
    end
end
v1.onUse1 = function(p5)
    v32 = p5
end
v1.onUse2 = function(p6)
    return nil
end
v1.onUse3 = function(p7)
    return nil
end
v1.onUse4 = function(p8)
    return nil
end
v1.getRadialMenu = function()
    return nil
end
v1.EquipToPlayer = function(p9, p10)
    local v281 = v8[p10.id]
    local v309 = p9.model
    local v310 = p9.anims
    local v282 = false
    v22.PlayFromEmitter(v281.EquipSound, v309.PrimaryPart)
    local v312 = v281.HandModel
    local v289 = v5.HandModels[v312]:Clone()
    if p10.skin then
        v312 = v17.GetInfoFromItemAndName
        v312(v281.HandModel, p10.skin).ApplyToModel(v289)
    end
    v289.Parent = workspace.Ignore
    p9.handModel = v289
    local v296 = Instance.new("Weld")
    v296.Parent = v309[v281.WeldPart]
    v296.Part0 = v309[v281.WeldPart]
    v296.part1 = v289.Handle
    p9.cancelEquip = function()
        v282 = true
    end
    local v322 = v310[v281.VMAnimations.Equip]
    v322:Play()
    v322:AdjustSpeed((v322.Length - 0.01) / v281.EquipTime)
    task.wait(v281.EquipTime)
    if not v282 then
        v310[v281.VMAnimations.Idle]:Play()
    end
end
v1.UnEquipToPlayer = function(p11)
    p11.handModel:Destroy()
    local v328 = p11.model
    local v330 = p11.handModel
    if v330 then
        v330 = p11.handModel
        v330:Destroy()
    end
    local v331 = p11.handWeld
    if v331 then
        v331 = p11.handWeld
        v331:Destroy()
    end
    for v337, v336 in p11.anims, nil, nil do
        v336:Stop()
    end
end
v1.PlayerSwing = function(p12)
    local v342 = v8[p12.equippedItem.id]
    v22.PlayFromEmitter(v342.SwingSound or "MeleeSwing", p12.model.PrimaryPart)
    p12.anims[v342.VMAnimations.Swing]:Play()
end
v1.PlayerHit = function(p13, p14)
    local v355 = RaycastParams.new()
    local v356 = {}
    local v358 = workspace.Ignore
    v356[1] = v358
    v356[2] = p13.model
    v355.FilterDescendantsInstances = v356
    v355.FilterType = Enum.RaycastFilterType.Exclude
    local v361 = p13.model
    local v362 = v361.Head
    local v363 = v362.Position
    local v364 = workspace:Raycast(p13.model.Head.Position, (p14 - v363) * 1.05, v355)
    if v364 then
        v358 = v23.GetModelFromPart
        local v366 = v358(v364.Instance)
        if not v366 then
            v366 = v25.Play
            v366(v12[v364.Material], v364.Position, v364.Normal)
            v363 = math.random
            v362 = -35
            v361 = 20
            v22.PlayFromPosition(v15[v364.Material], v364.Position, (v363(v362, v361)) / 350, 0)
        end
    end
end
return v1
