#Defining Types

abstract type AbstractType end

struct Normal <:AbstractType end
struct Fire <: AbstractType end
struct Water <: AbstractType end
struct Electric <: AbstractType end
struct Grass <: AbstractType end
struct Ice <: AbstractType end
struct Fighting <: AbstractType end
struct Poison <: AbstractType end
struct Ground <: AbstractType end

#Defining Constants
no_effect = 0.0
normally_effective = 1.0
not_very_effective = 0.5
super_effective = 2.0

#Implementing Functions
#Normal
function eff(atk::Normal, def::Normal)
    return normally_effective
end

eff(Normal,Normal)

#Other Types, but the same
function eff(atk::Type, def::Type) where {Type}
    if Type == Fighting 
        return normally_effective
    elseif Type == Ground
        return normally_effective
    else 
        return not_very_effective
    end 
end

#eff(atk::AbstractType, def::AbstractType) where {AbstractType} = true

#Other Types, but different
function eff(atk::Type1, def::Type2) where {Type1, Type2}
    if Type1 == Fire
        if Type2 == Water
            return not_very_effective
        elseif Type2 == Grass || Type2 == Ice
            return super_effective
        else 
            return normally_effective
        end
    elseif Type1 == Water
        if Type2 == Fire || Type2 == Ground
            return super_effective
        elseif Type2 == Grass
            return not_very_effective
        else 
            return normally_effective
        end
    elseif Type1 == Electric
        if Type2 == Water
            return super_effective
        elseif Type2 == Grass
            return not_very_effective
        elseif Type2 == Ground
            return no_effect
        else 
            return normally_effective
        end
    elseif Type1 == Grass
        if Type2 == Fire || Type2 == Poison
            return not_very_effective
        elseif Type2 == Water || Type2 == Ground
            return super_effective
        else 
            return normally_effective
        end
    elseif Type1 == Ice
        if Type2 == Fire || Type2 == Water
            return not_very_effective
        elseif Type2 == Grass || Type2 == Ground
            return super_effective
        else 
            return normally_effective
        end
    elseif Type1 == Fighting
        if Type2 == Normal || Type2 == Ice
            return super_effective
        elseif Type2 == Poison
            return not_very_effective
        else 
            return normally_effective
        end
    elseif Type1 == Poison
        if Type2 == Grass
            return super_effective
        elseif Type2 == Ground
            return not_very_effective
        else 
            return normally_effective
        end
    elseif Type1 == Ground
        if Type2 == Fire || Type2 == Electric || Type2 == Poison
            return super_effective
        elseif Type2 == Grass
            return not_very_effective
        else 
            return normally_effective
        end
    end
end

eff(Water(), Fire())
eff(Fighting(), Fighting())

function eff_string(atk, def)
    x = eff(atk, def)
    if x == 0.0
        return "no effect"
    elseif x == 0.5
        return "not very effective"
    elseif x == 1.0
        return "normally effective"
    else x == 2.0
        return "super effective"
    end
end

eff_string(Normal(), Normal())

#als multiple Dispatch
#eff(atk::)








