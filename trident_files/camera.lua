-- script_hash: 44be6ac7d748741bed3c183e03a243ba5c8bdd57db747b67f34331a155b4c2c0e1f5fa65dc4a39d0d623265f41a03745
local v2 = _G.NEXT
local v3 = _G
local v657 = v3.modules
v3 = v657.UI
local v4 = v657.FPS
local v5 = v657.Character
local v6 = v657.Player
local v7 = v657.InputManager
local v10 = game:GetService("RunService")
local v13 = game:GetService("UserInputService")
local v14 = workspace
local v15 = v14.Ignore
local v16 = workspace
v14 = v16.CurrentCamera
local v17 = workspace
local v18 = v17.Ignore
v16 = v18.HLPart
local v19 = workspace
v17 = v19.Ignore
v18 = v17.FPSArms
v17 = math.cos
v19 = math.abs
local v20 = math.clamp
local v21 = os.clock
local v22 = math.noise
local v23 = math.max
local v24 = math.min
local v25 = coroutine.wrap
local function v26(p1)
    return v22(0.5, (v21()) * p1, 8878)
end
local v33 = Vector2.new
local v34 = Vector3.new
local v35 = CFrame.new
local v36 = math.min
local v37 = CFrame.fromOrientation
local v42 = v35(0, 0, 0)
local v47 = v34(0, 0, 0)
local v49 = RaycastParams.new()
local v50 = {}
local v51 = workspace
local v52 = v51.Ignore
v50[1] = v52
v49.FilterDescendantsInstances = v50
v50 = Enum.RaycastFilterType.Exclude
v49.FilterType = v50
v50 = Enum.MouseBehavior.LockCenter
v52 = Enum.MouseBehavior.Default
v51 = nil
local v53
local v54 = 1
local v55 = 0.5
local v56 = 70
local v58 = v33()
local v59 = 1
local v60 = false
local v65 = v34(0, 0, 0)
local v70 = v34(0, 0, 0)
local v75 = v35(0, 0, 0)
local v80 = v35(0, 0, 0)
local v85 = v34(0, 0, 0)
local v90 = v34(0, 1.3, 0)
local v91 = 0
local v96 = v35(0, -2.4, -1)
local v98 = v96:Inverse()
local v103 = v35(0, 0, 0)
local v104
local v105
local v110 = v37(0, 0, 0)
local v115 = v37(0, 0, 0)
local v120 = v35(0, 0, 0)
local v125 = v35(0, -0.1, 0)
local v131 = (v125) * v37(-0.2, 0, 0)
v125 = (v35(0, -0.05, 0)) * v37(-0.15, 0, 0)
local v143 = v35(0, 0, 0)
local v148 = v35(0, 0, 0)
local v150 = v21()
local v151 = 0.5
local v152 = 0.5
local v153
local v154 = false
local v155 = 0
local v156 = 0
local v157 = false
local v158 = 0
local v159
local v161 = v34()
local v162
v2.init = function()
    v51 = v3.GetFPSFrame().ScopeUIs
    v53 = v51:GetChildren()
    v10:BindToRenderStep("Camera", Enum.RenderPriority.Camera.Value, v162)
    v13.InputChanged:Connect(function(p2, p3)
        if p2.UserInputType == Enum.UserInputType.Gamepad1 then
            if p2.KeyCode == Enum.KeyCode.Thumbstick2 then
                if p2.Position.Magnitude >= 0.1 then
                    v58 = v33(p2.Position.X, -p2.Position.Y)
                    return 
                end
                v179 = v33
                v58 = v179(0, 0)
            end
        end
    end)
    v14.CameraType = Enum.CameraType.Scriptable
end
local function sclrp_1(p4, p5)
    return v20(1 - 1 - p4 ^ p5, 0, 1)
