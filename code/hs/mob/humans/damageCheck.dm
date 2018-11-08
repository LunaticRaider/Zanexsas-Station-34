/mob/living/carbon/human/proc/damageCheck()
	var/damage = rand(1,6)
	switch(src.alternian_blood_type)
		if("Mutant")
			damage *= rand(0.1,0.5) //base human damage
		if("Rust")
			damage *= rand(1,10)
		if("Bronze")
			damage *= rand(5,15)
		if("Gold")
			damage *= rand(5,15)
		if("Lime")
			damage *= rand(20,40)
		if("Jade")
			damage *= rand(20,40)
		if("Olive")
			damage *= rand(20,40)
		if("Teal")
			damage *= rand(40,60)
		if("Cerulean")
			damage *= rand(40,60)
		if("Indigo")
			damage *= rand(40,60)
		if("Violet")
			damage *= rand(150,300)
		if("Purple")
			damage *= rand(150,300)
		if("Fuschia")
			damage *= rand(200,400)
	return damage
