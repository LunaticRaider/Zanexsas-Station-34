atom/proc/Highlight(apply)
	if(apply)
		filters += filter(type="outline", size=1, color=rgb(255,0,0))
	else
		filters -= locate(filter(type="outline", size=1, color=rgb(255,0,0)))