extends CollisionShape2D

var trapClosed = false

func _on_BearTrap_body_entered(body):
	if not trapClosed and body.is_in_group("player"): 
		#Assuming player character is ina group named "player"
		trapClosed = true
		$Timer.start()
		#Add any other effects or animation here
		
func _on_Timer_timeout():
	#Code to handle what happens when the timer runs out (e.g., character dies)
	queue_free() #Destroy the trap after it closes
