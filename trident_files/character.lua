-- script_hash: 47cfd64792206ee4fa9d463e4a70434b46dd465bad1da4fa0206c5f134bc2821ef6c5bbedea2eabf4ce8c1da8f9e73b6
local v2 = _G.NEXT
local v703 = _G.modules
local v5 = game:GetService("ReplicatedStorage")
local v8 = game:GetService("RunService")
local v11 = game:GetService("SoundService")
local v14 = game:GetService("UserInputService")
local v15 = v703.Network
local v16 = v15.SendCodes
v15 = v703.Camera
local v17 = v703.Sound
local v18 = v703.UI
local v19 = v703.Network
local v20 = v703.Player
local v21 = v703.Entity
local v22 = v703.FPS
local v24 = v5.Maps
local v26 = require(v24.MaterialSounds)
local v27
v24 = CFrame.new
local v28 = Vector3.new
local v29 = CFrame.fromOrientation
local v30 = os.clock
local v31 = math.atan2
local v32 = Vector2.new
local v33 = math.sin
local v34 = math.cos
local v35 = Enum.UserInputType.Touch
local v37 = v5.LocalCharacter:Clone()
local v38 = workspace
local v39 = v38.Ignore
v37.Parent = v39
v39 = Enum.MouseBehavior.LockCenter
v38 = Enum.UserInputType.Gamepad1
local v40 = Enum.KeyCode.Thumbstick1
local v41
local v42 = false
local v43 = false
local v44 = false
local v45 = false
local v46 = 0
local v47 = 0
local v48
local v50 = v28()
local v51 = false
local v52 = false
local v53 = false
local v54 = false
local v55 = false
local v56 = false
local v57 = false
local v58 = false
local v59 = false
local v61 = v30()
local v63 = v30()
local v64 = 0
local v65
local v70 = v28(0, 0.75, 0)
local v75 = v28(0, 0, 0)
local v80 = v28(70000, 0, 70000)
local v85 = v28(70000, 70000, 70000)
local v90 = v28(10000, 0, 10000)
local v92 = RaycastParams.new()
v92.FilterDescendantsInstances = {
    [1] = workspace.Ignore
}
v92.FilterType = Enum.RaycastFilterType.Exclude
v14.InputChanged:Connect(function(p1, p2)
    if p1.UserInputType == v38 then
        if p1.KeyCode == v40 then
            if p1.Position.Magnitude >= 0.3 then
                v47 = v31(-p1.Position.X, p1.Position.Y)
                return 
            end
            v100 = 0
            v47 = v100
        end
    end
end)
v2.IsGrounded = function(p3)
    if not v56 then
        local v113 = v59
        if v113 then
            v113 = not p3
            if not v113 then
                v113 = v57
            end
        end
        return v113
    end
end
v2.IsSprinting = function()
    local v115 = v53
    if v115 then
        v115 = not v55
    end
    return v115
end
v2.IsSliding = function()
    return v55
end
v2.SetSprintBlocked = function(p4)
    sprintBlocked = p4
end
v2.Teleport = function(p5)
    v37:PivotTo((v24(p5)) * v29(0, 0, -1.57))
end
v2.GetCFrame = function()
    return v37.PrimaryPart.CFrame
end
local function getMoveAngle_1()
    local v136 = 0
    local v137 = 0
    local v138 = v42
    if v138 then
        v137 = v137 + 1
    end
    v138 = v43
    if v138 then
        v137 = v137 - 1
    end
    v138 = v44
    if v138 then
        v136 = v136 + 1
    end
    v138 = v45
    if v138 then
        v136 = v136 - 1
    end
    local v139 = v18
    v138 = v139.GetShouldMouseLock
    local v140 = v138()
    if v140 then
        v139 = v31
        v140 = v139(v136, v137) + v47
        return v140
    end
    v143 = v136
    v144 = v137
    return v31(v143, v144)
