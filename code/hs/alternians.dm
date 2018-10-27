/mob/living/carbon/human
	var/gooze = 0
	Life()
		..()
		if(src.species == "alternian")
			if(src.sign)
				switch(src.sign)
					if("Rust")
						gooze++

	New()
		..()
		spawn()
			if(src.alternian_blood_type != "Mutant")
				switch(src.alternian_blood_type)
					if("Gold")
						src.mutations = src.mutations |= 1