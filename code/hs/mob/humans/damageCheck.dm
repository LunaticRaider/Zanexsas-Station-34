mob/living/carbon/human/proc/damageCheck()
	var/damage = rand(1,6)
	switch(src.alternian_blood_type)
		if("Mutant")
			damage = damage * rand(0.1,0.2)
		if("Purple")
			damage = damage * rand(10,1000)
	return damage