end
local function wantsToMove_1()
    local v148 = v42
    if v148 then
        v148 = v43
        local v149 = not v148
        if not v149 then
            v148 = v43
            if v148 then
                v148 = v42
                v149 = not v148
                if not v149 then
                    v148 = v44
                    if v148 then
                        v148 = v45
                        v149 = not v148
                        if not v149 then
                            v148 = v45
                            if v148 then
                                v148 = v44
                                v149 = not v148
                                if not v149 then
                                    v149 = false
                                    v148 = v47
                                    if v148 ~= 0 then
                                        v148 = v18
                                        v149 = v148.GetShouldMouseLock
                                        local v150 = v149()
                                    end
                                end
                                return v150
                            end
                        end
                    end
                end
            end
        end
    end
end
v2.Spawn = function(p9, p10, p11)
    local v172 = v41
    if v172 then
        v172 = v41
        v172:Destroy()
    end
    v18.SetCore("loading")
    v21.onChunksLoaded = function()
        (function(p6, p7, p8)
            v37:PivotTo(v24(p6))
            v15.SetSubject(v37.Top)
            characterState = "alive"
            v18.SetCore("FPS")
            v18.SetHealth(p7)
            v18.SetEnergy(p8)
        end)(p9, p10, p11)
    end
end
v2.Kill = function(p13, p14)
    v22.UnEquipItem()
    v21.onChunksLoaded = nil
    if v41 then
        v41:Destroy()
    end
    v41 = v5.Player:Clone()
    v41.Parent = workspace.Ignore
    v41:PivotTo((v24(v37.Top.CFrame.Position + Vector3.new(0, -3, 0))) * v29(0, v15.GetY(), 0))
    v15.SetSubject(v41.Head, true)
    (coroutine.wrap(function(p12)
        local v184, v185, v186 = p12:GetDescendants()
        for v191, v189 in v184, v185, v186 do
            if v189:IsA("Attachment") then
                v189:Destroy()
            end
        end
        v185 = v8
        v184 = v185.Stepped
        v184:Wait()
        local v193, v185, v186 = p12:GetDescendants()
        for v191, v189 in v193, v185, v186 do
            local v196 = v189:IsA("Motor6D")
            if v196 then
                v196 = Instance.new
                local v198 = v196("Attachment")
                local v201 = Instance.new("Attachment")
                v198.CFrame = v189.C0
                v201.CFrame = v189.C1
                v198.Parent = v189.Part0
                v201.Parent = v189.Part1
                local v204 = Instance.new("BallSocketConstraint")
                v204.Attachment0 = v198
                v204.Attachment1 = v201
                v204.Parent = v189.Part0
                v204.LimitsEnabled = true
                v204.TwistLimitsEnabled = true
                v204.UpperAngle = 35
                v204.TwistLowerAngle = -25
                v204.TwistUpperAngle = 25
                v189:Destroy()
            else
                v204 = "BasePart"
                if v189:IsA(v204) then
                end
            end
        end
    end))(v41)
    v41.PrimaryPart.Anchored = false
    v41.Head.AssemblyLinearVelocity = p13
    characterState = "dead"
    v51 = false
    v52 = false
    v27["Character.CrouchOrSlide"].BackgroundTransparency = 0.8
    wantsToSlide = false
    v55 = false
    v56 = false
    v53 = false
    characterState = "dead"
    sprintBlocked = false
    v18.SetDeathInfo(unpack(p14))
    v18.SetInventoryVisible(false)
    v18.SetCore("easeSpawning")
end
v2.MoveF = function(p15)
    v42 = p15
end
v2.MoveB = function(p16)
    v43 = p16
end
v2.MoveL = function(p17)
    v44 = p17
end
local function MoveR_1(p18)
    v45 = p18
