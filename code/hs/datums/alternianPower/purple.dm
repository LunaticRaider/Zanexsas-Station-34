datum
	alternians
		purple
			var/mob/target
			var/nearest_dist = 30
			verb/searchEnemy()
				set name = "Enrage"
				set category = "Alternian"
				for(var/mob/i in Mobs)
					if(i != usr)
						var/dist = GetDist(usr,i)
						if(dist < nearest_dist)
							target = i
				if(target && cooldown < world.time)
					new /obj/Particle/rage(usr.loc)
					new /obj/Particle/crosshair(target.loc)
					density = 0
					walk_to(usr,target,1,0.5,0)
					spawn(10)
						density = 1
					usr << "\red You fell an unstoppable rage towards [target.name]!"
					if(get_dist(src,target) <= 1)
						var/datum/effects/system/harmless_smoke_spread/SM = new(target.loc)
						SM.attach(target)
						explosion(target, 0, 0, 1, 1,1)
						usr.say(pick("HOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOONK!","Honk hOnk...","honk HON---K","HONKHONKHONK"))
					for(var/mob/M in hearers())
						if(M.client)
							M << sound('bikehorn.ogg')
					usr.say(pick("HonNK!","honk!","honkhonk","Honk!","HonBOLSONARO2018honk"))
					//Cooldown padrão
					if(allowActions != 1)
						allowActions = 1
						spawn() Cooldown()
					cooldown = world.time + 90
				else
					usr << "\blue You can't use this action right now!"