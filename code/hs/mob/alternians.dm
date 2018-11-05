/mob/living/carbon/human
	New()
		..()
		spawn()
			src << sound('titlesong.ogg',channel=LOBBY_CHANNEL,volume=47, repeat = 1)
			if(src.alternian_blood_type != "Mutant")
				switch(src.alternian_blood_type)
					if("Gold")
						src.mutations = src.mutations |= 1
						src.contents += new  /datum/alternians/goldEnergy (src)
						src.contents += new /datum/alternians/gold/ (src)
						return 1
					if("Cerulean")
						src.contents += new /datum/alternians/cerulean/ (src)
					if("Violet")
						src.maxhealth = rand(1600,2000)
						src.health = src.maxhealth
						return 1
					if("Purple")
						src.maxhealth = rand(1000,1400)
						src.health = src.maxhealth
						src.contents += new /datum/alternians/purple/ (src)
						return 1
					if("Mutant")