end
v2.MoveR = MoveR_1
MoveR_1 = 0
v2.Sprint = function(p19)
    local v293 = v42
    if v293 then
        v293 = v43
        local v294 = not v293
        if not v294 then
            v293 = v43
            if v293 then
                v293 = v42
                v294 = not v293
                if not v294 then
                    v293 = v44
                    if v293 then
                        v293 = v45
                        v294 = not v293
                        if not v294 then
                            v293 = v45
                            if v293 then
                                v293 = v44
                                v294 = not v293
                                if not v294 then
                                    v294 = false
                                    v293 = v47
                                    if v293 ~= 0 then
                                        v293 = v18
                                        v294 = v293.GetShouldMouseLock
                                        local v295 = v294()
                                    end
                                end
                                if v295 then
                                    if not p19 then
                                        v293 = v30
                                        v295 = v293() - MoveR_1
                                        if v295 >= 0.5 then
                                            return 
                                        end
                                    end
                                end
                                v51 = p19
                                if p19 then
                                    v295 = v30
                                    MoveR_1 = v295()
                                end
                                return 
                            end
                        end
                    end
                end
            end
        end
    end
end
v2.StopSprint = function()
    v51 = false
    v53 = false
end
v2.ForceSlide = function(p20)
    v52 = p20
    v55 = p20
    if not p20 then
        v27["Character.CrouchOrSlide"].BackgroundTransparency = 0.8
    end
end
v2.CrouchOrSlide = function(p21, p22)
    if characterState ~= "alive" then
        return 
    end
    if p22 == v35 then
        if p21 then
            v52 = not v52
            v52 = p21
        end
        if v52 then
            v309 = v27
            v309 = 0.5
            v309["Character.CrouchOrSlide"].BackgroundTransparency = v309
            v309 = v42
            if v309 then
                v309 = v43
                if not not v309 then
                    v309 = v43
                    if v309 then
                        v309 = v42
                        if not not v309 then
                            v309 = v44
                            if v309 then
                                v309 = v45
                                if not not v309 then
                                    v309 = v45
                                    if v309 then
                                        v309 = v44
                                        if not not v309 then
                                            local v319 = false
                                            v309 = v47
                                            if v309 ~= 0 then
                                                v309 = v18
                                                local v310 = v309.GetShouldMouseLock()
                                            end
                                        end
                                        if v310 then
                                            v310 = v53
                                            if v310 then
                                                v310 = v55
                                                if not v310 then
                                                    v310 = v52
                                                    if v310 then
                                                        v310 = true
                                                        wantsToSlide = v310
                                                        return 
                                                        v309 = v27
                                                        v310 = v309["Character.CrouchOrSlide"]
                                                        v309 = 0.8
                                                        v310.BackgroundTransparency = v309
                                                        v310 = false
                                                        wantsToSlide = v310
                                                    end
                                                end
                                            end
                                        end
                                        return 
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
v2.Jump = function(p23, p24)
    if p24 == Enum.UserInputType.Gamepad1 then
        if v18.GetInventory().Visible then
            return 
        end
    end
    if v56 then
        if v57 then
            if characterState == "alive" then
                v325 = v30
                v323 = v61
                if v325() - v323 < 0.25 then
                    if v55 then
                        return 
                    end
                    if not p23 then
                        return 
                    end
                    v61 = v30()
                    local v346 = v37
                    v323 = v37.PrimaryPart.Velocity.X
                    local v347 = v28
                    v347.PrimaryPart.Velocity = v347(v323, 28, v37.PrimaryPart.Velocity.Z)
                    return 
                end
            end
        end
    end
end
v2.SetNoclipping = function(p25)
    v59 = p25
    if p25 then
        local v350, v351, v352 = v37:GetChildren()
        for v355, v354 in v350, v351, v352 do
            v354.CanCollide = false
        end
        return 
    end
    v350 = v37
    local v356, v351, v352 = v350:GetChildren()
    for v355, v354 in v356, v351, v352 do
        v353 = true
        v354.CanCollide = v353
    end
end
local function IsAlive_1()
    return characterState == "alive"
end
v2.IsAlive = IsAlive_1
IsAlive_1 = Vector3.new
local v363 = IsAlive_1(0, 0, 0)
local v364 = 0
local v365 = false
local v366 = 0
local function findPlayerModelFromDescendant_1(p26)
    local v369 = p26
    while true do
        v369 = v369.Parent
        if v369 ~= nil then
            break
        end
        if not v369:FindFirstChild("Humanoid") then
            break
        end
    end
    return v369
