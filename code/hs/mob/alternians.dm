/mob/living/carbon/human
	var/gooze = 0
	Life()
		..()
		spawn
			if(src.key == "Roberto_candi")
				src.brainloss += min(max(round(world.time/10)))
			if(src.species == "alternian")
				if(src.sign)
					switch(src.sign)
						if("Purple")
							if(prob(20))
								say("Honk")

	New()
		..()
		spawn()
			if(src.alternian_blood_type != "Mutant")
				switch(src.alternian_blood_type)
					if("Gold")
						src.mutations = src.mutations |= 1
						src.contents += new  /datum/alternians/goldEnergy (src)
						src.contents += new /datum/alternians/gold/ (src)
						return 1
					if("Violet")
						src.maxhealth = 1000
						return 1
					if("Purple")
						src.contents += new /datum/alternians/purple/ (src)
						return 1