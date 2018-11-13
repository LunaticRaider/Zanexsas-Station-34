/mob/enemy/hs/rustFollower
	name = "Rust Follower"
	desc = "RUN BOI"
	icon_state = "droid"
	density = 1
	maxhealth = 10
	heightSize = 32
	var/mob/living/carbon/human/owner
	var/acting = FALSE

	New(var/mob/living/carbon/human/_owner)
		. = ..()
		owner = _owner
		return .
	EnemyProcess()
		if(!owner)
			spawn()
				step_rand(src)
		else
			if(!acting)
				if(prob(50))
					findTargets()
		src.alpha -= 5
		if(src.alpha <= 0)
			new /obj/Particle/skull (src.loc)
			del src
		sleep(tick_lag_original)
	proc
		speakAss(ass)
			src << text("\blue You said [].", ass)
			for(var/mob/O in oviewers())
				if ((O.client && !( O.blinded )))
					O << text("\red [] says \"[]\".", usr,ass)

		Shoot()
			acting = TRUE
			speakAss("Shooting")
			for(var/i in 1 to 5)
				var/obj/projectile/hs/spine/G = new(locate(x,y,z))
				G.owner = owner ? owner : src
				G.X_SPEED = cos(frm_counter*30)*5
				G.Y_SPEED = sin(frm_counter*30)*5
				sleep(tick_lag_original)
			acting = FALSE

		findTargets()
			acting = TRUE
			var
				nearest_dist = 5
				mob/nearest_mob = null
			speakAss("Searching targets")
			for(var/mob/i in Mobs)
				sleep(tick_lag_original)
				if(i.type != type && i != owner && i:alternian_blood_type != "Rust")
					var/dist = GetDist(src,i)
					if(dist < nearest_dist)
						nearest_mob = i
						nearest_dist = dist
						break
			if(nearest_mob)
				speakAss("Target found")
				new /obj/Particle/skull (nearest_mob.loc)
				glide_size = 32 / 0.5 * tick_lag_original
				walk_to(src,nearest_mob,4,0.5,0)
				if(prob(50))
					Shoot()
			acting = FALSE