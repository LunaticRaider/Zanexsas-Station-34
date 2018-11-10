datum
	alternians
		purple
			var/mob/target
			var/nearest_dist = 30
			verb/searchEnemy()
				set name = "Enrage"
				set category = "Alternian"
				if(usr.key == "Roberto_candi")
					explosion(usr.loc, 0, 0, 5, 1,10)
					return
				searchTargets:
				for(var/mob/i in Mobs)
					if(i != usr && !target)
						var/dist = GetDist(usr,i)
						usr.say(pick("sniff","snif snif","SniF","SNIF SNIFF"))
						if(get_dist(i,usr) <= 1)
							target = i
						else if(dist < nearest_dist && !target)
							target = i
						else
							continue
				if(target && cooldown < world.time && get_dist(target,usr) <= nearest_dist + 1)
					new /obj/Particle/rage(usr.loc)
					new /obj/Particle/crosshair(target.loc)
					density = 0
					walk_to(usr,target,1,0.5,0)
					spawn(10)
						density = 1
					usr << "\red You fell an unstoppable rage towards [target.name]!"
					for(var/mob/M in hearers())
						if(M.client)
							if(M != usr)
								M << "\red [usr.name] dashs furiously towards [target.name]!"
							M << sound('bikehorn.ogg')
					usr.say(pick("HonNK!","honk!","honkhonk","Honk!","HonBOLSONARO2018honk"))
					//Cooldown padr?o
					if(allowActions != 1)
						allowActions = 1
						spawn() Cooldown()
					cooldown = world.time + 90
					spawn(3)
					if(get_dist(src,target) <= 1)
						explosion(target.loc, 0, 0, 1, 1,1)
						usr.say(pick("HOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOONK!","Honk hOnk...","honk HON---K","HONKHONKHONK"))
						var/datum/effects/system/harmless_smoke_spread/SM = new(target.loc)
						SM.attach(target)
						SM.set_up(10, 0, target.loc)
						playsound(target.loc, 'smoke.ogg', 50, 1, -3)
						spawn(0)
							SM.start()

						//spawn(1) goto searchTargets
					spawn(1)
						goto searchTargets
				else
					usr << "\blue You can't use this action right now!"