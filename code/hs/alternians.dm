/mob/living/carbon/human
	var/gooze = 0
	Life()
		..()
		if(src.species == "alternian")
			gooze+=1