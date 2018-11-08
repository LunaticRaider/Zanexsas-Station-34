datum
	alternians
		cerulean


			verb/getRandomThing()
				set name = "Spawn Random Thing"
				set category = "Alternian"
				var/_cooldown = 0

				if(_cooldown > world.time)
					usr << "\blue This actions is in cooldown b8tch!"
					return

				var/A = pick(objs)
				for(var/obj/water_overlay/wo in objs)
					A-=wo
				if(istype(A,/obj/water_overlay/) || istype(A,/obj/shading/))
					usr.say("Shiet")
					return
				new A(usr.loc)

				/*if(prob(50))
					for(var/obj/o in objs[rand(1,objs.len)])
						new o.type (src.loc)
				else
					for(var/mob/m in mobs[rand(1,mobs.len)])
						new m.type (src.loc)*/

				new /obj/Particle/luck(usr.loc)

				_cooldown = world.time + 50