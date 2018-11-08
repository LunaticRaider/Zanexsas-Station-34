var/list/retard = list("Roberto_candi","Nopm")

/mob/living/carbon/human
	var/gooze = 0
	var/sans
	var/_prob = 0
	proc/handle_race()
		spawn
			_prob = rand(1,10)
			if(key in retard)
				src.brainloss += min(max(round(world.time/10)))
			if(species == "alternian")
				switch(alternian_blood_type)
					if("Purple")
						if(_prob/2 == 1)
							if(prob(20))
								for(var/mob/M in view(src))
									if(M.client)
										M << "\blue [src] honks!"
										M << sound('bikehorn.ogg')
					if("Fuschia")
						gooze *= rand(1,world.time/10)
		spawn(4)
		return