end
function updateCharacter(p27)
    v37.Bottom.Anchored = true
    v37.Bottom.Anchored = false
    v64 = v64 + p27
    if characterState ~= "alive" then
        v64 = 0
        return 
    end
    v53 = false
    v56 = false
    v65 = nil
    local v530
    local v531
    local v408, v409, v410 = (function()
        local v375
        local v376 = 0
        local v377 = 0
        local v378 = -1.5
        for v378 = v378, 1.5, 0.2 do
            if not v375 then
                break
            end
            local v381 = -1.5
            for v381 = v381, 1.5, 0.2 do
                local v388 = v32(v378, v381).Magnitude
                local v397 = 1.45
                v388 = workspace
                v375 = v388:Raycast(v37.PrimaryPart.Position, v28(v378, -3.5, v381), v92)
                local v401 = v375.Normal.Y
                local v402 = 0.3
                v375 = nil
                v376 = v378
                v377 = v381
            end
            if v387 >= v396 then
            end
        end
        return v375, v376, v377
        if v375 then
        end
        if v387 > v388 then
        end
    end)()
    if v408 then
        v530 = v408.Instance
        v531 = v408.Material
        local v413, v414 = v20.GetModelFromPart(v530)
        if v413 then
            v65 = v414
        end
        v56 = true
    end
    local v420 = v37
    local v533 = v420.Top
    local v534 = v533.Position
    v415 = v37.Middle.Position.Y - v534.Y
    v414 = v415 + 0.4
    v413 = -v414
    v414 = 0.75
    if v414 > v413 then
        v413 = true
        v54 = v413
    else
        v413 = false
        v54 = v413
    end
    v415 = v37
    v414 = v415.Bottom
    v413 = v414.Velocity
    v46 = v413
    v414 = v32
    v415 = v46.X
    local v537 = v46
    v413 = v414(v415, v537.Z).Magnitude
    if v55 then
        if v366 >= v413 then
            v55 = false
            wantsToSlide = false
            v19.Send(v16.PLAYER_SLIDE, false)
        end
    end
    local v425 = v37.Bottom
    local v426 = v425.VelocityOverride
    if v42 then
        v425 = not v43
        if not v425 then
            if v43 then
                v425 = not v42
                if not v425 then
                    if v44 then
                        v425 = not v45
                        if not v425 then
                            if v45 then
                                v425 = not v44
                                if not v425 then
                                    v425 = false
                                    if v47 ~= 0 then
                                        v425 = v18.GetShouldMouseLock
                                        local v427 = v425()
                                    end
                                end
                                if v427 then
                                    v534 = v15
                                    v537 = v534.GetX
                                    v427 = v537()
                                    local v543 = v15
                                    local v429 = v543.GetY()
                                    v534 = 0
                                    v533 = 0
                                    v420 = v42
                                    if v420 then
                                        v533 = v533 + 1
                                    end
                                    v420 = v43
                                    if v420 then
                                        v533 = v533 - 1
                                    end
                                    v420 = v44
                                    if v420 then
                                        v534 = v534 + 1
                                    end
                                    v420 = v45
                                    if v420 then
                                        v534 = v534 - 1
                                    end
                                    local v430 = v18
                                    v420 = v430.GetShouldMouseLock
                                    local v431 = v420()
                                    if v431 then
                                        v430 = v534
                                        v431 = v31
                                        v543 = v431(v430, v533) + v47
                                        v543 = v31(v534, v533)
                                    else
                                    end
                                    v429 = v429 + v543
                                    v366 = 12
                                    if v51 then
                                        if not sprintBlocked then
                                            v366 = 18
                                            v53 = true
                                        end
                                    end
                                    if v54 then
                                        v366 = 8
                                    end
                                    if v59 then
                                        v366 = (v366) * 3
                                        if v53 then
                                            v366 = (v366) * 5
                                        end
                                        v436 = v429
                                        v533 = v33
                                        v534 = v34
                                        local v439 = v43
                                        if v439 then
                                            v427 = -v427
                                        else
                                            v439 = v42
                                            if not v439 then
                                                v427 = 0
                                            end
                                        end
                                        v439 = v28
                                        v426.Velocity = v439((-v533(v436)) * v366, math.clamp((v427) * v366, -200, 200), (-v534(v429)) * v366)
                                    else
                                        v449 = v33
                                        v438 = v34
                                        v446 = -v438(v429)
                                        v447 = v366
                                        v426.Velocity = v28((-v449(v429)) * v366, 0, (v446) * v447)
                                        v15.SetSwaySpeed((v366) * 0.1)
                                        v427 = false
                                        v51 = v427
                                        v429 = v15
                                        v427 = v429.SetSwaySpeed
                                        v429 = 0
                                        v427(v429)
                                        v426.Velocity = v28(0, 0, 0)
                                    end
                                    v462 = v59
                                    if v462 then
                                        v462 = v85
                                        v426.MaxForce = v462
                                    else
                                        v462 = v55
                                        if v462 then
                                            v462 = v75
                                            v426.MaxForce = v462
                                        else
                                            v462 = v56
                                            if v462 then
                                                v462 = v80
                                                v426.MaxForce = v462
                                            else
                                                v462 = v90
                                                v426.MaxForce = v462
                                            end
                                        end
                                    end
                                    v462 = v53
                                    if v462 then
                                        v462 = wantsToSlide
                                        if v462 then
                                            v462 = v55
                                            if not v462 then
                                                v462 = v56
                                                if v462 then
                                                    v462 = v57
                                                    if v462 then
                                                        v462 = true
                                                        v55 = v462
                                                        v462 = v15.GetY() + 3.1415
                                                        local v467 = v63
                                                        if v30() - v467 >= 1.5 then
                                                            v63 = v30()
                                                            local v616 = v17
                                                            local v617 = "SlideStart"
                                                            v617.Play(v617)
                                                            local v470 = v37.PrimaryPart
                                                            v459 = v462
                                                            v446 = v462
                                                            v467 = (v28(v33(v459), 0, v34(v446))) * 25
                                                            v470.Velocity = v470.Velocity + v467
                                                            v467 = v16
                                                            v467 = true
                                                            v19.Send(v467.PLAYER_SLIDE, v467, v28(v33(v462), 0, v34(v462)))
                                                            v462 = wantsToSlide
                                                            if not v462 then
                                                                v462 = v55
                                                                if v462 then
                                                                    v462 = false
                                                                    v55 = v462
                                                                    v462 = v19.Send
                                                                    v462(v16.PLAYER_SLIDE, false)
                                                                end
                                                            end
                                                        end
                                                        if v413 >= 40 then
                                                            if not v59 then
                                                                v37.PrimaryPart.Velocity = (v37.PrimaryPart.Velocity.Unit) * 40
                                                            end
                                                        end
                                                        if v52 then
                                                            v493 = v37
                                                            v489 = v493.Top
                                                            v489 = 3
                                                            v489.CrouchForce.MaxForce = v489
                                                        else
                                                            v493 = v37
                                                            v489 = v493.Top
                                                            v489 = 500
                                                            v489.CrouchForce.MaxForce = v489
                                                        end
                                                        v493 = v37
                                                        v489 = v493.PrimaryPart
                                                        local v574 = v489.Position
                                                        v489 = v364
                                                        v491 = v32
                                                        v490 = v363.X
                                                        local v496 = v491(v490, v363.Z)
                                                        local v499 = v32(v574.X, v574.Z)
                                                        v492 = v496 - v499
                                                        v493 = v492.Magnitude
                                                        v489 = v489 + v493
                                                        v364 = v489
                                                        v363 = v574
                                                        v489 = v364
                                                        v493 = 6
                                                        if v489 >= v493 then
                                                            v489 = v56
                                                            if v489 then
                                                                v489 = v55
                                                                if not v489 then
                                                                    v489 = v65
                                                                    if not v489 then
                                                                        v489 = 0
                                                                        v364 = v489
                                                                        v489 = v54
                                                                        if not v489 then
                                                                            v493 = v365
                                                                            v489 = not v493
                                                                            v365 = v489
                                                                            v489 = 0
                                                                            v493 = v365
                                                                            if v493 then
                                                                                v489 = -0.05
                                                                            end
                                                                            v492 = v17
                                                                            v493 = v492.Play
                                                                            v496 = v26
                                                                            v492 = v496[v531]
                                                                            v499 = (math.random(-10, 10)) / 350
                                                                            v496 = v489 + v499
                                                                            v499 = 0
                                                                            v493(v492, v496, v499)
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                            v489 = v56
                                                            if v489 then
                                                                v489 = v55
                                                                if v489 then
                                                                    local v505 = v11.Sliding
                                                                    v489 = v505.IsPlaying
                                                                    if not v489 then
                                                                        v505 = v11
                                                                        v489 = v505.Sliding
                                                                        v489:Play()
                                                                    end
                                                                    v11.Sliding.Volume = (v413 - 8) / 65
                                                                    v11.Sliding.PlaybackSpeed = (v413 - 8) / 65 + 0.8
                                                                else
                                                                    v504 = v11
                                                                    v505 = v504.Sliding
                                                                    v506 = v505.IsPlaying
                                                                    if v506 then
                                                                        v505 = v11
                                                                        v506 = v505.Sliding
                                                                        v506:Stop()
                                                                        v504 = v11
                                                                        v505 = v504.Sliding
                                                                        v505 = 0.1
                                                                        if v505.Volume > v505 then
                                                                            if not v55 then
                                                                                v505 = v17
                                                                                v505 = "SlideStop"
                                                                                v505.Play(v505)
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                                if v64 > 0.15 then
                                                                    if v58 ~= v54 then
                                                                        v58 = v54
                                                                        v504 = v16
                                                                        v504 = v54
                                                                        v19.Send(v504.PLAYER_CROUCH, v504)
                                                                    end
                                                                    v57 = v56
                                                                    v507 = v15.GetX
                                                                    v503 = v15
                                                                    v503 = v65
                                                                    v19.Send(v16.PLAYER_MOVE, v574, v507(), v503.GetY(), v503, v409, v410)
                                                                    local v519 = v64
                                                                    v519 = v519 - 0.15
                                                                    v64 = v519
                                                                end
                                                                return 
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
local function isInMovementTouchBox_1(p28)
    local v633 = workspace.CurrentCamera.ViewportSize
    if 0.33 >= (p28.X) / v633.X then
        if (p28.Y) / v633.Y >= 0.25 then
            return true
        end
    end
end
v14.TouchEnded:Connect(function(p29, p30)
    if v48 == p29 then
        v48 = nil
        v47 = 0
    end
end)
v14.TouchStarted:Connect(function(p31, p32)
    local v651 = v14.MouseBehavior
    if v651 == v39 then
        local v663 = p31.Position
        local v654 = workspace.CurrentCamera.ViewportSize
        if 0.33 >= (v663.X) / v654.X then
            if (v663.Y) / v654.Y >= 0.25 then
                local v665 = true
            else
                local v666
            end
            if v651 then
                v48 = p31
                v50 = p31.Position
            end
            return 
        end
    end
end)
v14.TouchMoved:Connect(function()
    local v670 = v48
    if v670 then
        v670 = v50 - v48.Position
        v47 = v31(v670.X, v670.Y)
        if (v670.Magnitude) / workspace.CurrentCamera.ViewportSize.Y >= 0.25 then
            v51 = true
            return 
        end
        v51 = false
    end
end)
local function init_1()
    v8:BindToRenderStep("Character", Enum.RenderPriority.Character.Value, updateCharacter)
    v27 = v18.GetMobileControls()
end
v2.init = init_1
init_1 = true
return init_1
