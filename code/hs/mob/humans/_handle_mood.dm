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

datum
	mood
		var/moodAdditive = 0
		var/mob/owner
		var/_icon_state = ""

		proc/adjustMood(nVal)
			moodAdditive = nVal

		proc/addMoodToOwner()
			owner:mood += moodAdditive

		proc/changeIconState(newIconState)
			_icon_state = newIconState || "default"