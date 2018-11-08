datum
	alternians
		olive
			verb/jumpAttack()
				set name = "Jump Attack!"
				set category = "Alternian"
				set background=1

				var/mob/target
				var/nearest_dist = 10

				usr.Jump()
				searchTargets:
				for(var/mob/i in Mobs)
					if(i != usr)
						var/dist = GetDist(usr,i)
						if(in_range(i,usr))
							target = i
						else if(dist < nearest_dist && !target)
							target = i
						else
							goto searchTargets
				if(target && cooldown < world.time)
					new /obj/Particle/attack(target.loc)
					walk_to(usr,target,1,0.5,0)
					if(in_range(target,usr))
						target.TakeBruteDamage(40)
						spawn goto searchTargets
					if(GetDist(usr,target)>10)
						goto searchTargets
					if(allowActions != 1)
						allowActions = 1
						spawn(0) Cooldown()
					cooldown = world.time + 90
				else
					usr << "\blue You can't use this action right now!"

			verb/smokeExplosion()
				set name = "Smoke Explosion!"
				set category = "Alternian"

				new /obj/Particle/attack(usr.loc)
				var/datum/effects/system/harmless_smoke_spread/SM = new(usr.loc)
				SM.attach(usr)
				SM.set_up(10, 0, usr.loc)
				playsound(usr.loc, 'smoke.ogg', 50, 1, -3)
				spawn(0)
					SM.start()