end
v162 = function(p6)
    local v208 = v156
    v208 = v208 + (p6) * v91
    v156 = v208
    local v386 = (p6) * 60
    local v211 = v3.GetShouldMouseLock()
    local v389 = v47
    if v211 then
        local v212 = v159
        if v212 then
            v212 = v159.Position
            v389 = v212 - v161
            v212 = v159.Position
            v161 = v212
        end
        v213 = v50
        v13.MouseBehavior = v213
        v213 = false
        v13.MouseIconEnabled = v213
    else
        v212 = v13
        v213 = v52
        v212.MouseBehavior = v213
        v212 = v13
        v213 = true
        v212.MouseIconEnabled = v213
    end
    v212 = v153
    if not v212 then
        return 
    end
    v213 = v58
    v212 = v213.Magnitude
    v213 = 0.75
    if v212 >= v213 then
        v213 = v59 + (p6) * 15
        v212 = v20
        v59 = v212(v213, 1, 5)
    else
        v216 = 1
        v59 = v216
    end
    v216 = workspace
    local v221 = v216:Raycast(v75.Position, (v75.LookVector) * 75, v49)
    if v221 then
        local v224 = v6.GetModelFromPart(v221.Instance)
        if v224 then
            v224 = 1
            v59 = v224
        end
    end
    v224 = v14
    local v225 = v224.FieldOfView
    local v228 = v56 - v14.FieldOfView
    local v401 = v105 or 0.1
    local v230 = 1
    local v231 = v230 - v401
    local v234 = v20(1 - v231 ^ v386, 0, 1)
    local v405 = v234
    v225 = v225 + (v228) * v405
    v224.FieldOfView = v225
    v224 = nil
    local v406 = v7
    if v406.InputDevice == "Mobile" then
        v228 = v56
        v406 = (v228) / 70
        v224 = ((v389) / 50) * v406
    else
        v228 = v13
        v406 = (v228:GetMouseDelta()) / 120
        v401 = v58
        v234 = v59
        v405 = (v401) * v234
        v405 = v14
        v406 = (v405.FieldOfView) / 70
        v224 = (v406 + (v405) * p6) * v406
    end
    if not v211 then
        v406 = 0
        v236 = 0
        v224 = v33(v406, v236)
    end
    v237 = v154
    if v237 then
        v237 = v153.CFrame
        v75 = v237
    else
        v238 = v153.Position
        local v410 = v90
        v237 = v238 + v410
        v65 = v237
        v237 = v60
        if v237 then
            v401 = v85
            v405 = v401.X
            v401 = v224.Y
            v410 = v405 - v401
            v401 = -1.75
            v234 = v70.X
            v405 = v401 - v234
            v234 = 1.75
            v401 = v234 - v70.X
            v238 = v20
            v234 = v85
            v234 = v224.X
            v234 = 1.5
            v237 = v34
            v85 = v237(v238(v410, v405, v401), v20(v234.Y - v234, -1.5, v234), v85.Z)
        else
            v249 = v85
            v241 = 0.8
            v240 = v241 ^ v386
            v247 = 1 - v240
            v240 = 1
            v85 = v249:Lerp(v47, v20(v247, 0, v240))
            v70 = v34(v20(v70.X - v224.Y, -1.5, 1.5), v70.Y - v224.X, v70.Z)
        end
        v260 = v70
        v260 = v70.Y
        v263 = (v35(v65)) * v37(v260.X, v260, v70.Z)
        v75 = v263
    end
    v263 = v155
    v266 = 0
    if v263 >= v266 then
        v263 = v35
        v241 = v21
        v270 = (v241()) * v155
        v270 = 32
        v271 = (v22(0.5, (v270) * 20, v270)) * v155
        v266 = (v271) * 4
        v231 = v155
        v271 = ((v22(0.5, ((v21()) * v231) * 20, 89)) * v155) * 4
        v80 = v263(v266, v271, 0)
        v155 = v155 - (p6) * 0.8
    else
        v284 = v42
        v80 = v284
    end
    v284 = v14
    v282 = v37
    v283 = v85.X
    v280 = v85
    v285 = ((v75) * v282(v283, v85.Y, v280.Z)) * v80
    v284.CFrame = v285
    v284 = v16
    v285 = v75.Position
    v284.Position = v285
    v284 = v16
    v285 = v16.CFrame
    v280 = 0.5
    v284.CFrame = v285:Lerp(v75, v20(1 - v280 ^ v386, 0, 1))
    v284 = v110
    local v309 = 0.9
    v110 = v284:Lerp(v37(v20((-v224.Y) / 4, -0.4, 0.4), v20((-v224.X) / 4, -0.4, 0.4), 0), v20(1 - v309 ^ v386, 0, 1))
    local v315 = v156
    local v448 = ((v17((v315) * 5)) * 0.075) * v91
    local v449 = 0
    if v157 then
        v315 = v21
        v449 = (v17((v315()) * 1.2)) * 0.04
    end
    v321 = v104
    if v321 then
        v448 = (v448) / 10
        v449 = 0
        v321 = v103
        v319 = (v98) * v104
        v309 = v105
        v231 = 1
        v230 = 1 - v309 or 0.2 ^ v386
        v280 = v231 - v230
        v231 = 0
        v230 = 1
        v309 = v20
        v103 = v321:Lerp(v319, v309(v280, v231, v230))
    else
        v327 = v103
        v326 = 1
        v323 = v326 - 0.9 ^ v386
        v326 = 0
        v103 = v327:Lerp(v42, v20(v323, v326, 1))
    end
    v333 = v143
    v329 = 1
    v324 = 1
    v325 = v324 - v151
    v329 = 0
    v143 = v333:Lerp(v148, v20(v329 - v325 ^ v386, v329, 1))
    if v21() > v150 then
        v151 = v152
        v148 = v42
    end
    local v350 = 0.8
    v115 = v115:Lerp(v35(v448, v19((v448) / 2) + v449, 0), v20(1 - v350 ^ v386, 0, 1))
    local v356 = v5.IsGrounded()
    if not v356 then
        v356 = v120
        v350 = 0.8
        v120 = v356:Lerp(v131, v20(1 - v350 ^ v386, 0, 1))
    else
        v363 = v5.IsSprinting
        local v364 = v363()
        if v364 then
            v364 = v120
            v350 = 0.8
            v120 = v364:Lerp(v125, v20(1 - v350 ^ v386, 0, 1))
        else
            v371 = v120
            v350 = 0.8
            v120 = v371:Lerp(v42, v20(1 - v350 ^ v386, 0, 1))
        end
    end
    v378 = ((((v96) * v110) * v115) * v103) * v120
    v4.ViewModel:PivotTo((((v75) * v80) * v378) * ((v378:Inverse()) * v143) * v378)
