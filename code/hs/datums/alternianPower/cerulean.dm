datum
	alternians
		cerulean
			var/list/possiblePicks = list()


			verb/getRandomThing()
				set name = "Spawn Random Thing"
				set category = "Alternian"
				var/_cooldown = 0

				if(_cooldown > world.time)
					usr << "\blue This actions is in cooldown b8tch!"
					return
				if(prob(30))
					possiblePicks = new
				lumpes:
				for(var/obj/o in world)
					if(possiblePicks.len >= 100) return
					possiblePicks += o
					if(prob(50))
						break
				for(var/mob/m in world)
					if(possiblePicks.len >= 100) return
					possiblePicks += m
					if(prob(50))
						break
				_cooldown = world.time + 40
				if(possiblePicks.len >= 1)
					var/randone = rand(1,50)
					if(prob(50))
						var/obj/o = possiblePicks[randone]
						new o.type(usr.loc)
						usr.say(pick("A [o], oof...","A [o]!"))
						return
					else
						var/mob/o = possiblePicks[randone]
						new o.type(usr.loc)
						usr.say(pick("A [o], oof...","A [o]!"))
						return
				else
					goto lumpes