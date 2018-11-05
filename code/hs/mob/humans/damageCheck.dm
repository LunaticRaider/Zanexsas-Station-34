/mob/living/carbon/human/proc/damageCheck()
	var/damage = rand(1,6)
	switch(src.alternian_blood_type)
		if("Mutant")
			damage = damage * rand(0.1,0.2)
		if("Rust")
			damage = damage * rand(10,15)
		if("Bronze")
			damage = damage * rand(10,15)
		if("Gold")
			damage = damage * rand(10,15)
		if("Lime")
			damage = damage * rand(35,45)
		if("Jade")
			damage = damage * rand(35,45)
		if("Teal")
			damage = damage * rand(35,45)
		if("Cerulean")
			damage = damage * rand(50,65)
		if("Indigo")
			damage = damage * rand(100,150)
		if("Violet")
			damage = damage * rand(500,700)
		if("Purple")
			damage = damage * rand(500,700)
		if("Fuschia")
			damage = damage * rand(700,1000)
	return
