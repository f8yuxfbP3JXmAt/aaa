local v2 = _G.NEXT
local v911 = _G.modules
local v5 = game:GetService("ReplicatedStorage")
local v8 = game:GetService("RunService")
local v11 = game:GetService("Debris")
local v14 = require(v5.ItemConfigs)
local v16 = v5.Maps
local v18 = require(v16.MaterialSounds)
v16 = v911.Network
local v19 = v16.SendCodes
v16 = v911.Sound
local v20 = v911.Network
local v21 = v911.FPS
local v22 = v911.Camera
local v23 = v911.Particle
local v24 = Vector3.new
local v25 = Vector2.new
local v26 = CFrame.new
local v27 = math.clamp
local v28 = CFrame.fromOrientation
local v29 = math.min
local v30 = os.clock
local v31 = {}
local v32 = {}
local v33 = false
local v34 = false
local function SetPlayerAnimationPlaying_1(p1, p2, p3)
    local v37 = p1.anims
    local v38 = v37[p2]
    if v38 then
        if v38.IsPlaying then
            return 
        end
    end
    v39 = v37.Idle
    v39:Stop(p3)
    v37.Slide:Stop(p3)
    v37.Walk:Stop(p3)
    v37.Crouch:Stop(p3)
    v37.CrouchWalk:Stop(p3)
    if not p2 then
        return 
    end
    v38:Play(p3)
end
v2.GetModelFromPart = function(p4)
    local v53 = p4.Parent
    local v54 = v32
    for v60, v58 in v54, nil, nil do
        if v58.model == v53 then
            return v53, v58.id
        end
    end
    v54 = false
    return v54
end
v2.GetPlayerModel = function(p5)
    local v63 = v32
    local v64 = v63[p5]
    if v64 then
        v63 = v32[p5]
        v64 = v63.model
        return v64
    end
end
v2.Sleep = function(p6)
    local v68 = v32[p6]
    if not v68 then
        return 
    end
    v68.sleeping = true
    SetPlayerAnimationPlaying_1(v68, "Sleep", 1)
    v68.lastPos = v68.pos
    v2.Slide(p6, false)
    v2.Crouch(p6, false)
    v2.UnEquipItem(p6)
    local v80 = v68.viewMarker
    if v80 then
        v68.viewMarker = nil
        v80:Destroy()
    end
    local v82 = v68.viewPoint
    if v82 then
        v68.viewPoint = nil
        v82:Destroy()
    end
end
local function findArmorPiece_1(p7, p8)
    for v96, v97 in p7, nil, nil do
        if v95.id == p8 then
            return v95
        end
    end
end
v2.SetPlayerArmor = function(p9, p10)
    local v100 = v32
    local v101 = v100[p9]
    if not v101 then
        return 
    end
    local v128 = p10
    if not v128 then
        v128 = {}
    end
    p10 = v128
    local v129 = v101.model
    local v103, v104, v105 = v129.Armor:GetChildren()
    for v116, v108 in v103, v104, v105 do
        for v115, v113 in p10, nil, nil do
            local v112 = v113.id
            local v114 = v113
        end
        if v112 == v108.Name then
            v114 = nil
        else
        end
        if not v114 then
            v108:Destroy()
        end
    end
    v103 = p10
    v104 = nil
    v105 = nil
    for v116, v108 in v103, v104, v105 do
        local v117 = v108.id
        v106 = v100.Armor
        v109 = v117
        local v118 = v106:FindFirstChild(v109)
        if not v118 then
            v118 = Instance.new
            v107 = "Folder"
            local v119 = v118(v107)
            v119.Parent = v100.Armor
            v119.Name = v117
            v110 = v5
            local v121 = v110.ArmorModels
            local v122, v121, v110 = v121[v117]:GetChildren()
            for v111, v115 in v122, v121, v110 do
                local v123 = v115:Clone()
                v123.Parent = v119
                v112 = Instance.new
                local v125 = v112("Weld")
                v125.Part0 = v123.PrimaryPart
                v125.Part1 = v100[v115.Name]
                v125.Parent = v123
            end
        end
    end
    v104 = p10
    v105 = v104
    v116 = nil
    v108 = nil
    for v117, v119 in v105, v116, v108 do
        v122 = v119.id
        v103 = v119
    end
    if v122 == "ShoulderLight" then
        v103 = nil
    else
    end
    if v103 then
        v104 = v103.on
        if v104 then
            v117 = v129.Armor
            v108 = v117.ShoulderLight
            v116 = v108.Head
            v105 = v116.Head
            v104 = v105.SpotLight
            v105 = true
            v104.Enabled = v105
            v108 = v129.Armor
            v116 = v108.ShoulderLight
            v105 = v116.Torso
            v104 = v105.Emitter
            v105 = Enum.Material.Neon
            v104.Material = v105
            return 
        end
        v117 = v129.Armor
        v108 = v117.ShoulderLight
        v116 = v108.Head
        v105 = v116.Head
        v104 = v105.SpotLight
        v105 = false
        v104.Enabled = v105
        v108 = v129.Armor
        v116 = v108.ShoulderLight
        v105 = v116.Torso
        v104 = v105.Emitter
        v105 = Enum.Material.SmoothPlastic
        v104.Material = v105
    end
