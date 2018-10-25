/mob/living/carbon/proc/toggle_jogar_mode()
	if (src.in_jogar_mode)
		jogar_mode_off()
	else
		jogar_mode_on()

/mob/living/carbon/proc/jogar_mode_off()
	src.in_jogar_mode = 0
	src.jogar_icon.icon_state = "act_jogar_off"

/mob/living/carbon/proc/jogar_mode_on()
	src.in_jogar_mode = 1
	src.jogar_icon.icon_state = "act_jogar_on"

/mob/living/carbon/proc/jogar_item(atom/target)
	src.jogar_mode_off()
	if(usr.stat)
		return
	if(target.type == /obj/screen) return

	var/atom/movable/item = src.equipped()

	if(!item) return

	u_equip(item)
	if(src.client)
		src.client.screen -= item
	item.loc = src.loc

	if (istype(item, /obj/item/weapon/grab))
		item = item:jogar() //jogar the person instead of the grab

	if(istype(item, /obj/item))
		item:dropped(src) // let it know it's been dropped

	//actually jogar it!
	if (item)
		item.layer = initial(item.layer)
		src.visible_message("\red [src] has jogarn [item].")

		if(istype(src.loc, /turf/space)) //they're in space, move em one space in the opposite direction
			src.inertia_dir = get_dir(target, src)
			step(src, inertia_dir)
		item.jogar_at(target, item.jogar_range, item.jogar_speed)



/proc/get_cardinal_step_away(atom/start, atom/finish) //returns the position of a step from start away from finish, in one of the cardinal directions
	//returns only NORTH, SOUTH, EAST, or WEST
	var/dx = finish.x - start.x
	var/dy = finish.y - start.y
	if(abs(dy) > abs (dx)) //slope is above 1:1 (move horizontally in a tie)
		if(dy > 0)
			return get_step(start, SOUTH)
		else
			return get_step(start, NORTH)
	else
		if(dx > 0)
			return get_step(start, WEST)
		else
			return get_step(start, EAST)

/atom/movable/proc/hit_check()
	if(src.jogaring)
		for(var/atom/A in get_turf(src))
			if(A == src) continue
			if(istype(A,/mob/living))
				if(A:lying) continue
				src.jogar_impact(A)
				src.jogaring = 0
			if(isobj(A))
				if(A.density)				// **TODO: Better behaviour for windows
											// which are dense, but shouldn't always stop movement
					src.jogar_impact(A)
					src.jogaring = 0

/atom/proc/jogar_impact(atom/hit_atom)
	if(ismob(hit_atom))
		hit_atom.visible_message("\red [hit_atom] has been hit by [src].")
		var/mob/M = hit_atom
		if(src.vars.Find("jogarforce"))
			M.bruteloss += src:jogarforce

	else if(isobj(hit_atom))
		var/obj/O = hit_atom
		if(!O.anchored) step(O, src.dir)
		O.hitby(src)

	else if(isturf(hit_atom))
		var/turf/T = hit_atom
		if(T.density)
			spawn(2) step(src, turn(src.dir, 180))
			if(ismob(src) && hasvar(src,"bruteloss"))
				src:bruteloss += 20

/atom/movable/Bump(atom/O)
	if(src.jogaring)
		src.jogar_impact(O)
		src.jogaring = 0
	..()

/atom/movable/proc/jogar_at(atom/target, range, speed)
	//use a modified version of Bresenham's algorithm to get from the atom's current position to that of the target
	src.jogaring = 1

	var/dist_x = abs(target.x - src.x)
	var/dist_y = abs(target.y - src.y)

	var/dx
	if (target.x > src.x)
		dx = EAST
	else
		dx = WEST

	var/dy
	if (target.y > src.y)
		dy = NORTH
	else
		dy = SOUTH
	var/dist_travelled = 0
	var/dist_since_sleep = 0
	if(dist_x > dist_y)
		var/error = dist_x/2 - dist_y
		while (((((src.x < target.x && dx == EAST) || (src.x > target.x && dx == WEST)) && dist_travelled < range) || istype(src.loc, /turf/space)) && src.jogaring && istype(src.loc, /turf))
			// only stop when we've gone the whole distance (or max jogar range) and are on a non-space tile, or hit something, or hit the end of the map, or someone picks it up
			if(error < 0)
				var/atom/step = get_step(src, dy)
				if(!step) // going off the edge of the map makes get_step return null, don't let things go off the edge
					break
				src.Move(step)
				hit_check()
				error += dist_x
				dist_travelled++
				dist_since_sleep++
				if(dist_since_sleep >= speed)
					dist_since_sleep = 0
					sleep(1)
			else
				var/atom/step = get_step(src, dx)
				if(!step) // going off the edge of the map makes get_step return null, don't let things go off the edge
					break
				src.Move(step)
				hit_check()
				error -= dist_y
				dist_travelled++
				dist_since_sleep++
				if(dist_since_sleep >= speed)
					dist_since_sleep = 0
					sleep(1)
	else
		var/error = dist_y/2 - dist_x
		while (((((src.y < target.y && dy == NORTH) || (src.y > target.y && dy == SOUTH)) && dist_travelled < range) || istype(src.loc, /turf/space)) && src.jogaring && istype(src.loc, /turf))
			// only stop when we've gone the whole distance (or max jogar range) and are on a non-space tile, or hit something, or hit the end of the map, or someone picks it up
			if(error < 0)
				var/atom/step = get_step(src, dx)
				if(!step) // going off the edge of the map makes get_step return null, don't let things go off the edge
					break
				src.Move(step)
				hit_check()
				error += dist_y
				dist_travelled++
				dist_since_sleep++
				if(dist_since_sleep >= speed)
					dist_since_sleep = 0
					sleep(1)
			else
				var/atom/step = get_step(src, dy)
				if(!step) // going off the edge of the map makes get_step return null, don't let things go off the edge
					break
				src.Move(step)
				hit_check()
				error -= dist_x
				dist_travelled++
				dist_since_sleep++
				if(dist_since_sleep >= speed)
					dist_since_sleep = 0
					sleep(1)

	//done jogaring, either because it hit something or it finished moving
	src.jogaring = 0
	if(isobj(src)) src:jogar_impact(get_turf(src))


