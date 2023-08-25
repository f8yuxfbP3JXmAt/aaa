-- script_hash: dfbdde243483c5b3b5a6c03387a54aa884cb7df31b6e46243512913cfd17c68e8fa4c90f80f21f58c26af4903a5d50d0
local v1 = {}
local v3 = _G.modules
local v5 = game:GetService("ReplicatedStorage")
local v8 = game:GetService("RunService")
local v11 = game:GetService("Debris")
local v14 = game.Players.LocalPlayer
local v15 = require(v5.ItemConfigs)
local v18 = require(v5.AttachmentConfigs)
local v22 = require(v5.Maps.MaterialParticles)
local v25 = require(v5.Maps.MaterialHitSounds)
local v27 = require(v5.ItemSkins)
local v28 = v3.Network
local v29 = v28.SendCodes
v28 = v3.Sound
local v30 = v3.Network
local v31 = v3.Camera
local v32 = v3.Character
local v33 = v3.UI
local v34 = v3.Inventory
local v35 = v3.Player
local v36 = v3.Entity
local v37 = v3.Particle
local v38 = v3.FPS
local v39 = workspace
local v40 = v39.Terrain
v39 = CFrame.fromOrientation
local v43 = os.clock()
local v47 = Random.new(v43 + os.time())
local v48 = CFrame.new
v43 = Enum.UserInputType.Touch
local v49 = RaycastParams.new()
local v50 = {}
local v51 = workspace
local v52 = v51.Ignore
v50[1] = v52
v49.FilterDescendantsInstances = v50
v50 = Enum.RaycastFilterType.Exclude
v49.FilterType = v50
v50 = "WeaponRaycast"
v49.CollisionGroup = v50
v50 = false
v52 = false
v51 = false
local v53
local v54
local v55
local v56 = 0
local v57 = 0
local v58 = 0
local v59
local v60
local v61
local v62 = {}
local v63 = 0
local function getAnimation_1(p1)
    local v66 = v5
    local v68, v66, v69 = v66.Animations:GetDescendants()
    for v75, v72 in v68, v66, v69 do
        local v73 = v72:IsA("ModuleScript")
        if v73 then
            v73 = v72.Name
            if v73 == p1 then
                v73 = require
                return v73(v72)
            end
        end
    end
end
local function playIfExists_1(p2)
    if p2 then
        p2:Play()
    end
end
local function applyAttachmentVisuals_1(p3, p4)
    for v99, v87 in p3.attachments, nil, nil do
        local v86 = v18[v87]
        if v86.Model then
            local v88 = v86.Model:Clone()
            v88.Parent = p4
            local v91 = Instance.new("Weld")
            v91.Parent = v88
            v91.Part0 = v88.PrimaryPart
            v91.part1 = p4.Body
            local v94 = p3.id
            v91.C1 = v86.WeaponCFrameOffsets[v94]
            if v86.Occupies == "Sight" then
                v94 = "DefaultSight"
                if p4:FindFirstChild(v94) then
                    (p4:FindFirstChild("DefaultSight")):Destroy()
                end
                v88.Name = "CustomSight"
            end
        end
    end
    return {}