end
v2.Unload = function(p11, p12)
    local v134 = v32[p11]
    if not v134 then
        return 
    end
    v2.UnEquipItem(p11)
    v32[p11] = nil
    local v172 = v134.model
    local v138 = workspace
    v172.Parent = v138.Ignore
    local v174 = v134.viewMarker
    if v174 then
        v138 = nil
        v134.viewMarker = v138
        v174:Destroy()
    end
    local v139 = v134.viewPoint
    if v139 then
        v134.viewPoint = nil
        v139:Destroy()
    end
    if p12 then
        v172.PrimaryPart.Anchored = false
        v172.PrimaryPart.AssemblyLinearVelocity = (p12) * 0.25
        v172.Head.AssemblyLinearVelocity = p12
        local v143, v144, v145 = pairs(v172:GetDescendants())
        for v155, v148 in v143, v144, v145 do
            local v149 = v148:IsA("Attachment")
            if v148:IsA("Sound") then
                v148:Destroy()
            else
                local v154 = v148:IsA("BasePart")
                if v154 then
                    v154 = "VisualOnlyPhysics"
                    v148.CollisionGroup = v154
                end
            end
        end
        v143 = pairs
        if not v149 then
            local v156, v157, v145 = v143(v172:GetDescendants())
            for v155, v148 in v156, v157, v145 do
                local v159 = v148:IsA("Motor6D")
                if v159 then
                    v159 = Instance.new
                    local v161 = v159("Attachment")
                    local v164 = Instance.new("Attachment")
                    v161.CFrame = v148.C0
                    v164.CFrame = v148.C1
                    v161.Parent = v148.Part0
                    v164.Parent = v148.Part1
                    local v167 = Instance.new("BallSocketConstraint")
                    v167.Attachment0 = v161
                    v167.Attachment1 = v164
                    v167.Parent = v148.Part0
                    v167.LimitsEnabled = true
                    v167.TwistLimitsEnabled = true
                    v167.UpperAngle = 45
                    v167.TwistLowerAngle = -25
                    v167.TwistUpperAngle = 25
                    v148:Destroy()
                end
            end
            v156 = v11
            v145 = v172
            v155 = 5
            v156:AddItem(v145, v155)
            return 
            v172:Destroy()
            return 
        end
    end
end
function Lerp(p13, p14, p15)
    return p13 + (p14 - p13) * p15
end
v2.ItemAction = function(p16, p17, ...)
    local v194 = v32[p16]
    if not v194 then
        return 
    end
    if v194.equippedItem then
        local v196 = v194.equippedItem
        local v208 = v14[v196.id].Module
        local v204 = v21
        local v206 = v204.ToolControllers[v208]
        local v207 = v206[p17]
        if not v207 then
            v207 = error
            v196 = p17
            v204 = v196 .. " is not member of " .. v208
            v207(v204)
        end
        v206[p17](v194, ...)
    end
