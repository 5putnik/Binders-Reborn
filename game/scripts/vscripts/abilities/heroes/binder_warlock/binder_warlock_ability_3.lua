

--require("Abilities/customability_spellcraft")

function Particle(keys)
	

	local Caster = keys.caster
	local point  = keys.target_points[1]
	local duration = keys.duration
	local stopParticle = false

	local IcicleRain = ParticleManager:CreateParticle("particles/units/heroes/hero_legion/legion_spell_overwhelming_odds.vpcf", PATTACH_ABSORIGIN, Caster)
	ParticleManager:SetParticleControl(IcicleRain,0,point)

	Timers:CreateTimer(.5, -- Start this timer 10 game-time seconds later
	function()
		
		local think = .5
		if stopParticle == false then
			local IcicleRain = ParticleManager:CreateParticle("particles/units/heroes/hero_legion/legion_spell_overwhelming_odds.vpcf", PATTACH_ABSORIGIN, Caster)
			ParticleManager:SetParticleControl(IcicleRain,0,point)
			return .5
		else
			return
		end

		return .5 -- Rerun this timer every 90 game-time seconds 
	end)

	Timers:CreateTimer(duration, -- Start this timer 10 game-time seconds later
	function()
		
		stopParticle = true

		return
	end)


end

function Damage(keys)
	local	Target = keys.target
	local	Caster = keys.caster
	local   ability = keys.ability
	local	damage = keys.damage / 100 
	
	dmg = 100		--Get Intelligence scaled
	DealDamage(Caster, Target, dmg, DAMAGE_TYPE_MAGICAL, nil)

end


-- a function that makes dealing damage slightly faster.
function DealDamage(source, target, damage, dType, flags)
	local dTable = {
		victim = target,
		attacker = source,
		damage = damage,
		damage_type = dType,
		damage_flags = flags,
		ability = nil
	}
	ApplyDamage(dTable)
end