end
v1.onEquip = function(p5, p6, p7)
    v61 = p5
    v57 = os.clock()
    v56 = os.clock()
    v54 = p6
    v55 = p7
    v59 = v18.GetConfigForItem(p7)
    local v113 = v5.HandModels
    local v114 = v59
    local v151 = v114.HandModel
    v53 = v113[v151]:Clone()
    if p7.skin then
        v151 = v27
        v113 = v151.GetInfoFromItemAndName
        v114 = v59
        v151 = v114.HandModel
        v114 = p7.skin
        v113(v151, v114).ApplyToModel(v53)
    end
    v53.Parent = p5
    v53.Name = "HandModel"
    v60 = {}
    local v157 = v59.HandModelAnimations
    local v158
    local v120
    for v119, v124 in v157, v158, v120 do
        v60[v124] = getAnimation_1(v124).GetAnimationPlayer(v53.AnimationController.Animator, p6, v60)
    end
    v157 = p6
    v158 = nil
    v120 = nil
    for v119, v124 in v157, v158, v120 do
        v121 = v62
        v129 = #v62 + 1
        v121[v129] = (v124:GetMarkerReachedSignal("PlaySoundFromConfig")):Connect(function(p8)
            local v135 = v59
            local v136 = v135.Sounds
            local v137 = v136[p8]
            if v137 then
                v136 = v28
                v137 = v136.Play
                v135 = v59.Sounds
                v136 = v135[p8]
                v137(v136)
            end
        end)
    end
    v120 = v59
    v158 = v120.WeldPart
    v157 = p5[v158]
    local v140 = Instance.new("Weld")
    v140.Parent = v157
    v124 = v59
    v140.Part0 = p5[v124.WeldPart]
    v140.part1 = v53.Handle
    v129 = v59
    v121 = v129.VMAnimations
    v124 = v121.Equip
    local v168 = v54[v124]
    v124 = v28
    v129 = v59
    v121 = v129.Sounds
    v124 = v121.Equip
    v124.Play(v124)
    v168:Play()
    v139 = v168.Length
    v129 = v139 - 0.01
    v130 = v59
    v139 = v130.EquipTime
    v121 = (v129) / v139
    v168:AdjustSpeed(v121)
    applyAttachmentVisuals_1(p7, v53)
    if p7.id == "Crossbow" then
        if p7.ammo == 0 then
        end
    end
end
local function onUnequip_1()
    local v173 = v62
    local v174
    local v175
    for v178, v177 in v173, v174, v175 do
        v177:Disconnect()
    end
    v173 = table.clear
    v174 = v62
    v173(v174)
    v33.setAmmoDisplay("")
    v53:Destroy()
    local v182 = v54
    local v183
    v175 = nil
    for v178, v177 in v182, v183, v175 do
        v177:Stop()
    end
    v182 = nil
    v55 = v182
    v50 = false
    v56 = 0
    v57 = 0
    v59 = nil
    v58 = 0
    v52 = false
    v183 = v31
    v183.SetVMAimingOffset(false)
    v32.SetSprintBlocked(false)
    v31.SetZoom(1)
end
v1.onUnequip = onUnequip_1
onUnequip_1 = 0
local function getNextProjId_1()
    local v202 = onUnequip_1
    v202 = v202 + 1
    onUnequip_1 = v202
    return onUnequip_1
