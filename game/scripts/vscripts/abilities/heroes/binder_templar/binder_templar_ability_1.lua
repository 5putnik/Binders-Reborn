

--require("Abilities/customability_spellcraft")

function Particle(keys)
	

	local Caster = keys.caster
	local point  = keys.target_points[1]
	local duration = keys.duration
	local stopParticle = false
	local ability = keys.ability
	local radius = ability:GetLevelSpecialValueFor("radius", (ability:GetLevel() -1))
	local sound = keys.sound

	local IcicleRain = ParticleManager:CreateParticle("particles/econ/items/sven/sven_warcry_ti5/sven_warcry_cast_arc_lightning.vpcf", PATTACH_ABSORIGIN, Caster)
	ParticleManager:SetParticleControl(IcicleRain,0,Vector(point.x,point.y,point.z))
	ParticleManager:SetParticleControl(IcicleRain,1,Vector(point.x,point.y,1000))
	ParticleManager:SetParticleControl(IcicleRain,2,Vector(point.x,point.y,point.z))
	--EmitSoundOnLocationWithCaster(point,"sounds/weapons/hero/zuus/arc_lightning.vsnd_c", Caster)
	--EmitSoundOnLocationWithCaster(point,sound, Caster)
	local part = {}
	for i = 0, 10 do
		part[i] = ParticleManager:CreateParticle("particles/econ/items/sven/sven_warcry_ti5/sven_warcry_cast_arc_lightning.vpcf", PATTACH_ABSORIGIN, Caster)
		ParticleManager:SetParticleControl(part[i],0,Vector(radius*math.cos(i*math.pi/5) + point.x,radius*math.sin(i*math.pi/5) + point.y,point.z))
		ParticleManager:SetParticleControl(part[i],1,Vector(radius*math.cos(i*math.pi/5) + point.x,radius*math.sin(i*math.pi/5) + point.y,1000))
		ParticleManager:SetParticleControl(part[i],2,Vector(radius*math.cos(i*math.pi/5) + point.x,radius*math.sin(i*math.pi/5) + point.y,point.z))
	end
	Timers:CreateTimer(.25, -- Start this timer 10 game-time seconds later
	function()
		
		if stopParticle == false then
			local IcicleRain = ParticleManager:CreateParticle("particles/econ/items/sven/sven_warcry_ti5/sven_warcry_cast_arc_lightning.vpcf", PATTACH_ABSORIGIN, Caster)
			ParticleManager:SetParticleControl(IcicleRain,0,Vector(point.x,point.y,point.z))
			ParticleManager:SetParticleControl(IcicleRain,1,Vector(point.x,point.y,1000))
			ParticleManager:SetParticleControl(IcicleRain,2,Vector(point.x,point.y,point.z))

			local part = {}
			for i = 0, 10 do
				part[i] = ParticleManager:CreateParticle("particles/econ/items/sven/sven_warcry_ti5/sven_warcry_cast_arc_lightning.vpcf", PATTACH_ABSORIGIN, Caster)
				ParticleManager:SetParticleControl(part[i],0,Vector(radius*math.cos(i*math.pi/5) + point.x,radius*math.sin(i*math.pi/5) + point.y,point.z))
				ParticleManager:SetParticleControl(part[i],1,Vector(radius*math.cos(i*math.pi/5) + point.x,radius*math.sin(i*math.pi/5) + point.y,1000))
				ParticleManager:SetParticleControl(part[i],2,Vector(radius*math.cos(i*math.pi/5) + point.x,radius*math.sin(i*math.pi/5) + point.y,point.z))
			end
			return .25
		else
			return
		end

		return .25 -- Rerun this timer every 90 game-time seconds 
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
	local	damage = keys.damage/4

	DealDamage(Caster, Target, damage, DAMAGE_TYPE_MAGICAL, nil)

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


function PlaySound(keys)
	local target = keys.target
	local sound = keys.sound
	EmitSoundOn(sound,target)
end