end
v2.FreeLook = function(p7)
    v60 = p7
end
v2.SetZoom = function(p8)
    v54 = p8
    v56 = (70) / p8
end
v2.IsZoomFinished = function()
    return 1 > v19(v56 - v14.FieldOfView)
end
v2.SetMouseSensitivity = function(p9)
    v55 = p9
end
v2.SetVMAimingOffset = function(p10, p11, p12)
    local v505 = v53
    local v506
    for v510, v509 in v505, v506, nil do
        v509.Visible = false
    end
    v505 = v18
    v506 = v15
    v505.Parent = v506
    if p10 then
        if p12 then
            v506 = v51
            v505 = v506[p12]
            v506 = true
            v505.Visible = v506
            v505 = v18
            v506 = nil
            v505.Parent = v506
        end
        v506 = v18
        v505 = v506.RightUpperArm
        v506 = 1
        v505.Transparency = v506
    else
        v506 = v18
        v505 = v506.RightUpperArm
        v506 = 0
        v505.Transparency = v506
    end
    v104 = p10
    v105 = p11
end
v2.SetVMInactiveState = function(p13)
end
v2.GetCFrame = function()
    return v75
end
v2.SetSubject = function(p14, p15)
    v154 = p15
    v153 = p14
end
v2.Recoil = function(p18)
    v148 = v35(0, 0, p18.push)
    if p18.rotMag then
        v148 = (v148) * v37(0, 0, (v22(0.5, (v21()) * p18.rotSpeed, 8878)) * p18.rotMag)
    end
    v566 = v21
    local v570 = v566()
    v569 = p18.returnTime
    v150 = v570 + v569
    v151 = p18.lerp
    local v589 = p18.returnLerp
    if not v589 then
        v589 = v151
    end
    v152 = v589
    if p18.cameraY then
        v570 = function(p16, p17)
            if v7.InputDevice == "Mobile" then
                return 
            end
            local v547 = (v19(p16)) * 2
            local v524 = v19(p17)
            while true do
                v524 = 0
                if v524 < p17 then
                    v524 = 0.01
                    if v524 < p16 then
                        v524 = -0.01
                        if v524 >= p16 then
                            break
                        end
                    end
                end
                v524 = v21() - v21() - 0.016666666666667
                if p17 >= 0 then
                    local v529 = v36((v524) * (v524) * 2, p17)
                    local v530 = v70
                    v530 = v530 + v34(v529, 0, 0)
                    v70 = v530
                    p17 = p17 - v529
                end
                v529 = 0.01
                v529 = -0.01
                if v529 >= p16 then
                    v529 = nil
                    v530 = 0
                    if v530 > p16 then
                        v535 = (v524) * v547
                        v530 = v36
                        v529 = v530(v535, -p16)
                        v529 = -v529
                    else
                        v537 = v36
                        v529 = v537((v524) * v547, p16)
                    end
                    v540 = v70
                    v540 = v540 + v34(0, v529, 0)
                    v70 = v540
                    p16 = p16 - v529
                end
                v540 = v10
                v529 = v540.RenderStepped
                v529:Wait()
            end
            return 
            if v529 < p16 then
            end
        end
        v569 = v22(0.5, (v21()) * p18.cameraXShake, 8878)
        v569 = p18.cameraY
        (v25(v570))((v569) * p18.cameraX, v569)
    end