end
local function createProjectile_1(p9, p10, p11, p12)
    local v206 = p10.ProjectileSpeed
    local v207 = p10.ProjectileDrop
    local v209 = p10.TracerPart
    local v211 = v5[v209]:Clone()
    v211.whiz:Play()
    v209 = workspace
    local v212 = v209.Ignore
    v211.Parent = v212
    v211.CFrame = p9
    local v412
    v209 = 0
    local v213 = p9.Position
    local v214 = onUnequip_1
    v214 = v214 + 1
    onUnequip_1 = v214
    local v215 = onUnequip_1
    v214 = false
    local v216
    if p11 then
        v216 = v49
        local v217 = p10.Pellets
        if not v217 then
            v217 = v30.Send
            v217(v29.INV_USE_ITEM, "Fire", v215, p9)
            v216 = RaycastParams.new()
            v216.FilterDescendantsInstances = {
                [1] = workspace.Ignore, [2] = v35.GetPlayerModel(p12)
            }
            v216.FilterType = Enum.RaycastFilterType.Exclude
            v216.CollisionGroup = "WeaponRaycast"
        end
        v225 = v8
        v223 = v225.RenderStepped
        v227 = function(p13)
            local v240 = v214
            if v240 then
                v240 = v212
                v240:Disconnect()
                v211:Destroy()
                return 
            end
            local v242 = v209
            v242 = v242 + p13
            v209 = v242
            local v351 = v209 + 0.025
            local v352 = v213
            v213 = (p9) * v48(0, -v207 ^ (v209) * v207 + 1, (-v209) * v206).Position
            local v257 = p9
            local v259 = v207
            local v260 = (v351) * v259
            local v365 = -v351
            local v366 = v206
            local v261 = v48(0, -v207 ^ v260 + 1, (v365) * v366)
            local v263 = v48(v213, (v257) * v261.Position)
            v211.CFrame = v263
            local v266 = workspace:Raycast(v352, v213 - v352, v216)
            if v266 then
                v263 = v209
                local v269 = v213 - v352.Magnitude
                local v372 = v209
                v261 = v269 - v266.Distance
                local v373 = v206
                v257 = (v261) / v373
                v209 = v372 - v257
                if p11 then
                    v372 = v35
                    v372 = v266.Instance
                    local v271, v272 = v372.GetModelFromPart(v372)
                    if v271 then
                        v261 = v37
                        v257 = v261.Play
                        v261 = "Blood"
                        v373 = v266.Position
                        v257(v261, v373, v266.Normal)
                        local v274 = v266.Instance
                        local v276 = v274.Name == "Head"
                        if v276 then
                            v274 = v28
                            v274 = "Dink"
                            v274.Play(v274)
                            v28.Play("PlayerHitHeadshot")
                        else
                            v28.Play("PlayerHit2")
                        end
                        v365 = v209
                        v366 = v272
                        v259 = v266.Instance
                        v260 = v259.Name
                        local v286 = v271.PrimaryPart
                        local v287 = v286.Position
                        v259 = v266.Position - v287
                        v30.Send(v29.INV_USE_ITEM, "Hit", v215, v365, v366, v260, v259, v266.Position)
                        v276 = v36.GetEntityDataFromPart
                        local v289 = v276(v266.Instance)
                        if v289 then
                            local v299 = v289.model
                            v286 = v299.PrimaryPart
                            v287 = v286.Position
                            v30.Send(v29.INV_USE_ITEM, "Hit", v215, v209, v289.id, v266.Instance.Name, v266.Position - v287, v266.Position)
                            local v300 = v289.cfg
                            local v301 = v300.OverrideHitParticle
                            if v301 then
                                v300 = v37
                                v301 = v300.Play
                                v300 = v289.cfg.OverrideHitParticle
                                v301(v300, v266.Position, v266.Normal)
                            else
                                v37.Play(v22[v266.Material], v266.Position, v266.Normal)
                            end
                            local v308 = v289.cfg
                            local v309 = v308.UsePlayerAnatomyForTargeting
                            if v309 then
                                local v310 = v266.Instance
                                v308 = v310.Name
                                if v308 ~= "Head" then
                                    v309 = false
                                end
                                v309 = true
                                if v309 then
                                    v310 = v28
                                    v308 = v310.Play
                                    v310 = "Dink"
                                    v308(v310)
                                    v28.Play("PlayerHitHeadshot")
                                else
                                    v28.Play("PlayerHit2")
                                    v309 = v28.PlayFromPosition
                                    v309(v25[v266.Material], v266.Position, (math.random(-35, 20)) / 350, 0)
                                    v37.Play(v22[v266.Material], v266.Position, v266.Normal)
                                    v28.PlayFromPosition(v25[v266.Material], v266.Position, (math.random(-35, 20)) / 350, 0)
                                end
                                v271 = v211
                                v289 = v48
                                v287 = v207
                                v299 = v207
                                v286 = (v351) * v299
                                v287 = v206
                                v272 = (v289(v266.Position, (p9) * v48(0, -v287 ^ v286 + 1, (-v351) * v287).Position)) * v48(0, 0, (v211.Size.Z) / 2)
                                v271.CFrame = v272
                                v271 = true
                                v214 = v271
                                return 
                                v263 = v209
                                v269 = 3
                                if v263 > v269 then
                                    v263 = v212
                                    v263:Disconnect()
                                    v211:Destroy()
                                end
                                return 
                            end
                        end
                    end
                end
            end
        end
        v412 = v223:Connect(v227)
        return 
    end
