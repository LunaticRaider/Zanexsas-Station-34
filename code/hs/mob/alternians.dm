/mob/living/carbon/human
	New()
		..()
		spawn()
			src << sound('titlesong.ogg')
			if(src.alternian_blood_type != "Mutant")
				switch(src.alternian_blood_type)
					if("Gold")
						src.mutations = src.mutations |= 1
						src.contents += new  /datum/alternians/goldEnergy (src)
						src.contents += new /datum/alternians/gold/ (src)
						return 1
					if("Violet")
						src.maxhealth = rand(1000,4000)
						src.health = src.maxhealth
						return 1
					if("Purple")
						src.maxhealth = rand(400,1000)
						src.health = src.maxhealth
						src.contents += new /datum/alternians/purple/ (src)
						return 1