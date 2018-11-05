mob/living/carbon/human/proc/damageCheck()
	var/damage = rand(1,6)
	if(src.species != "alternian")
		return damage
	switch(src.alternian_blood_type)
		if("Purple")
			return damage = damage * rand(10,100)