end
v1.update = function(p14)
    if 0 > v55.cnd then
        v38.UnEquipItem()
        return 
    end
    if v59.EquipTime >= os.clock() - v56 then
        return 
    end
    local v576 = v59
    local v577 = v576.VMAnimations
    local v626 = v577.Idle
    local v645 = v54[v626]
    local v627 = v645.IsPlaying
    if not v627 then
        v626 = v54
        v576 = v59.VMAnimations
        v577 = v576.Equip
        v627 = v626[v577]
        v627:Stop()
        v645:Play()
    end
    v32.SetSprintBlocked(false)
    local v581 = v52
    if v581 then
        local v582 = v32
        v581 = v582.IsGrounded
        local v583 = v581()
        if v583 then
            v583 = v58
            v582 = os.clock
            if v582() >= v583 then
                v578 = v59
                v576 = v578.VMAnimations
                v577 = v576.Fire
                v583 = v54[v577]
                if v583 then
                    v577 = v54
                    local v585 = v59
                    v578 = v585.VMAnimations
                    v576 = v578.Fire
                    v583 = v577[v576].IsPlaying
                    if not v583 then
                        v583 = v32.SetSprintBlocked
                        v583(true)
                        v576 = "CustomSight"
                        local v587 = v53:FindFirstChild(v576)
                        if not v587 then
                            v587 = v53
                            local v589 = v587:FindFirstChild("DefaultSight")
                            if not v589 then
                                v589 = v53
                            end
                        end
                        v577 = v31
                        v589 = v577.SetVMAimingOffset
                        v585 = v61.PrimaryPart
                        v578 = v585.CFrame
                        v577 = (v589.ADS.CFrame:Inverse()) * v578
                        v578 = v59
                        v585 = v59
                        v578 = v585.UseScopeUI
                        v589(v577, v578.AimSpeed, v578)
                        local v596 = v59
                        v31.SetZoom(v596.ADSZoom)
                        local v597 = v51
                        if not v597 then
                            v597 = v30.Send
                            v596 = v29
                            v596 = "Aim"
                            v597(v596.INV_USE_ITEM, v596, true)
                        end
                        v51 = true
                    else
                        v600 = v31
                        v590 = v600.SetVMAimingOffset
                        v600 = false
                        local v601 = v59
                        v590(v600, v601.AimSpeed)
                        v31.SetZoom(1)
                        local v605 = v51
                        if v605 then
                            v605 = v30.Send
                            v601 = false
                            v605(v29.INV_USE_ITEM, "Aim", v601)
                        end
                        v51 = false
                    end
                    local v611 = v57
                    v608 = os.clock() - v611
                    if v608 <= 0.25 then
                        v608 = v50
                        if v608 then
                            v608 = v32.SetSprintBlocked
                            v608(true)
                        end
                        local v612 = v32
                        local v614 = v612.IsGrounded()
                        if v614 then
                            v612 = os.clock
                            v611 = v57
                            v614 = v612() - v611
                            v611 = v59
                            if v614 > v611.AttackCooldown then
                                v614 = v50
                                if v614 then
                                    v614 = v58
                                    if os.clock() >= v614 then
                                        v614 = os.clock
                                        v57 = v614()
                                        if v59.FireAction == "semi" then
                                            v50 = false
                                        end
                                        (function()
                                            if 0 > v55.ammo then
                                                v28.Play("NoAmmo")
                                                v50 = false
                                                return 
                                            end
                                            v424 = v54[v59.VMAnimations.Reload]
                                            if v424 then
                                                v424:Stop()
                                            end
                                            local v430 = v54[v59.VMAnimations.Fire]
                                            if v430 then
                                                v430:Stop()
                                            end
                                            v57 = os.clock()
                                            local v518 = v55
                                            v518.ammo = v518.ammo - 1
                                            if 0.1 >= os.clock() - v57 - v59.AttackCooldown then
                                                v63 = v63 + 1
                                            else
                                                v63 = 1
                                            end
                                            v28.Play(v59.Sounds.Fire, nil, (math.random(-35, 20)) / 350)
                                            local v440 = v53:FindFirstChild("Muzzle")
                                            if v440 then
                                                v440 = v37.PlayInPart
                                                v440("MuzzleFlash", v53.Muzzle)
                                            end
                                            v442 = v59.HandModelAnimations
                                            local v445 = v442.Fire
                                            local v446 = v60[v445]
                                            if v446 then
                                                v446:Play()
                                            end
                                            local v536 = v59
                                            v442 = v536.VMAnimations
                                            local v537 = v442.Fire
                                            v446 = v54[v537]
                                            if v446 then
                                                v446:Play()
                                            end
                                            v446 = v51
                                            if v446 then
                                                local v448 = v31
                                                v446 = v448.IsZoomFinished
                                                local v449 = v446()
                                                if v449 then
                                                    v448 = v31
                                                    v449 = v448.Recoil
                                                    v537 = v59
                                                    v448 = v537.AimRecoil
                                                    v449(v448)
                                                else
                                                    v537 = v59
                                                    v31.Recoil(v537.HipRecoil)
                                                end
                                                local v452 = v31
                                                local v454 = v452.GetCFrame()
                                                v537 = v59
                                                local v539 = v537.Accuracy
                                                v442 = v59
                                                v537 = v442.EntityCreate
                                                if not v537 then
                                                    v442 = v59
                                                    v537 = v442.Pellets
                                                    if v537 then
                                                        v537 = {}
                                                        local v455 = 1
                                                        local v456 = v59
                                                        v442 = v456.Pellets
                                                        v536 = 1
                                                        for v455 = v455, v442, v536 do
                                                            v456 = (v454) * v39((v47:NextInteger(-100, 100)) / v452, (v47:NextInteger(-100, 100)) / v452, (v47:NextInteger(-100, 100)) / v452)
                                                            v445[#v445 + 1] = {
                                                                [1] = v456, [2] = onUnequip_1 + 1
                                                            }
                                                            createProjectile_1(v456, v59, true)
                                                        end
                                                        v536 = v30
                                                        v442 = v536.Send
                                                        v455 = v29
                                                        v536 = v455.INV_USE_ITEM
                                                        v442(v536, "MultiFire", v537)
                                                    else
                                                        v537 = v51
                                                        if v537 then
                                                            local v475 = v32
                                                            v537 = v475.IsGrounded
                                                            local v476 = v537()
                                                            if v476 then
                                                                v475 = v31
                                                                v476 = v475.IsZoomFinished
                                                                if v476() then
                                                                    v539 = (v539) * 3.5
                                                                end
                                                            end
                                                        end
                                                        v475 = v32
                                                        v477 = v475.IsGrounded
                                                        local v478 = v477()
                                                        if not v478 then
                                                            v539 = (v539) * 0.5
                                                        end
                                                        v475 = v39
                                                        v478 = (v454) * v475((v47:NextInteger(-100, 100)) / v539, (v47:NextInteger(-100, 100)) / v539, (v47:NextInteger(-100, 100)) / v539)
                                                        createProjectile_1(v478, v59, true)
                                                        v30.Send(v29.INV_USE_ITEM, "Fire", 0, (v454) * v39((v47:NextInteger(-100, 100)) / v539, (v47:NextInteger(-100, 100)) / v539, (v47:NextInteger(-100, 100)) / v539))
                                                    end
                                                    v478 = v55.id
                                                    if v478 == "Crossbow" then
                                                    end
                                                    return 
                                                end
                                            end
                                        end)()
                                    end
                                end
                            end
                        end
                        v616 = v33
                        v611 = v55.ammo
                        v585 = " "
                        v593 = v55.loaded
                        v616 = v611 .. "/" .. v59.MaxAmmo .. v585 .. v593
                        v616.setAmmoDisplay(v616)
                        return 
                    end
                end
            end
        end
    end
