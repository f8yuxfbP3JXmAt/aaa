-- script hash: 67767e9ce8469fd6130dc55658ec570e963045d2f58464b7c8ec3bc042b2b5e3e4721ed22dbbfa95803d9b21f0c2b5ac
local v1 = {}
local v3 = _G.modules
local v5 = game:GetService("ReplicatedStorage")
local v8 = game:GetService("RunService")
local v11 = require(v5.ItemConfigs)
local v15 = require(v5.Maps.MaterialParticles)
local v18 = require(v5.Maps.MaterialHitSounds)
local v20 = require(v5.ItemSkins)
local v21 = v3.Network
local v22 = v21.SendCodes
v21 = v3.Sound
local v23 = v3.Network
local v24 = v3.Camera
local v25 = v3.Character
local v26 = v3.UI
local v27 = v3.Inventory
local v28 = v3.Player
local v29 = v3.Entity
local v30 = v3.Particle
local v31 = v3.FPS
local v32 = workspace
local v33 = v32.Terrain
v32 = Enum.UserInputType.Touch
local v34 = CFrame.new
local v36 = RaycastParams.new()
local v37 = {}
local v38 = workspace
local v39 = v38.Ignore
v37[1] = v39
v36.FilterDescendantsInstances = v37
v37 = Enum.RaycastFilterType.Exclude
v36.FilterType = v37
v37 = "WeaponRaycast"
v36.CollisionGroup = v37
v37 = false
v39 = false
v38 = false
local v40
local v41
local v42
local v43 = 0
local v44 = 0
local v45 = 0
local v46
local v47
local v48
local v49 = {}
local v50 = 0
local function getAnimation_1(p1)
    local v53 = v5
    local v55, v53, v56 = v53.Animations:GetDescendants()
    for v62, v59 in v55, v53, v56 do
        local v60 = v59:IsA("ModuleScript")
        if v60 then
            v60 = v59.Name
            if v60 == p1 then
                v60 = require
                return v60(v59)
            end
        end
    end
end
local function playIfExists_1(p2)
    if p2 then
        p2:Play()
    end
end
v1.onEquip = function(p3, p4, p5)
    v48 = p3
    v45 = os.clock()
    v43 = os.clock()
    v41 = p4
    v42 = p5
    v46 = v11[p5.id]
    local v111 = v5.HandModels
    local v73 = v46
    local v112 = v73.HandModel
    v40 = v111[v112]:Clone()
    if p5.skin then
        v112 = v20
        v111 = v112.GetInfoFromItemAndName
        v73 = v46
        v112 = v73.HandModel
        v73 = p5.skin
        v111(v112, v73).ApplyToModel(v40)
    end
    v40.Parent = p3
    v40.Name = "HandModel"
    v47 = {}
    local v118 = v46.HandModelAnimations
    local v119
    local v79
    for v78, v83 in v118, v119, v79 do
        v47[v83] = getAnimation_1(v83).GetAnimationPlayer(v40.AnimationController.Animator, p4, v47)
    end
    v118 = p4
    v119 = nil
    v79 = nil
    for v78, v83 in v118, v119, v79 do
        v80 = v49
        v88 = #v49 + 1
        v80[v88] = (v83:GetMarkerReachedSignal("PlaySoundFromConfig")):Connect(function(p6)
            local v94 = v46
            local v95 = v94.Sounds
            local v96 = v95[p6]
            if v96 then
                v95 = v21
                v96 = v95.Play
                v94 = v46.Sounds
                v95 = v94[p6]
                v96(v95)
            end
        end)
    end
    v79 = v46
    v119 = v79.WeldPart
    v118 = p3[v119]
    local v99 = Instance.new("Weld")
    v99.Parent = v118
    v83 = v46
    v99.Part0 = p3[v83.WeldPart]
    v99.part1 = v40.Handle
    v88 = v46
    v80 = v88.VMAnimations
    v83 = v80.Equip
    local v129 = v41[v83]
    v83 = v21
    v88 = v46
    v80 = v88.Sounds
    v83 = v80.Equip
    v83.Play(v83)
    v129:Play()
    v98 = v129.Length
    v88 = v98 - 0.01
    v89 = v46
    v98 = v89.EquipTime
    v80 = (v88) / v98
    v129:AdjustSpeed(v80)
    if 0 > v27.GetTotalOfItem(v42.loaded) then
        v40.Arrow.Transparency = 1
    end
