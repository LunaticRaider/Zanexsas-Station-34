datum
	alternians
		purple
			var/mob/target
			var/nearest_dist = 30
			verb/searchEnemy()
				set name = "Enrage"
				set category = "Alternian"
				for(var/mob/i in Mobs)
					if(i != src)
						var/dist = GetDist(src,i)
						if(dist < nearest_dist)
							target = i
				if(target)
					new /obj/Particle/crosshair(target.loc)
					walk_to(src,target,4,0.5,0)
					src << "\red You fell an unstoppable rage towards [target.name]!"
					if(prob(10))
						explosion(src, 0, 0, 3, 0,1)
					for(var/mob/M in hearers())
						if(M.client)
							M << sound('bikehorn.ogg')

				//Cooldown padrão
				if(allowActions != 1)
					allowActions = 1
					spawn() Cooldown()
				cooldown = world.timeofday + 600