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

				if(prob(50))
					var/obj/o = pick(objs)
					new o.type (usr.loc)
				else
					var/mob/m = pick(mobs)
					new m.type (usr.loc)

				new /obj/Particle/luck(usr.loc)

				_cooldown = world.time + 50