end
v2.UnEquipItem = function(p18)
    local v211 = v32[p18]
    if not v211 then
        return 
    end
    if v211.cancelEquip then
        v211.cancelEquip()
        v211.cancelEquip = nil
    end
    v212 = v211.equippedItem
    if v212 then
        v212 = v14[v211.equippedItem.id].Module
        v21.ToolControllers[v212].UnEquipToPlayer(v211)
        v211.equippedItem = nil
    end
end
v2.EquipItem = function(p19, p20)
    local v227 = v32[p19]
    if not v227 then
        return 
    end
    v2.UnEquipItem(p19)
    if p20 then
        v227.equippedItem = p20
        v21.ToolControllers[v14[p20.id].Module].EquipToPlayer(v227, p20)
    end
end
function shortAngleDist(p21, p22)
    local v243 = p22 - p21 % 6.2831853071796
    return (2) * v243 % 6.2831853071796 - v243
end
local function angleLerp_1(p23, p24, p25)
    return p23 + (shortAngleDist(p23, p24)) * p25
end
angleLerp = angleLerp_1
angleLerp_1 = v24
local v258 = angleLerp_1(0, 0.75, 0)
local v260 = RaycastParams.new()
v260.FilterDescendantsInstances = {
    [1] = workspace.Ignore
}
v260.CollisionGroup = "Players"
v260.FilterType = Enum.RaycastFilterType.Exclude
local v264 = v26()
local function getPlayerHeadPos_1(p26, p27)
    local v266
    local v267 = p26.crouching
    if v267 then
        v267 = Vector3.new
        v266 = v267(0, 1.511, 0)
    else
        v271 = Vector3.new
        v266 = v271(0, 2.694, 0)
    end
    v275 = p27 + v266
    return v275
end
v2.Recoil = function(p29, p30)
    local v600 = v32[p29]
    if not v600 then
        return 
    end
    v600.recoilOffsetGoal = v26(v29(p30.push, 0.5), 0, 0)
    v600.recoilReturnBefore = v30() + p30.returnTime
    v600.recoilLerpSpeed = p30.lerp
    local v614 = p30.returnLerp
    if not v614 then
        v614 = p30.lerp
    end
    v600.recoilReturnLerpSpeed = v614
end
v2.Move = function(p31, p32, p33, p34)
    local v617 = v32[p31]
    if not v617 then
        return 
    end
    v617.velocityVector = p32 - v617.goalPosition
    v617.goalProgression = 0
    v617.startPosition = v617.currentPosition
    v617.goalPosition = p32
    v617.startAngleX = v617.goalAngleX
    v617.startAngleY = v617.goalAngleY
    v617.goalAngleX = p33
    v617.goalAngleY = p34
end
v2.Slide = function(p35, p36)
    local v625 = v32
    local v626 = v625[p35]
    if not v626 then
        return 
    end
    v626.sliding = p36
    if p36 then
        v625 = v16.PlayFromEmitter
        v625("SlideStart", v626.model.PrimaryPart)
        v626.model.Head.Sliding:Play()
        return 
    end
    v631 = v16
    v631 = "SlideStop"
    v628 = v626.model
    v630 = v628.PrimaryPart
    v631.PlayFromEmitter(v631, v630)
    v626.model.Head.Sliding:Stop()
end
v2.Crouch = function(p37, p38)
    local v640 = v32[p37]
    if not v640 then
        return 
    end
    v640.crouching = p38
