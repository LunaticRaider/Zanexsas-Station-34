/mob/living/carbon/human
	var/gooze = 0
	Life()
		..()
		spawn()
			if(src.species == "alternian")
				if(src.sign)
					switch(src.sign)
						if("Purple")
							if(prob(20))
								src.say("Honk")

	New()
		..()
		spawn()
			if(src.alternian_blood_type != "Mutant")
				switch(src.alternian_blood_type)
					if("Gold")
						src.mutations = src.mutations |= 1
					if("Violet")
						src.maxhealth = 1000
					if("Purple")
						src.contents += new /datum/alternians/purple/
						return 1