end
local function onUnequip_1()
    local v137 = v49
    local v138
    local v139
    for v142, v141 in v137, v138, v139 do
        v141:Disconnect()
    end
    v137 = table.clear
    v138 = v49
    v137(v138)
    v26.setAmmoDisplay("")
    v40:Destroy()
    local v146 = v41
    local v147
    v139 = nil
    for v142, v141 in v146, v147, v139 do
        v141:Stop()
    end
    v146 = nil
    v42 = v146
    v37 = false
    v43 = 0
    v45 = 0
    v46 = nil
    v147 = v24
    v147.SetVMAimingOffset(false)
    v24.SetZoom(1)
end
v1.onUnequip = onUnequip_1
onUnequip_1 = 0
local function getNextProjId_1()
    local v161 = onUnequip_1
    v161 = v161 + 1
    onUnequip_1 = v161
    return onUnequip_1
end
local function createProjectile_1(p7, p8, p9, p10)
    local v165 = p8.ProjectileSpeed
    local v166 = p8.ProjectileDrop
    local v168 = p8.TracerPart
    local v170 = v5[v168]:Clone()
    v170.whiz:Play()
    v168 = workspace
    local v171 = v168.Ignore
    v170.Parent = v171
    v170.CFrame = p7
    local v371
    v168 = 0
    local v172 = p7.Position
    local v173 = onUnequip_1
    v173 = v173 + 1
    onUnequip_1 = v173
    local v174 = onUnequip_1
    v173 = false
    local v175
    if p9 then
        v175 = v36
        local v176 = p8.Pellets
        if not v176 then
            v176 = v23.Send
            v176(v22.INV_USE_ITEM, "Fire", v174, p7)
            v175 = RaycastParams.new()
            v175.FilterDescendantsInstances = {
                [1] = workspace.Ignore, [2] = v28.GetPlayerModel(p10)
            }
            v175.FilterType = Enum.RaycastFilterType.Exclude
            v175.CollisionGroup = "WeaponRaycast"
        end
        v184 = v8
        v182 = v184.RenderStepped
        v186 = function(p11)
            local v199 = v173
            if v199 then
                v199 = v171
                v199:Disconnect()
                v170:Destroy()
                return 
            end
            local v201 = v168
            v201 = v201 + p11
            v168 = v201
            local v310 = v168 + 0.025
            local v311 = v172
            v172 = (p7) * v34(0, -v166 ^ (v168) * v166 + 1, (-v168) * v165).Position
            local v216 = p7
            local v218 = v166
            local v219 = (v310) * v218
            local v324 = -v310
            local v325 = v165
            local v220 = v34(0, -v166 ^ v219 + 1, (v324) * v325)
            local v222 = v34(v172, (v216) * v220.Position)
            v170.CFrame = v222
            local v225 = workspace:Raycast(v311, v172 - v311, v175)
            if v225 then
                v222 = v168
                local v228 = v172 - v311.Magnitude
                local v331 = v168
                v220 = v228 - v225.Distance
                local v332 = v165
                v216 = (v220) / v332
                v168 = v331 - v216
                if p9 then
                    v331 = v28
                    v331 = v225.Instance
                    local v230, v231 = v331.GetModelFromPart(v331)
                    if v230 then
                        v220 = v30
                        v216 = v220.Play
                        v220 = "Blood"
                        v332 = v225.Position
                        v216(v220, v332, v225.Normal)
                        local v233 = v225.Instance
                        local v235 = v233.Name == "Head"
                        if v235 then
                            v233 = v21
                            v233 = "Dink"
                            v233.Play(v233)
                            v21.Play("PlayerHitHeadshot")
                        else
                            v21.Play("PlayerHit2")
                        end
                        v324 = v168
                        v325 = v231
                        v218 = v225.Instance
                        v219 = v218.Name
                        local v245 = v230.PrimaryPart
                        local v246 = v245.Position
                        v218 = v225.Position - v246
                        v23.Send(v22.INV_USE_ITEM, "Hit", v174, v324, v325, v219, v218, v225.Position)
                        v235 = v29.GetEntityDataFromPart
                        local v248 = v235(v225.Instance)
                        if v248 then
                            local v258 = v248.model
                            v245 = v258.PrimaryPart
                            v246 = v245.Position
                            v23.Send(v22.INV_USE_ITEM, "Hit", v174, v168, v248.id, v225.Instance.Name, v225.Position - v246, v225.Position)
                            local v259 = v248.cfg
                            local v260 = v259.OverrideHitParticle
                            if v260 then
                                v259 = v30
                                v260 = v259.Play
                                v259 = v248.cfg.OverrideHitParticle
                                v260(v259, v225.Position, v225.Normal)
                            else
                                v30.Play(v15[v225.Material], v225.Position, v225.Normal)
                            end
                            local v267 = v248.cfg
                            local v268 = v267.UsePlayerAnatomyForTargeting
                            if v268 then
                                local v269 = v225.Instance
                                v267 = v269.Name
                                if v267 ~= "Head" then
                                    v268 = false
                                end
                                v268 = true
                                if v268 then
                                    v269 = v21
                                    v267 = v269.Play
                                    v269 = "Dink"
                                    v267(v269)
                                    v21.Play("PlayerHitHeadshot")
                                else
                                    v21.Play("PlayerHit2")
                                    v268 = v21.PlayFromPosition
                                    v268(v18[v225.Material], v225.Position, (math.random(-35, 20)) / 350, 0)
                                    v30.Play(v15[v225.Material], v225.Position, v225.Normal)
                                    v21.PlayFromPosition(v18[v225.Material], v225.Position, (math.random(-35, 20)) / 350, 0)
                                end
                                v230 = v170
                                v248 = v34
                                v246 = v166
                                v258 = v166
                                v245 = (v310) * v258
                                v246 = v165
                                v231 = (v248(v225.Position, (p7) * v34(0, -v246 ^ v245 + 1, (-v310) * v246).Position)) * v34(0, 0, (v170.Size.Z) / 2)
                                v230.CFrame = v231
                                v230 = true
                                v173 = v230
                                return 
                                v222 = v168
                                v228 = 3
                                if v222 > v228 then
                                    v222 = v171
                                    v222:Disconnect()
                                    v170:Destroy()
                                end
                                return 
                            end
                        end
                    end
                end
            end
        end
        v371 = v182:Connect(v186)
        return 
    end