end
local function UpdatePlayerOnTeam_1(p39)
    local v642 = p39.model
    local v643 = v31
    if v643 then
        v643 = table.find
        local v646 = v643(v31, p39.id)
    end
    if v33 then
        local v649 = v642:FindFirstChild("hlChams")
        if not v649 then
            v649 = Instance.new
            local v651 = v649("Highlight")
        end
        v651.Name = "hlChams"
        v651.Parent = v642
        v651.FillTransparency = 1
        v651.OutlineColor = Color3.new(1, 1, 1)
        if v34 then
            if not p39.viewMarker then
                local v658 = Instance.new("Part")
            end
            v658.Parent = workspace.Ignore
            v658.Transparency = 0.4
            v658.Material = Enum.Material.Neon
            v658.Color = Color3.new(0, 1, 0)
            v658.Size = Vector3.new(0.1, 0.1, 1)
            v658.CollisionGroup = "VisualOnly"
            v658.Anchored = true
            p39.viewMarker = v658
            local v697 = p39.viewPoint
            if not v697 then
                v697 = Instance.new
                local v669 = v697("Part")
            end
            v669.Material = Enum.Material.Neon
            v669.Parent = workspace.Ignore
            v669.Transparency = 0.4
            v669.Color = Color3.new(1, 1, 0.117647)
            v669.Shape = Enum.PartType.Ball
            v669.Size = Vector3.new(0.5, 0.5, 0.5)
            v669.CollisionGroup = "VisualOnly"
            v669.Anchored = true
            p39.viewPoint = v669
        else
            v658 = p39.viewMarker
            if v658 then
                v669 = nil
                p39.viewMarker = v669
                v658:Destroy()
            end
            local v679 = p39.viewPoint
            if v679 then
                v678 = nil
                p39.viewPoint = v678
                v679:Destroy()
            end
        end
        v679 = v642.Head
        v658 = v679.ESP
        v679 = true
        v658.Enabled = v679
        v679 = v642.Head.ESP
        v658 = v679.tag
        v679 = p39.name or ""
        v658.Text = v679
        v646 = false
    else
        v679 = "hlChams"
        local v681 = v642:FindFirstChild(v679)
        if v681 then
            v681:Destroy()
        end
        local v682 = p39.viewMarker
        if v682 then
            p39.viewMarker = nil
            v682:Destroy()
        end
        local v684 = p39.viewPoint
        if v684 then
            v680 = nil
            p39.viewPoint = v680
            v684:Destroy()
        end
        v642.Head.ESP.Enabled = false
    end
    if v646 then
        v682 = v642.Head
        v681 = v682.Nametag
        v682 = false
        v681.Enabled = v682
        v682 = v642.Head
        v681 = v682.Dot
        v682 = true
        v681.Enabled = v682
        v682 = v642.Head
        v681 = v682.Dot2
        v682 = true
        v681.Enabled = v682
        v682 = v642.Head
        v681 = v682.Teamtag
        v682 = true
        v681.Enabled = v682
        v684 = v642.Head
        v682 = v684.Teamtag
        v681 = v682.tag
        v684 = p39.name
        v682 = v684 or ""
        v681.Text = v682
        return 
    end
    v682 = v642.Head
    v681 = v682.Nametag
    v682 = true
    v681.Enabled = v682
    v682 = v642.Head
    v681 = v682.Dot
    v682 = false
    v681.Enabled = v682
    v682 = v642.Head
    v681 = v682.Dot2
    v682 = false
    v681.Enabled = v682
    v682 = v642.Head
    v681 = v682.Teamtag
    v682 = false
    v681.Enabled = v682
    v684 = v642.Head
    v682 = v684.Nametag
    v681 = v682.tag
    v684 = p39.name
    v682 = v684 or ""
    v681.Text = v682
end
v2.GotDamaged = function(p40, p41, p42)
    local v713 = v32[p40]
    if not v713 then
        return 
    end
    local v731 = v713.model
    if p41 then
        local v715 = RaycastParams.new()
        v715.FilterType = Enum.RaycastFilterType.Include
        local v732 = {}
        local v717 = v731
        v732[1] = v717
        v715.FilterDescendantsInstances = v732
        local v722 = workspace:Raycast(p41, v731.PrimaryPart.Position - p41, v715)
        if v722 then
            v717 = v23.Play
            v717("Blood", v722.Position, v722.Normal)
        end
    end
    if p42 == "Head" then
        v722 = v16
        v715 = v722.PlayFromPosition
        v722 = "PlayerHitHeadshot"
        v715(v722, v731.PrimaryPart.Position)
        return 
    end
    v726 = v731.PrimaryPart
    v16.PlayFromPosition("PlayerHit2", v726.Position)
end
v2.Wake = function(p43)
    local v739 = v32[p43]
    if not v739 then
        return 
    end
    v739.sleeping = false
    v739.anims.Sleep:Stop()
    UpdatePlayerOnTeam_1(v739)
