--[[Perfect Strike - Melee extra damage
    Based on Glaives of Wisdom intelligence to damage by chrislotix
    Author: Lostino
    Date: 19.10.2018.]]

function PerfectStrike( keys )

    local ability = keys.ability
    local caster = keys.caster
    local target = keys.target
    local bonus_damage = ability:GetLevelSpecialValueFor("bonus_damage", (ability:GetLevel() -1)) 
    

    local damage_table = {}

    damage_table.attacker = caster
    damage_table.damage_type = ability:GetAbilityDamageType()
    damage_table.ability = ability
    damage_table.victim = target

    damage_table.damage = bonus_damage

    ApplyDamage(damage_table)

end