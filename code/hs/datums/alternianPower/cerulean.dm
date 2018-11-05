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
					possiblePicks = list()
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
					possiblePicks[randone] = new
					usr.say(pick("A [possiblePicks[randone]], oof...","A [possiblePicks[randone]]!","Lucky!","ok?","OOOOOF"))
				else
					goto lumpes