end
v1.onUse1 = function(p15)
    v50 = p15
end
v1.onUse2 = function(p16, p17)
    if p17 == v43 then
        if p16 then
            v52 = not v52
            return 
            v52 = p16
        end
        return 
    end
end
v1.onUse3 = function(p18)
    local v663 = v59
    if v663.MaxAmmo >= v55.ammo then
        v663 = v56
        v663 = v59
        if os.clock() - v663 >= v663.EquipTime then
            if os.clock() >= v58 then
                v663 = v55
                if 0 > v34.GetTotalOfItem(v663.loaded) then
                    v663 = nil
                    for v668, v671 in v59.AmmoTypes, nil, v663 do
                        local v669 = v55
                        if v671 ~= v669.loaded then
                            v669 = v34
                            v669 = v671
                            if v669.GetTotalOfItem(v669) >= 0 then
                                v1.onUse4(v671)
                                return 
                            end
                        end
                    end
                    return 
                end
                v668 = v59
                v663 = v668.ReloadTime
                v58 = os.clock() + v663
                local v684 = v59
                local v685 = v684.ReloadIsIndividual
                if not v685 then
                    v684 = v54
                    v671 = v59
                    v668 = v671.VMAnimations
                    v663 = v668.Reload
                    v685 = v684[v663]
                    if v685 then
                        v685:Play()
                        v671 = v685.Length - 0.01
                        v668 = (v671) / v59.ReloadTime
                        v685:AdjustSpeed(v668)
                    end
                end
                v663 = v59
                local v678 = v663.Sounds
                v685 = v678.Reload
                if v685 then
                    v678 = v28
                    v685 = v678.Play
                    v663 = v59.Sounds
                    v678 = v663.Reload
                    v685(v678)
                end
                v663 = v29
                v663 = "Reload"
                v30.Send(v663.INV_USE_ITEM, v663)
            end
        end
    end