end
v1.update = function(p12)
    if 0 > v42.cnd then
        v31.UnEquipItem()
        return 
    end
    local v528 = v46
    if os.clock() - v43 < v528.EquipTime then
        if 0 >= os.clock() then
            return 
        end
        local v467 = v46
        local v468 = v467.VMAnimations
        v528 = v468.Idle
        local v569 = v41[v528]
        local v530 = v569.IsPlaying
        if not v530 then
            v528 = v41
            v467 = v46.VMAnimations
            v468 = v467.Equip
            v530 = v528[v468]
            v530:Stop()
            v569:Play()
        end
        local v471 = v38
        if v471 then
            v528 = os.clock
            v468 = v45
            v471 = v528() - v468
            v468 = v46
            if v471 > v468.AttackCooldown then
                v471 = v37
                if v471 then
                    v468 = v44
                    v471 = os.clock() - v468
                    v468 = v46
                    if v471 >= v468.PullTime then
                        v471 = os.clock
                        v45 = v471()
                        if v46.FireAction == "semi" then
                            v37 = false
                        end
                        v39 = false
                        (function()
                            if 0 > v27.GetTotalOfItem(v42.loaded) then
                                return 
                            end
                            v45 = os.clock()
                            if 0.1 >= os.clock() - v45 - v46.AttackCooldown then
                                v50 = v50 + 1
                            else
                                v50 = 1
                            end
                            v21.Play(v46.Sounds.Fire, nil, (math.random(-35, 20)) / 350)
                            local v396 = v47[v46.HandModelAnimations.Fire]
                            if v396 then
                                v396:Play()
                            end
                            local v438 = v46.VMAnimations
                            local v439 = v438.Fire
                            v396 = v41[v439]
                            if v396 then
                                v396:Play()
                            end
                            v396 = v38
                            if v396 then
                                v396 = v24.Recoil
                                v439 = v46
                                v396(v439.AimRecoil)
                            else
                                v439 = v46
                                v24.Recoil(v439.HipRecoil)
                            end
                            local v443 = v46.Accuracy
                            if v38 then
                                v438 = v25
                                if v438.IsGrounded() then
                                    v443 = (v443) * 3.5
                                end
                            end
                            v404 = v25.IsGrounded
                            local v405 = v404()
                            if not v405 then
                                v443 = (v443) * 0.5
                            end
                            v405 = (v24.GetCFrame()) * CFrame.fromOrientation((math.random(-100, 100)) / v443, (math.random(-100, 100)) / v443, (math.random(-100, 100)) / v443)
                            createProjectile_1(v405, v46, true)
                            v40.Arrow.Transparency = 1
                        end)()
                    end
                end
            end
        end
        local v475 = false
        v473 = v27.GetTotalOfItem
        local v537 = v42
        if 0 > v473(v537.loaded) then
            v475 = true
        end
        if not v475 then
            if not v39 then
                if v37 then
                    local v478 = v25.IsGrounded()
                    if v478 then
                        v478 = v25.SetSprintBlocked
                        v478(true)
                        v40.Arrow.Transparency = 0
                        v469 = "CustomSight"
                        local v481 = v40:FindFirstChild(v469)
                        if not v481 then
                            v481 = v40
                            local v483 = v481:FindFirstChild("DefaultSight")
                            if not v483 then
                                v483 = v40
                            end
                        end
                        v537 = v24
                        v483 = v537.SetVMAimingOffset
                        local v486 = v48
                        local v487 = v486.PrimaryPart
                        v537 = (v483.ADS.CFrame:Inverse()) * v487.CFrame
                        local v542 = v46
                        v483(v537, v542.AimSpeed)
                        local v491 = v46
                        v24.SetZoom(v491.ADSZoom)
                        local v492 = v38
                        if not v492 then
                            v492 = os.clock
                            v44 = v492()
                            v487 = v46
                            v542 = v487.VMAnimations
                            v491 = v542.Pull
                            v491 = v47
                            v486 = v46
                            v487 = v486.HandModelAnimations
                            v542 = v487.Pull
                            local v546 = v491[v542]
                            v542 = v21
                            v491 = v542.Play
                            v486 = v46
                            v487 = v486.Sounds
                            v542 = v487.Pull
                            v491(v542)
                            v486 = v46
                            v487 = v486.PullTime
                            v486 = 1
                            v41[v491]:Play(v487, v486, (v546.Length - 0.01) / v46.PullTime)
                            v546:Play(v46.PullTime, 1, (v546.Length - 0.01) / v46.PullTime)
                            v23.Send(v22.INV_USE_ITEM, "Pull", true)
                        end
                        v493 = true
                        v38 = v493
                    else
                        v493 = v41
                        v494 = v46.VMAnimations.Pull
                        v480 = v493[v494]
                        v494 = v47
                        local v510 = v46
                        local v555 = v510.HandModelAnimations
                        v493 = v494[v555.Pull]
                        v480:Stop()
                        v493:Stop()
                        v25.SetSprintBlocked(false)
                        v24.SetVMAimingOffset(false)
                        v24.SetZoom(1)
                        local v517 = v38
                        if v517 then
                            v517 = v23.Send
                            v555 = v22
                            v555 = "Pull"
                            v510 = false
                            v517(v555.INV_USE_ITEM, v555, v510)
                        end
                        v38 = false
                    end
                    v493 = v26
                    v480 = v493.setAmmoDisplay
                    v519 = v27.GetTotalOfItem(v42.loaded)
                    v493 = v519 .. " " .. v42.loaded
                    v480(v493)
                    return 
                end
            end
        end
    end