end
v2.Shake = function(p19)
    local v596 = v155
    v596 = v596 + p19
    v155 = v596
    v155 = v36(v155, 1)
end
v2.SetSwaySpeed = function(p20)
    v91 = p20
    if p20 == 0 then
        v157 = true
        return 
    end
    v602 = false
    v157 = v602
end
v2.GetX = function()
    local v605, v606, v607 = v75:ToOrientation()
    return v605
end
v2.GetY = function()
    local v610, v611, v612 = v75:ToOrientation()
    return v611
end
local function isInMovementTouchBox_1(p21)
    local v616 = workspace.CurrentCamera.ViewportSize
    if 0.33 >= (p21.X) / v616.X then
        if (p21.Y) / v616.Y >= 0.25 then
            return true
        end
    end
end
v13.TouchEnded:Connect(function(p22, p23)
    local v628 = v158
    v628 = v628 - 1
    v158 = v628
    if v159 == p22 then
        v159 = nil
    end
end)
v13.TouchStarted:Connect(function(p24, p25)
    local v633 = v158
    v633 = v633 + 1
    v158 = v633
    local v640 = v13.MouseBehavior
    if v640 == v50 then
        local v647 = p24.Position
        local v637 = workspace.CurrentCamera.ViewportSize
        if 0.33 >= (v647.X) / v637.X then
            if (v647.Y) / v637.Y >= 0.25 then
                local v649 = true
            else
                local v650
            end
            if not v640 then
                v159 = p24
                v161 = p24.Position
            end
            return 
        end
    end
end)
return true
