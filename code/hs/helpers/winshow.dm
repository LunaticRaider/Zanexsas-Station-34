proc/switchWindowOn(name)
	winshow(usr, name, winget(usr, name, "is-visible") != "true")