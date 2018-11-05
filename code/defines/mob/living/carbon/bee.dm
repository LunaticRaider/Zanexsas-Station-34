/mob/living/carbon/bee
	name = "bee"
	desc = "These look really big. Are they even bees?"
	voice_name = "bee"
	voice_message = "buzzes"
	icon = 'bee.dmi'
	icon_state = "petbee-wings"
	heightSize = 14
	var/l_delay = 0
	var/nice = 0
	var/s = 0
	var/mob/owner
	var/recalling = FALSE
	gender = NEUTER
	New()
		..()
		nice = nice + rand(0,90)
	ProcessHeight()
		nice = nice + 2
		s = 16+(sin(nice)*4)
		heightZ = ((((s) - heightZ)/8) + heightZ)

		ySpeed = 0
		..()
	Life()
		if(world.time < l_delay)
			return
		if(!client)
			if(recalling == TRUE)
				if(owner)
					density = 0
					walk_to(src,owner,1,0.5,0)
					if(in_range(owner,src))
						recalling = FALSE
				else
					recalling = FALSE
			else
				step_rand(src)
				l_delay = world.time+rand(5,7)

	proc/changeRecalling()
		recalling = !recalling