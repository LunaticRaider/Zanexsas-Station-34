var/list/objs = list()
var/list/mobs = list()
var/list/logged = list()

obj/New()
	..()
	spawn objs[src] += src

mob/New()
	..()
	spawn mobs[src] += src

mob/Login()
	..()
	spawn logged[src] += src