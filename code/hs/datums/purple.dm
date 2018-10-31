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
						var/dist = GetDist(src,i)
						if(dist < nearest_dist)
							target = i
				if(target)
					new /obj/Particle/crosshair(target.loc)
					walk_to(src,target,4,0.5,0)
					usr << "\red You fell an unstoppable rage towards [target.name]!"
					if(prob(10))
						explosion(usr, 0, 0, 3, 0,1)
					for(var/mob/M in hearers())
						if(M.client)
							M << sound('bikehorn.ogg')
				else
					usr << "\blue You have no targets!"

				//Cooldown padrão
					if(allowActions != 1)
						allowActions = 1
						spawn() Cooldown()
					cooldown = world.time + 10