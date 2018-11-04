datum
	alternians
		gold
			var/max_dist = 30
			var/max_bees = 3
			var/clock/timer = new
			var/checking = FALSE
			var/list/bees = list()
			verb/spawnBees()
				set name = "Beemance"
				set category = "Alternian"
				if(max_bees > 0)
					var/mob/living/carbon/bee/beezon = new(owner.loc)
					beezon.owner = owner
					bees[beezon] += beezon
					max_bees--
				else if(max_bees == 0 || max_bees < 0)
					usr << "\blue You can't spawn more bees!"

			verb/callBees()
				set name = "Call Bees"
				set category = "Alternian"
				if(max_bees >= 3)
					usr << "\blue You have no bees!"
					return
				for(var/mob/living/carbon/bee/b in world)
					if(b.owner == owner)
						b.density = 0
						walk_to(b,owner,1,0.5,0)
						if(get_dist(owner,b)<= 1)
							b.density = 1
							break

			verb/recallBees()
				set name = "Recall Bees"
				set category = "Alternian"
				if(max_bees >= 3)
					usr << "\blue You have no bees!"
					return
				for(var/mob/living/carbon/bee/b in world)
					if(b.owner == owner)
						max_bees++
						del b

			proc/checkBees()
				checking = TRUE
				world << "comdigo"
				timer.Start()
				for(var/mob/living/carbon/bee/b in world)
					world << "[owner.name] kkk"
					if(timer.seconds > 20)
						if(b.owner == owner)
							bees[b] -= b
							max_bees++
							del b
					if(max_bees == 3)
						checking = FALSE
						timer.Reset()
						timer.Stop()
						break