end
v1.onUse4 = function(p19)
    local v706 = v59
    if v55.ammo < v706.MaxAmmo then
        if v55.loaded ~= p19 then
            v706 = v56
            v706 = v59
            if os.clock() - v706 >= v706.EquipTime then
                if os.clock() >= v58 then
                    if 0 > v34.GetTotalOfItem(p19) then
                        return 
                    end
                    local v712 = v59
                    v706 = v712.ReloadTime
                    v58 = os.clock() + v706
                    local v723 = v59
                    local v724 = v723.ReloadIsIndividual
                    if not v724 then
                        v723 = v54
                        local v713 = v59
                        v712 = v713.VMAnimations
                        v706 = v712.Reload
                        v724 = v723[v706]
                        if v724 then
                            v724:Play()
                            v713 = v724.Length - 0.01
                            v712 = (v713) / v59.ReloadTime
                            v724:AdjustSpeed(v712)
                        end
                    end
                    v706 = v59
                    local v717 = v706.Sounds
                    v724 = v717.Reload
                    if v724 then
                        v717 = v28
                        v724 = v717.Play
                        v706 = v59.Sounds
                        v717 = v706.Reload
                        v724(v717)
                    end
                    v706 = v29
                    v706 = "Reload"
                    v718 = p19
                    v30.Send(v706.INV_USE_ITEM, v706, v718)
                end
            end
        end
        return 
    end
