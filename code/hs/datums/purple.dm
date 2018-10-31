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
					new /obj/Particle/crosshair(target.loc)
					density = 0
					walk_to(usr,target,1,0.5,0)
					spawn(10)
						density = 1
					usr << "\red You fell an unstoppable rage towards [target.name]!"
					if(prob(50))
						explosion(target, 0, 0, 1, 0,1)
						usr.say("HOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOONK!")
					for(var/mob/M in hearers())
						if(M.client)
							M << sound('bikehorn.ogg')
					usr.say("HonNK!")
					//Cooldown padrão
					if(allowActions != 1)
						allowActions = 1
						spawn() Cooldown()
					cooldown = world.time + 600
				else
					usr << "\blue You can't use this action right now!"