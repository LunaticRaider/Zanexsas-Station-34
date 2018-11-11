/mob/living/carbon/human
	New()
		..()
		spawn()
			//src << sound('titlesong.ogg',channel=LOBBY_CHANNEL,volume=47, repeat = 1) LOL
			if(src.alternian_blood_type != "Mutant")
				switch(src.alternian_blood_type)
					if("Rust")
						src.maxhealth = rand(100,150)
					if("Bronze")
						src.maxhealth = rand(100,150)
					if("Gold")
						src.maxhealth = rand(100,150)
						src.mutations = src.mutations |= 1
						src.contents += new  /datum/alternians/goldEnergy/ (src)
						src.contents += new /datum/alternians/gold/ (src)
						src.contents += new  /datum/alternians/fly/ (src)
					if("Lime")
						src.maxhealth = rand(150,300)
					if("Olive")
						src.maxhealth = rand(150,300)
						src.contents += new /datum/alternians/olive/ (src)
					if("Jade")
						src.maxhealth = rand(150,300)
					if("Cerulean")
						src.maxhealth = rand(300,500)
						src.contents += new /datum/alternians/cerulean/ (src)
						src.contents += new /datum/alternians/telephaty/ (src)
					if("Teal")
						src.maxhealth = rand(300,500)
					if("Indigo")
						src.maxhealth = rand(300,500)
					if("Violet")
						src.maxhealth = rand(500,900)
					if("Purple")
						src.maxhealth = rand(500,1000)
						src.contents += new /datum/alternians/purple/ (src)
						if(prob(10))
							src.nodamage = 1
							src << "\blue You are a miracle!"
					if("Fuchsia")
						src.maxhealth = rand(700,1200)
						src.contents += new /datum/alternians/telephaty/ (src)
						src.contents += new  /datum/alternians/fly/ (src)
					if("Mutant")
						src.maxhealth = rand(25,75) //quero ver os mutante levando ik de toolbox!!!1!!1!
				src.health = src.maxhealth