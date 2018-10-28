/mob/living/carbon/human
	var/gooze = 0
	var/mob/living/carbon/target
	Life()
		. = ..()
		if(src.species == "alternian")
			if(src.sign)
				switch(src.sign)
					if("Purple")
						if(prob(20))
							src.searchEnemy()

	New()
		..()
		spawn()
			if(src.alternian_blood_type != "Mutant")
				switch(src.alternian_blood_type)
					if("Gold")
						src.mutations = src.mutations |= 1
					if("Violet")
						src.maxhealth = 500

	proc/searchEnemy()
		var
			nearest_dist = 30
		for(var/mob/i in Mobs)
			if(i != src)
				var/dist = GetDist(src,i)
				if(dist < nearest_dist)
					src.target = i
		if(src.target)
			new /obj/Particle/crosshair(target.loc)
			walk_to(src,target,4,0.5,0)
			src << "\red You fell an unstoppable rage towards [src.target.name]!"
			if(prob(70))
				explosion(src, 0, 0, 7, 0,1)