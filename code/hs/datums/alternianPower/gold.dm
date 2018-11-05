datum
	alternians
		gold
			var/max_dist = 30
			var/max_bees = 3
			var/clock/timer
			var/checking = FALSE
			var/recalled = FALSE
			var/list/bees = list()
			verb/spawnBees()
				set name = "Beemance"
				set category = "Alternian"
				if(max_bees > 0)
					var/mob/living/carbon/bee/beezon = new(owner.loc)
					beezon.owner = owner
					bees[beezon] += beezon
					new /obj/Particle/honeypot(owner.loc)
					max_bees--
				else if(max_bees == 0 || max_bees < 0)
					usr << "\blue You can't spawn more bees!"

			verb/callBees()
				set name = "Command Bees"
				set category = "Alternian"
				if(max_bees >= 3)
					usr << "\blue You have no bees!"
					recalled = FALSE
					return
				for(var/mob/living/carbon/bee/b in world)
					if(b.owner == owner)
						b.changeRecalling()
						if(recalled == FALSE)
							usr << "\blue Recalling bees!"
							recalled = TRUE
						else
							usr << "\blue Stopping bees!"
							recalled = FALSE

			verb/recallBees()
				set name = "Recall Bees"
				set category = "Alternian"
				if(max_bees >= 3)
					usr << "\blue You have no bees!"
					return
				for(var/mob/living/carbon/bee/b in world)
					if(b.owner == owner)
						new /obj/Particle/honeypot(b.loc)
						max_bees++
						del b

			proc/checkBees()
				checking = TRUE
				timer.Start()
				for(var/mob/living/carbon/bee/b in world)
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

		goldEnergy
			parent_type = /obj/machinery/power
			var/sgen = 4000
			New()
				..()
				special_processing += src

			special_process()
				sgen = sgen * rand(1,4)
				add_avail(sgen)
