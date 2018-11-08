/mob/living/carbon/human
	New()
		..()
		spawn()
			//src << sound('titlesong.ogg',channel=LOBBY_CHANNEL,volume=47, repeat = 1) LOL
			if(src.alternian_blood_type != "Mutant")
				switch(src.alternian_blood_type)
					if("Gold")
						src.mutations = src.mutations |= 1
						src.contents += new  /datum/alternians/goldEnergy (src)
						src.contents += new /datum/alternians/gold/ (src)
						return 1
					if("Olive")
						src.contents += new /datum/alternians/olive/ (src)
						return 1
					if("Cerulean")
						src.contents += new /datum/alternians/cerulean/ (src)
					if("Violet")
						src.maxhealth = rand(2000,4000)
						src.health = src.maxhealth
						return 1
					if("Purple")
						src.maxhealth = rand(1000,1400)
						src.health = src.maxhealth
						src.contents += new /datum/alternians/purple/ (src)
						if(prob(10))
							src.nodamage = 1
							src << "\blue You are a miracle!"
						return 1
					if("Fuschia")
						src.maxhealth = rand(4000,4900)
					if("Mutant")
						return 1