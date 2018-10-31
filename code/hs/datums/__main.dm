datum
	alternians
		parent_type = /obj
		var/cooldown = 0
		var/allowActions = 0

		proc/Cooldown()
			while(cooldown > world.timeofday)  //Se o cooldown for maior que o tempo atual
				sleep(1) //Esperar o tempo atual superar o cooldown
			allowActions = 0   //Flag