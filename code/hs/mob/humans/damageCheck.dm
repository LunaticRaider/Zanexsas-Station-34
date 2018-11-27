/mob/living/carbon/human/proc/damageCheck()
	var/damage = rand(1,6)
	switch(src.alternian_blood_type)
		if("Mutant")
			damage *= rand(0.1,0.5) //base human damage
		if("Rust")
			damage *= rand(1,5)
		if("Bronze")
			damage *= rand(1,5)
		if("Gold")
			damage *= rand(5,10)
		if("Lime")
			damage *= rand(10,15)
		if("Jade")
			damage *= rand(10,15)
		if("Olive")
			damage *= rand(15,20)
		if("Teal")
			damage *= rand(20,25)
		if("Cerulean")
			damage *= rand(20,25)
		if("Indigo")
			damage *= rand(25,30)
		if("Violet")
			damage *= rand(30,35)
		if("Purple")
			damage *= rand(35,40)
		if("Fuchsia")
			damage *= rand(30,35)
	damage = abs(damage)
	return damage *= force
