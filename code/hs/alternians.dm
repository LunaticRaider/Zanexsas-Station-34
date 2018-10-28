/mob/living/carbon/human
	var/gooze = 0
	var/mob/living/carbon/target
	Life()
		..()
		if(src.species == "alternian")
			if(src.sign)
				switch(src.sign)
					if("Purple")
						if(prob(20))
							spawn(20)
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
			mob/nearest_mob = null
		for(var/mob/i in Mobs)
			if(istype(i,/mob/living/carbon/) && i != src)
				var/dist = GetDist(src,i)
				if(dist < nearest_dist)
					target = i
		if(nearest_mob)
			new /obj/Particle/crosshair(nearest_mob.loc)
			walk_to(src,nearest_mob,4,0.5,0)
			src << "\red You fell an unstoppable rage towards [nearest_mob.name]!"