end
v2.SetClanMembers = function(p44)
    local v746 = p44
    if not v746 then
        v746 = {}
    end
    v31 = v746
    for v752, v751 in v32, nil, nil do
        UpdatePlayerOnTeam_1(v751)
    end
end
v2.SetEsp = function(p45, p46)
    if p46 ~= nil then
        v34 = p46
    end
    if p45 ~= nil then
        v33 = p45
    end
    for v761, v760 in v32, nil, nil do
        UpdatePlayerOnTeam_1(v760)
    end
end
v2.SetGhost = function(p47, p48)
    local v764 = v32[p47]
    local v765 = v764.model
    if p48 then
        v764 = pairs
        local v766, v767, v768 = v764(v765:GetChildren())
        for v773, v771 in v766, v767, v768 do
            local v772 = v771:IsA("BasePart")
            if v772 then
                v772 = 0.5
                v771.Transparency = v772
            end
        end
    else
        v766 = pairs
        local v774, v775, v768 = v766(v765:GetChildren())
        for v773, v771 in v774, v775, v768 do
            local v777 = v771:IsA("BasePart")
            if v777 then
                v777 = 0
                v771.Transparency = v777
            end
        end
    end
    v774 = v765.PrimaryPart
    v775 = 1
    v774.Transparency = v775
end
v2.Name = function(p49, p50)
    local v779 = v32
    local v780 = v779[p49]
    if v780 then
        v780.name = p50
        v779 = UpdatePlayerOnTeam_1
        v779(v780)
    end
end
v2.Load = function(p51, p52)
    if v32[p51] then
        v2.Remove(p51)
    end
    local v786 = v5
    local v788 = v786.Player:Clone()
    v788.Name = "Model"
    local v847 = {}
    local v789 = {}
    v789.goalProgression = 0
    v789.startPosition = p52.pos
    v789.goalPosition = p52.pos
    v789.currentPosition = p52.pos
    v789.startAngleX = 0
    v789.goalAngleX = 0
    v789.startAngleY = 0
    v789.goalAngleY = 0
    v789.lastRenderedPos = v24(p52.pos)
    v789.name = p52.name
    v789.model = v788
    v789.crouching = false
    v789.sliding = false
    v789.lastFootStepPos = Vector3.new(0, 0, 0)
    v789.footstepProgression = 0
    v789.anims = v847
    v789.moving = false
    v789.equippedItem = nil
    v789.handModel = nil
    v789.cancelEquip = nil
    v789.id = p51
    v789.lastPos = p52.pos
    v789.lastNameReq = 0
    v789.recoilOffset = v26()
    v789.recoilOffsetGoal = v26()
    v789.recoilLerpSpeed = 1
    v789.recoilReturnBefore = 0
    v789.recoilReturnLerpSpeed = 1
    v789.startMarkerSize = v24()
    v789.startMarkerCFrame = v26()
    v789.startVPCFrame = v26()
    v789.goalMarkerSize = v24()
    v789.goalMarkerCFrame = v26()
    v789.goalVPCFrame = v26()
    v789.armor = {}
    local v812 = v28(0, 0, 0)
    v788:PivotTo((v26(p52.pos)) * v812)
    v32[p51] = v789
    UpdatePlayerOnTeam_1(v789)
    v788.Parent = workspace
    v788.LeftFoot.Color = p52.skinColor
    v788.RightFoot.Color = p52.skinColor
    v788.LeftHand.Color = p52.skinColor
    v788.RightHand.Color = p52.skinColor
    v788.LeftLowerLeg.Color = p52.skinColor
    v788.RightLowerLeg.Color = p52.skinColor
    v788.RightLowerArm.Color = p52.skinColor
    v788.LeftLowerArm.Color = p52.skinColor
    v788.Head.Color = p52.skinColor
    local v897 = v5
    local v818, v817, v819 = v897.Animations:GetDescendants()
    for v807, v812 in v818, v897, v819 do
        local v822 = v812:IsA("ModuleScript")
        if v822 then
            v822 = require
            local v824 = v822(v812)
            local v825 = v824.dontPreload
            if not v825 then
                v825 = v812.Name
                v786[v825] = v824.GetAnimationPlayer(v788.AnimationController.Animator)
            end
        end
    end
    v818 = v847.Idle
    v818:Play()
    local v830 = p52.equippedItem
    if v830 then
        v897 = v2
        v830 = v897.EquipItem
        v897 = p51
        v819 = p52.equippedItem
        v830(v897, v819)
    end
    local v831 = p52.crouching
    if v831 then
        v831 = v2.Crouch
        v831(p51, true)
    end
    local v834 = p52.sliding
    if v834 then
        v834 = v2.Slide
        v834(p51, true)
    end
    local v837 = p52.sleeping
    if v837 then
        v837 = v2.Sleep
        v837(p51)
    end
    local v839 = p52.armor
    if v839 then
        v839 = v2.SetPlayerArmor
        v839(p51, p52.armor)
    end
    local v842 = p52.ghost
    if v842 then
        v842 = v2.SetGhost
        v842(p51, true)
    end
