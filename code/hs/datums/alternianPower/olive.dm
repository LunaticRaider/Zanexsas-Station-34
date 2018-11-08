datum
	alternians
		olive
			var/mob/target
			var/smokeCooldown = 0
			var/nearest_dist = 30
			verb/jumpAttack()
				set name = "Jump Attack!"
				set category = "Alternian"
				searchTargets:
				for(var/mob/i in Mobs)
					if(i != usr)
						var/dist = GetDist(usr,i)
						if(get_dist(i,usr) <= 1)
							target = i
							break
						else if(dist < nearest_dist && !target)
							target = i
							break
						else
							goto searchTargets
				if(target && cooldown < world.time)
					new /obj/Particle/attack(usr.loc)
					new /obj/Particle/crosshair(target.loc)
					density = 0
					usr:Jump()
					walk_to(usr,target,1,0.5,0)
					spawn(10)
						density = 1
					usr << "\red You dash towards [target.name]!"
					for(var/mob/M in hearers())
						if(M.client)
							if(M != usr)
								M << "\red [usr.name] dashes towards [target.name]!"
					usr.say(pick("Slash slash!","shashin' da boi :3"))
					//Cooldown padr?o
					if(allowActions != 1)
						allowActions = 1
						spawn() Cooldown()
					cooldown = world.time + 90
					spawn(3)
					if(get_dist(src,target) <= 1)
						target:TakeBruteDamage(40)
						usr << "\red You slash [target.name]'s face!"
						for(var/mob/M in hearers())
							if(M.client)
								if(M != usr)
									M << "\red [usr.name] slashes [target.name]!"
						//spawn(1) goto searchTargets
					spawn(1)
						goto searchTargets
				else
					usr << "\blue You can't use this action right now!"

			verb/smokeExplosion()
				set name = "Smoke Explosion!"
				set category = "Alternian"
				if(smokeCooldown < world.time)
					new /obj/Particle/attack(usr.loc)
					var/datum/effects/system/harmless_smoke_spread/SM = new(usr.loc)
					SM.attach(usr)
					SM.set_up(10, 0, usr.loc)
					playsound(usr.loc, 'smoke.ogg', 50, 1, -3)
					spawn(0)
						SM.start()
					smokeCooldown = world.time + 30
				else
					usr << "\blue Smoke Explosion is in cooldown"