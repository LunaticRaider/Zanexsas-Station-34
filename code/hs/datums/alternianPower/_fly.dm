datum
	alternians
		fly
			var/flySpeedY = 8

			verb/fly()
				set name = "Fly"
				set category = "Alternians"

				if(usr.onFloor == TRUE)
					usr.onFloor = FALSE
					usr << "\blue You start flying"
				else
					usr.onFloor = TRUE
					usr << "\blue You stop flying"

				while(usr.onFloor == FALSE)
					spawn(tick_lag_original) owner.ySpeed = flySpeedY
					sleep(tick_lag_original)