# Defining Types
abstract type AbstractType end

struct Normal <: AbstractType end
struct Fire <: AbstractType end
struct Water <: AbstractType end
struct Electric <: AbstractType end
struct Grass <: AbstractType end
struct Ice <: AbstractType end
struct Fighting <: AbstractType end
struct Poison <: AbstractType end
struct Ground <: AbstractType end

# Defining Constants
no_effect = 0
not_very_effective = 0.5
normally_effective = 1
super_effective = 2

# Functions
# Normal Type
function eff(atk::Normal, def::Normal)
    return normally_effective
end

# Other Types, but the same
function eff(atk::T, def::T) where T<:AbstractType #Defniniert dass T ein Parameter für Type ist
    if T == Fighting || T  == Ground
        return normally_effective
    else
        return not_very_effective
    end
end

#Different Types
function eff(atk::Normal, def::Y) where Y<:AbstractType
    return normally_effective 
end

function eff(atk::T, def::Fighting) where T<:AbstractType
    return normally_effective 
end

################

function eff(atk::Fire, def::Water)
    return not_very_effective
end

function eff(atk::Fire, def::Grass)
    return super_effective
end

function eff(atk::Fire, def::Ice)
    return super_effective
end

function eff(atk::Water, def::Fire)
    return super_effective
end

function eff(atk::Water, def::Grass)
    return not_very_effective
end

function eff(atk::Water, def::Ground)
    return super_effective
end

function eff(atk::Electric, def::Water)
    return super_effective
end

function eff(atk::Electric, def::Grass)
    return not_very_effective
end

function eff(atk::Electric, def::Ground)
    return no_effect
end

function eff(atk::Grass, def::Fire)
    return not_very_effective
end

function eff(atk::Grass, def::Water)
    return super_effective
end

function eff(atk::Grass, def::Poison)
    return not_very_effective
end

function eff(atk::Grass, def::Ground)
    return super_effective
end

function eff(atk::Ice, def::Fire)
    return not_very_effective
end

function eff(atk::Ice, def::Water)
    return not_very_effective
end

function eff(atk::Ice, def::Grass)
    return super_effective
end

function eff(atk::Ice, def::Ground)
    return super_effective
end

function eff(atk::Fighting, def::Normal)
    return super_effective
end

function eff(atk::Fighting, def::Ice)
    return super_effective
end

function eff(atk::Fighting, def::Poison)
    return not_very_effective
end

function eff(atk::Poison, def::Grass)
    return super_effective
end

function eff(atk::Poison, def::Ground)
    return not_very_effective
end

function eff(atk::Ground, def::Fire)
    return super_effective
end

function eff(atk::Ground, def::Electric)
    return super_effective
end

function eff(atk::Ground, def::Poison)
    return super_effective
end

function eff(atk::Ground, def::Grass)
    return not_very_effective
end

function eff(atk::T, def::Y) where {T<:AbstractType, Y<:AbstractType}
    return normally_effective 
end

##
eff(Water(),Ice())
eff(Water(),Fire())
eff(Fighting(),Fighting())
eff(Ground(),Ground())
eff(Normal(),Water())
eff(Water(),Grass())
eff(Electric(),Ground())
eff(Water(),Normal())
eff(Fire(),Electric())
eff(Normal(),Normal())
eff(Water(),Electric())
##

function eff_string(atk, def)
    x = eff(atk, def)
    if x == 0
        return "no effect"
    elseif x == 0.5
        return "not very effective"
    elseif x == 1
        return "normally effective"
    elseif x == 2
        return "super effective"
    end
end

eff_string(Water(),Fire())
eff_string(Normal(), Normal())
eff_string(Water(),Fire())
eff_string(Grass(), Fighting())
eff_string(Ice(), Fire())
eff_string(Normal(),Water())
eff_string(Electric(),Ice())
eff_string(Fighting(),Fighting())

function attack(atk, def)
    x = eff_string(atk,def)
    return "A Pokemon of the Type $(typeof(atk)) attacked a Pokemon of the Type $(typeof(def)). The attack was $(x)!"
end

attack(Fighting(), Fighting())
