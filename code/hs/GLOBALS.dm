#define GLOBAL_LIST_EMPTY(X) /datum/GLOB/var/list/X = list()

/datum/GLOB

var/list/objs = list()
var/list/mobs = list()
var/list/logged = list()

var/list/normalBloodTypes = list("Mutant","Rust","Bronze","Gold","Lime","Olive","Jade","Teal","Cerulean","Indigo")
var/list/highBloodTypes = list("Purple","Violet","Fuschia")
var/list/allBloodTypes = list("Mutant","Rust","Bronze","Gold","Lime","Olive","Jade","Teal","Cerulean","Indigo","Purple","Violet","Fuschia")

var/list/highblood_whitelist = null

/*
obj/New()
	..()
	spawn objs[src] += src
*/
mob/New()
	..()
	spawn mobs[src] += src

/*
mob/Login()
	..()
	spawn logged[src] += src
*/