end
v1.getRadialMenu = function()
    local v739 = {}
    local v741 = v59.AmmoTypes
    for v740, v746 in v741, nil, nil do
        local v744 = v55
        if v746 ~= v744.loaded then
            v744 = v34
            v744 = v746
            if v744.GetTotalOfItem(v744) >= 0 then
                v739[#v739 + 1] = v746
            end
        end
    end
    v741 = #v739
    if v741 == 0 then
        return 
    end
    return v739
end
v1.EquipToPlayer = function(p20, p21)
    local v755 = v18.GetConfigForItem(p21)
    local v756 = p20.model
    local v757 = p20.anims
    local v758 = false
    local v760 = v5.HandModels
    local v805 = v755.HandModel
    p20.handModel = v760[v805]:Clone()
    if p21.skin then
        v805 = v27
        v760 = v805.GetInfoFromItemAndName
        v805 = v755.HandModel
        v760(v805, p21.skin).ApplyToModel(p20.handModel)
    end
    applyAttachmentVisuals_1(p21, p20.handModel)
    p20.equippedItemConfig = v755
    p20.handModel.Parent = v756
    p20.handModel.Name = "HandModel"
    p20.HMAnims = {}
    p20.AnimMarkers = {}
    local v811 = v755.HandModelAnimations
    local v812
    local v770
    for v780, v774 in v811, v812, v770 do
        p20.HMAnims[v774] = getAnimation_1(v774).GetAnimationPlayer(p20.handModel.AnimationController.Animator, v757, p20.HMAnims)
    end
    v811 = v757
    v812 = nil
    v770 = nil
    for v780, v774 in v811, v812, v770 do
        v771 = p20.AnimMarkers
        v779 = #p20.AnimMarkers + 1
        v771[v779] = (v774:GetMarkerReachedSignal("PlaySoundFromConfig")):Connect(function(p22)
            local v786 = v755
            local v787 = v786.Sounds
            local v788 = v787[p22]
            if v788 then
                v787 = v28
                v788 = v787.PlayFromEmitter
                v786 = v755.Sounds
                v787 = v786[p22]
                v786 = p20.model.PrimaryPart
                v788(v787, v786)
            end
        end)
    end
    v812 = v755.WeldPart
    v811 = v756[v812]
    v770 = "Weld"
    local v793 = Instance.new(v770)
    v793.Parent = v811
    v780 = v755.WeldPart
    v793.Part0 = v756[v780]
    v780 = p20.handModel
    v793.part1 = v780.Handle
    v774 = v755.VMAnimations
    v780 = v774.Equip
    local v818 = v757[v780]
    v774 = v28
    v780 = v774.PlayFromEmitter
    v771 = v755.Sounds
    v774 = v771.Equip
    v779 = p20.model
    v771 = v779.PrimaryPart
    v780(v774, v771)
    v818:Play()
    v792 = v818.Length
    v779 = v792 - 0.01
    v792 = v755.EquipTime
    v818:AdjustSpeed((v779) / v792)
    local function v798()
        v758 = true
    end
    p20.cancelEquip = v798
    v798 = task.wait
    v798(v755.EquipTime)
    if not v758 then
        v757[v755.VMAnimations.Idle]:Play()
    end
end
v1.UnEquipToPlayer = function(p23)
    p23.handModel:Destroy()
    local v822 = p23.model
    local v824 = p23.handModel
    if v824 then
        v824 = p23.handModel
        v824:Destroy()
    end
    local v825 = p23.handWeld
    if v825 then
        v825 = p23.handWeld
        v825:Destroy()
    end
    local v826 = p23.AnimMarkers
    local v827
    local v828
    for v831, v830 in v826, v827, v828 do
        v830:Disconnect()
    end
    v826 = table.clear
    v827 = p23.AnimMarkers
    v826(v827)
    local v832 = p23.anims
    v828 = nil
    for v831, v830 in v832, nil, v828 do
        v830:Stop()
    end
    v832 = false
    p23.isAiming = v832
end
v1.PlayerAim = function(p24, p25)
    p24.isAiming = p25
end
v1.SelfReload = function(p26)
    local v837 = v59
    local v838 = v837.Sounds
    local v839 = v838.Reload
    if v839 then
        v838 = v28
        v839 = v838.Play
        v837 = v59.Sounds
        v838 = v837.Reload
        v839(v838)
    end
    local v841 = v54
    local v842 = v59
    v840 = v842.VMAnimations
    local v847 = v840.Reload
    local v843 = v841[v847]
    if p26 then
        v841 = v54
        v842 = v59
        v840 = v842.VMAnimations
        v847 = v840.ReloadFinish
        v843 = v841[v847]
    end
    if v843 then
        v843:Play()
        v842 = v843.Length - 0.01
        v840 = (v842) / v59.ReloadTime
        v843:AdjustSpeed(v840)
    end
end
v1.PlayerReload = function(p27, p28)
    local v850 = p27.equippedItemConfig
    local v851 = p27.anims
    local v852 = v850.Sounds
    local v853 = v852.Reload
    if v853 then
        v852 = v28
        v853 = v852.PlayFromEmitter
        v852 = v850.Sounds.Reload
        v853(v852, p27.model.PrimaryPart, (math.random(-35, 20)) / 350)
    end
    local v860 = v850.VMAnimations
    local v861 = v860.Reload
    local v862 = v851[v861]
    if p28 then
        v860 = v850.VMAnimations
        v861 = v860.ReloadFinish
        v862 = v851[v861]
    end
    if v862 then
        v862:Play()
        v859 = v862.Length - 0.01
        v862:AdjustSpeed((v859) / v850.ReloadTime)
    end
end
v1.PlayerFire = function(p29, p30, p31)
    local v870 = p29.equippedItemConfig
    local v871 = p29.model
    local v872 = p29.anims
    local v873 = v870.entityCreate
    if not v873 then
        v873 = createProjectile_1
        v873(p30, v870, false, p29.id)
    end
    if p31 then
        return 
    end
    local v880 = v872[v870.VMAnimations.Fire]
    if v880 then
        v880:Play()
    end
    local v882 = v872[v870.VMAnimations.Fire]
    if v882 then
        v882:Play()
    end
    v882 = p29.HMAnims[v870.HandModelAnimations.Fire]
    if v882 then
        v882:Play()
    end
    v882 = v28.PlayFromEmitter
    v882(v870.Sounds.Fire, p29.model.PrimaryPart, (math.random(-35, 20)) / 350)
    local v892 = p29.handModel:FindFirstChild("Muzzle")
    if v892 then
        v892 = v37.PlayInPart
        v892("MuzzleFlash", p29.handModel.Muzzle)
    end
    local v896 = p29.isAiming
    if v896 then
        v896 = v35.Recoil
        v896(p29.id, v870.AimRecoil)
        return 
    end
    v35.Recoil(p29.id, v870.HipRecoil)
end
return v1