end
v1.onUse1 = function(p13, p14)
    v37 = p13
end
v1.onUse2 = function(p15, p16)
    if p16 == v32 then
        if p15 then
            v39 = not v39
            v39 = p15
        end
        if p15 then
            v582 = v27
            local v583 = v42
            v582 = v583.loaded
            if 0 > v582.GetTotalOfItem(v582) then
                v583 = nil
                for v586, v589 in v46.AmmoTypes, nil, v583 do
                    local v587 = v42
                    if v589 ~= v587.loaded then
                        v587 = v27
                        v587 = v589
                        if v587.GetTotalOfItem(v587) >= 0 then
                            v1.onUse4(v589)
                            return 
                        end
                    end
                end
                return 
            end
        end
        return 
    end
end
v1.onUse3 = function(p17)
end
v1.onUse4 = function(p18)
    local v604 = v46
    if v42.ammo < v604.MaxAmmo then
        if v42.loaded ~= p18 then
            v604 = v43
            v604 = v46
            if os.clock() - v604 >= v604.EquipTime then
                if os.clock() >= 0 then
                    if 0 > v27.GetTotalOfItem(p18) then
                        return 
                    end
                    v604 = v22
                    v604 = "Load"
                    v23.Send(v604.INV_USE_ITEM, v604, p18)
                end
            end
        end
        return 
    end
