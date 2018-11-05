/mob/living/carbon/human
	var/gooze = 0
	var/sans
	var/_prob = 0
	proc/handle_race()
		_prob = rand(1,10)
		if(src.key == "Roberto_candi")
			src.brainloss += min(max(round(world.time/10)))
		if(src.species == "alternian")
			if(src.sign)
				switch(src.sign)
					if("Purple")
						if(_prob == 1)
							src.say("Honk")