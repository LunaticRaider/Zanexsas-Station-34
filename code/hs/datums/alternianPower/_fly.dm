datum
	alternians
		fly
			var/flySpeedY = 8
			var/flying = FALSE

			verb/fly()
				set name = "Fly"
				set category = "Alternian"

				if(flying == TRUE)
					flying = FALSE
					usr << "\blue You start flying"
				else
					flying = TRUE
					usr << "\blue You stop flying"

				while(flying)
					spawn(tick_lag_original)
						owner.ySpeed = flySpeedY
						usr.onFloor = FALSE
						flying = TRUE
					sleep(tick_lag_original)