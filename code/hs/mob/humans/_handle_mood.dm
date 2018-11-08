/mob/living/carbon/human
	proc/handle_mood()
		spawn
			if(health <= maxhealth / 2)
				mood = 4
				moodMessage = "Fuck this"
			if(health <= maxhealth / 2.5)
				mood = 2
				moodMessage = "kil >>>>>"
			if(health >= maxhealth / 2)
				mood = 9
				moodMessage = "ok mula"
		spawn(4)
		return