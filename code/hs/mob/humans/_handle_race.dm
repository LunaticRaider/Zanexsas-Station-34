/mob/living/carbon/human
	var/gooze = 0
	var/sans
	var/_prob = 0
	proc/handle_race()
		_prob = rand(1,10)
		if(key == "Roberto_candi")
			src.brainloss += min(max(round(world.time/10)))
		if(species == "alternian")
			switch(alternian_blood_type)
				if("Purple")
					if(_prob/2 == 1)
						if(prob(50))
							for(var/mob/M in view(src))
								if(M.client)
									M << "\blue [src] honks!"
									M << sound('bikehorn.ogg')
		spawn(4)
		return