end
local function init_1()
    v8:BindToRenderStep("UpdatePlayers", Enum.RenderPriority.Character.Value, function(p28)
        for v506, v281 in v32, nil, nil do
            local v280 = v281.model
            local v282 = v281.name
            v282 = v280.PrimaryPart.Position - v22:GetCFrame().Position.Magnitude
            local v508 = 15
            v282 = v33
            v282 = table.find
            local v288 = v282(v31, v281.id)
            if v288 then
                local v291 = v281.lastNameReq
                v288 = v30() - v291
                if v288 >= 2 then
                    v288 = v30
                    v281.lastNameReq = v288()
                    local v584 = v20
                    v291 = v19
                    local v585 = v291.REQUEST_NAME
                    v291 = v281.id
                    v585.Send(v585, v291)
                end
            end
            local v294 = (v281.goalProgression) / 0.15
            local v513 = v281.sleeping
            v281.goalProgression = v281.goalProgression + p28
            local v298 = v281.startPosition:Lerp(v281.goalPosition, v29(v294, 1.5))
            local v306 = angleLerp(v281.startAngleX, v281.goalAngleX, v29(v294, 1))
            local v314 = angleLerp(v281.startAngleY, v281.goalAngleY, v29(v294, 1))
            v280:PivotTo((v26(v298 + v258)) * v28(0, v314, 0))
            v281.currentPosition = v298
            v280.Head.Neck.C1 = (v26(0, -0.4, 0)) * v28((-v306) * 0.66666666666667, 0, 0)
            v280.Torso.RootHip.C1 = (v26(0, -1.2, 0)) * v28(0, 0, (v306) * 0.33333333333333)
            v281.recoilOffset = v281.recoilOffset:Lerp(v281.recoilOffsetGoal, v29((v281.recoilLerpSpeed) * v294, 1))
            if v30() > v281.recoilReturnBefore then
                v281.recoilLerpSpeed = v281.recoilReturnLerpSpeed
                v281.recoilOffsetGoal = v264
            end
            local v535 = v281.recoilOffset
            v280.LeftUpperArm.LeftShoulder.C0 = ((v26(0, 0.722453117, 0.75)) * v28(0, 0, (-v306) * 0.66666666666667)) * v535
            local v363 = v26(0, 0.722453117, -0.744934082)
            local v541 = -v306
            local v368 = v28(0, 0, (v541) * 0.66666666666667)
            local v542 = (v363) * v368
            local v543 = (v542) * v535
            v280.RightUpperArm.RightShoulder.C0 = v543
            if v281.isAiming then
                v543 = v280.Head
                v363 = v280.Head
                v542 = v363.Neck
                v543 = v542.C0
                v368 = v26
                v541 = -0.7
                v363 = (v368(0, 1.15878582, 0)) * v28(0, 1.5707963705063, v541)
                v543.Neck.C0 = v543:Lerp(v363, v29((v294) * 0.25, 1))
            else
                v379 = v280.Head
                v542 = v280.Head.Neck
                v379 = v542.C0
                v379.Neck.C0 = v379:Lerp((v26(0, 1.15878582, 0)) * v28(0, 1.5707963705063, 0), v29((v294) * 0.25, 1))
            end
            local v550 = v34
            local v551 = v33
            local v553
            local v394 = v281.crouching
            if v394 then
                v394 = Vector3.new
                v553 = v394(0, 1.511, 0)
            else
                v398 = Vector3.new
                v553 = v398(0, 2.694, 0)
            end
            v393 = v298 + v553
            local v403 = RaycastParams.new()
            v402 = Enum.RaycastFilterType.Exclude
            v403.FilterType = v402
            v402 = {}
            v402[1] = v281.model
            v403.FilterDescendantsInstances = v402
            v402 = "WeaponRaycast"
            v403.CollisionGroup = v402
            v402 = (CFrame.fromOrientation(v306, v314, 0).LookVector) * 500
            local v413 = workspace:Raycast(v393, v402, v403)
            local v557 = v281.viewMarker
            local v414 = v281.viewPoint
            v557.Size = Vector3.new(0.1, 0.1, v413.Distance)
            local v427 = v413.Distance
            local v428 = -v427
            local v430 = CFrame.new(0, 0, (v428) / 2)
            v557.CFrame = (CFrame.lookAt(v393, v413.Position)) * v430
            v414.CFrame = CFrame.new(v413.Position)
            local v433 = v2.GetModelFromPart(v413.Instance)
            local v434 = v413.Instance
            v433 = v434.Name
            if v433 == "Head" then
                v433 = Color3.new
                v434 = 1
                v430 = 0
                v557.Color = v433(v434, v430, 0)
            else
                v436 = Color3.new
                v557.Color = v436(1, 1, 0)
                v557.Color = Color3.new(0, 1, 0)
                local v564 = v402.Magnitude
                v557.Size = Vector3.new(0.1, 0.1, v564)
                v427 = -v564
                v428 = (v427) / 2
                v557.CFrame = (CFrame.lookAt(v393, v393 + v402)) * CFrame.new(0, 0, v428)
                v414.CFrame = CFrame.new(0, -100, 0)
                v557.Color = Color3.new(0.5, 0.5, 0.5)
            end
            v393 = v281.lastRenderedPos
            local v570 = v298 - v393
            v402 = v570.X
            v393 = v25(v402, v570.Z).Magnitude
            local v573 = v281.startPosition - v281.goalPosition
            local v577 = v25(v573.X, v573.Z).Magnitude
            v281.lastRenderedPos = v298
            v281.footstepProgression = v281.footstepProgression + v393
            v463 = 0
            v444 = v24
            local v473 = workspace:Raycast(v298, v444(v463, -3.5, 0), v260)
            if v281.footstepProgression >= 6 then
                if v473 then
                    if not v281.sliding then
                        v281.footstepProgression = 0
                        if not v281.crouching then
                            v16.PlayFromEmitter(v18[v473.Material], v280.PrimaryPart, (math.random(-10, 10)) / 350, 0)
                        end
                    end
                end
            end
            local v482 = 0.25
            v482 = v281.sliding
            if v482 then
                v482 = SetPlayerAnimationPlaying_1
                v482(v281, "Slide", 0.2)
            else
                local v486 = v281.crouching
                if v486 then
                    v486 = SetPlayerAnimationPlaying_1
                    v486(v281, "CrouchWalk", 0.2)
                    v281.anims.CrouchWalk:AdjustSpeed((v393) * 3)
                else
                    v490 = v281
                    SetPlayerAnimationPlaying_1(v490, "Walk", 0.2)
                    local v496 = v281.anims
                    v496.Walk:AdjustSpeed((v393) * 3)
                    local v499 = v281.crouching
                    if v499 then
                        v499 = SetPlayerAnimationPlaying_1
                        v496 = v281
                        v499(v496, "Crouch", 0.2)
                    else
                        SetPlayerAnimationPlaying_1(v281, "Idle", 0.2)
                    end
                end
            end
        end
        return 
        if not v282 then
            if v465 >= v482 then
            end
            if v433 then
            end
            if v413 then
            end
            if v325 then
            end
            if v325 then
            end
            if not v293 then
            end
            if not v282 then
            end
            if v282 < v287 then
            end
        end
    end)
end
v2.init = init_1
init_1 = true
return init_1
