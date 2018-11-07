var/list/objs = list()
var/list/mobs = list()

obj/New()
	..()
	spawn objs += src

mob/New()
	..()
	spawn mobs += src