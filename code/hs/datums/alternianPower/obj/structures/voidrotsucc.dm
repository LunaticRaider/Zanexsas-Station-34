/obj/stool/chair/voidrot
	name = "Energy Succ"
	icon = 'hs_structures.dmi'
	icon_state = "voidsucc"
	var/spawned_energy = FALSE

/obj/stool/chair/voidrot/New()
	..()
	special_processing += src

/obj/stool/voidrot/MouseDrop_T(mob/M as mob, mob/user as mob)
	if (!ticker)
		user << "You can't buckle anyone in before the game starts."
	if ((!( istype(M, /mob) ) || get_dist(src, user) > 1 || M.loc != src.loc || user.restrained() || usr.stat))
		return
	if (M == usr)
		for(var/mob/O in viewers(user, null))
			if ((O.client && !( O.blinded )))
				O << text("\blue [] buckles in!", M)

	else
		for(var/mob/O in viewers(user, null))
			if ((O.client && !( O.blinded )))
				O << text("\blue [] is buckled in by [].", M, user)
	icon_state = "voidsucc1"
	M.lying = 1
	M.anchored = 1
	M.buckled = src
	M.loc = src.loc
	src.add_fingerprint(user)
	return

/obj/stool/voidrot/attack_hand(mob/user as mob)
	for(var/mob/M in src.loc)
		if (M.buckled)
			if (M != user)
				for(var/mob/O in viewers(user, null))
					if ((O.client && !( O.blinded )))
						O << text("\blue [] is unbuckled by [].", M, user)
			else
				for(var/mob/O in viewers(user, null))
					if ((O.client && !( O.blinded )))
						O << text("\blue [] unbuckles.", M)
			icon_state = "voidsucc"
			M.anchored = 0
			M.buckled = null
			src.add_fingerprint(user)
	return

/obj/stool/chair/voidrot/Del()

	special_processing -= src
	..()
	return

/obj/stool/chair/voidrot/special_process()
	for(var/mob/M in src.loc)
		if(M.buckled)
			if(istype(M,/mob/living/carbon/human/))
				var/mob/living/carbon/human/H = M
				if(H.alternian_blood_type != "Gold")
					M.anchored = 0
					M.buckled = null
					icon_state = "voidsucc"
					for(var/mob/O in view(src))
						if ((O.client && !( O.blinded )))
							O << text("\blue []'s blood is incompatible with the void succ.", M)
					for(var/datum/alternians/goldEnergy/GE in src.loc)
						del GE
				else
					icon_state = "voidsucc1"
					if(spawned_energy == FALSE)
						spawned_energy = TRUE
						var/datum/alternians/goldEnergy/E = new(src.loc)
						E.density = 0

	if(prob(20))
		animate(src,
				transform = matrix(2, MATRIX_ROTATE),
				time = 2, loop = -1,
				easing = SINE_EASING)
		animate(src,
				transform = matrix(-2, MATRIX_ROTATE),
				time = 2,
				easing = SINE_EASING)


/obj/stool/chair/voidrot/attackby(obj/item/weapon/W as obj, mob/user as mob)

	if (istype(W, /obj/item/weapon/wrench))
		var/obj/stool/chair/C = new /obj/stool/chair( src.loc )
		C.loc = src.loc
		del(src)
		return
	return