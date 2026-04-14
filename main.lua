print("[HN2] Script V19 - Teleport Script")        --Um you see so how it works is B Will make you jump upwards N is Down G is Forward enjoy 

function GetQuentin()
    local Pawns = FindAllOf("Character")
    if Pawns then
        for _, Pawn in pairs(Pawns) do
            if Pawn:IsValid() and string.find(Pawn:GetFullName(), "Quentin") then
                return Pawn
            end
        end
    end
    return nil
end

-- Ensures you have gravity so you don't hover in the air
function RestorePhysics(Pawn)
    local CMC = Pawn.CharacterMovement
    CMC:SetMovementMode(1, 0)           -- Walking Mode
    CMC.GravityScale = 1.0              -- Normal Gravity
    Pawn:SetActorEnableCollision(true)  -- Normal Walls
end

-- G: Teleport Forward (175)
RegisterKeyBind(Key.G, function()
    local Pawn = GetQuentin()
    if not Pawn then return end
    RestorePhysics(Pawn)
    
    local loc = Pawn:K2_GetActorLocation()
    local forward = Pawn:GetActorForwardVector()
    
    loc.X = loc.X + (forward.X * 175.0)
    loc.Y = loc.Y + (forward.Y * 175.0)
    loc.Z = loc.Z + (forward.Z * 175.0)
    
    Pawn:K2_SetActorLocation(loc, false, {}, true)
end)

-- N: Teleport Down (175)
RegisterKeyBind(Key.N, function()
    local Pawn = GetQuentin()
    if not Pawn then return end
    RestorePhysics(Pawn)
    
    local loc = Pawn:K2_GetActorLocation()
    loc.Z = loc.Z - 175.0
    Pawn:K2_SetActorLocation(loc, false, {}, true)
end)

-- B: Teleport Up (175)
RegisterKeyBind(Key.B, function()
    local Pawn = GetQuentin()
    if not Pawn then return end
    RestorePhysics(Pawn)
    
    local loc = Pawn:K2_GetActorLocation()
    loc.Z = loc.Z + 175.0
    Pawn:K2_SetActorLocation(loc, false, {}, true)
end)