end
v1.getRadialMenu = function()
    local v625 = {}
    local v627 = v46.AmmoTypes
    for v626, v632 in v627, nil, nil do
        local v630 = v42
        if v632 ~= v630.loaded then
            v630 = v27
            v630 = v632
            if v630.GetTotalOfItem(v630) >= 0 then
                v625[#v625 + 1] = v632
            end
        end
    end
    v627 = #v625
    if v627 == 0 then
        return 
    end
    return v625
end
v1.EquipToPlayer = function(p19, p20)
    local v640 = p20.id
    local v641 = v11[v640]
    local v685 = p19.model
    local v686 = p19.anims
    local v642 = false
    local v644 = v5.HandModels
    local v687 = v641.HandModel
    p19.handModel = v644[v687]:Clone()
    if p20.skin then
        v687 = v20
        v644 = v687.GetInfoFromItemAndName
        v687 = v641.HandModel
        v644(v687, p20.skin).ApplyToModel(p19.handModel)
    end
    p19.handModel.Parent = v685
    p19.HMAnims = {}
    p19.AnimMarkers = {}
    local v692 = v641.HandModelAnimations
    local v650
    local v651
    for v660, v655 in v692, v650, v651 do
        p19.HMAnims[v655] = getAnimation_1(v655).GetAnimationPlayer(p19.handModel.AnimationController.Animator, v640[v660], v641)
    end
    v692 = v686
    v650 = nil
    v651 = nil
    for v660, v655 in v692, v650, v651 do
        v652 = p19.AnimMarkers
        v661 = #p19.AnimMarkers + 1
        v652[v661] = (v655:GetMarkerReachedSignal("PlaySoundFromConfig")):Connect(function(p21)
            local v667 = v641
            local v668 = v667.Sounds
            local v669 = v668[p21]
            if v669 then
                v668 = v21
                v669 = v668.PlayFromEmitter
                v667 = v641.Sounds
                v668 = v667[p21]
                v667 = p19.model.PrimaryPart
                v669(v668, v667)
            end
        end)
    end
    v650 = v641.WeldPart
    v692 = v685[v650]
    v651 = "Weld"
    local v674 = Instance.new(v651)
    v674.Parent = v692
    v660 = v641.WeldPart
    v674.Part0 = v685[v660]
    v660 = p19.handModel
    v674.part1 = v660.Handle
    v655 = v641.VMAnimations
    v660 = v655.Equip
    local v698 = v686[v660]
    v655 = v21
    v660 = v655.PlayFromEmitter
    v652 = v641.Sounds
    v655 = v652.Equip
    v661 = p19.model
    v652 = v661.PrimaryPart
    v660(v655, v652)
    v698:Play()
    v673 = v698.Length
    v661 = v673 - 0.01
    v673 = v641.EquipTime
    v698:AdjustSpeed((v661) / v673)
    local function v679()
        v642 = true
    end
    p19.cancelEquip = v679
    v679 = task.wait
    v679(v641.EquipTime)
    if not v642 then
        v686[v641.VMAnimations.Idle]:Play()
    end
end
v1.UnEquipToPlayer = function(p22)
    p22.handModel:Destroy()
    local v702 = p22.model
    local v704 = p22.handModel
    if v704 then
        v704 = p22.handModel
        v704:Destroy()
    end
    local v705 = p22.handWeld
    if v705 then
        v705 = p22.handWeld
        v705:Destroy()
    end
    local v706 = p22.AnimMarkers
    local v707
    local v708
    for v711, v710 in v706, v707, v708 do
        v710:Disconnect()
    end
    v706 = table.clear
    v707 = p22.AnimMarkers
    v706(v707)
    v708 = nil
    for v711, v710 in p22.anims, nil, v708 do
        v710:Stop()
    end
end
v1.PlayerFire = function(p23, p24)
    local v719 = v11[p23.equippedItem.id]
    local v740 = p23.model
    local v741 = p23.anims
    local v742 = v741[v719.VMAnimations.Fire]
    if v742 then
        v742:Play()
    end
    local v723 = v741[v719.VMAnimations.Fire]
    if v723 then
        v723:Play()
    end
    v723 = p23.HMAnims[v719.HandModelAnimations.Fire]
    if v723 then
        v723:Play()
    end
    v723 = v21.PlayFromEmitter
    local v730 = math.random(-35, 20)
    v723(v719.Sounds.Fire, p23.model.PrimaryPart, (v730) / 350)
    local v733 = p23.handModel:FindFirstChild("Muzzle")
    if v733 then
        v733 = v30.PlayInPart
        v733("MuzzleFlash", p23.handModel.Muzzle)
    end
    local v737 = v719.entityCreate
    if not v737 then
        v737 = createProjectile_1
        v735 = false
        v730 = p23.id
        v737(p24, v719, v735, v730)
    end
end
v1.PlayerPull = function(p25, p26)
    local v755 = v11[p25.equippedItem.id]
    local v772 = p25.model
    local v774 = p25.anims[v755.VMAnimations.Pull]
    local v775 = p25.HMAnims
    local v758 = v755.HandModelAnimations
    local v759 = v758.Pull
    local v776 = v775[v759]
    if p26 then
        v759 = v21
        v775 = v759.PlayFromEmitter
        v758 = v755.Sounds
        v759 = v758.Pull
        v758 = p25.model.PrimaryPart
        v775(v759, v758)
        v774:Play(v755.PullTime, 1, (v776.Length - 0.01) / v755.PullTime)
        v776:Play(v755.PullTime, 1, (v776.Length - 0.01) / v755.PullTime)
        return 
    end
    v774:Stop()
    v776:Stop()
end
return v1
