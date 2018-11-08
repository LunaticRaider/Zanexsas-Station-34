#define GLOBAL_LIST_EMPTY(X) /datum/GLOB/var/list/X = list()

/datum/GLOB


var/list/normalBloodTypes = list("Mutant","Rust","Bronze","Gold","Lime","Olive","Jade","Teal","Cerulean","Indigo")
var/list/highBloodTypes = list("Purple","Violet","Fuschia")
var/list/allBloodTypes = list("Mutant","Rust","Bronze","Gold","Lime","Olive","Jade","Teal","Cerulean","Indigo","Purple","Violet","Fuschia")

var/list/highblood_whitelist = null

var/list/objs = list()

obj/New()
	..()
	spawn objs += src