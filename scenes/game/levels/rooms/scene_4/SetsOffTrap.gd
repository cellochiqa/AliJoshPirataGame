extends StaticBody2D

var trapClosed = false

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _collider = $CollisionShape2D # Collider

var animation: String

var _animation1 = "res://assets/sprites/bear-trap-open.png"
var _animation2 = "res://assets/sprites/bear-trap-closed.png"

func _ready():
	if not animation:
		return

func _on_BearTrap_body_entered(body):
	if not trapClosed and body.is_in_group("player"): 
		#Assuming player character is ina group named "player"
		trapClosed = true
		$Timer.start()
		#Add any other effects or animation here
		
func _on_Timer_timeout():
	#Code to handle what happens when the timer runs out (e.g., character dies)
	queue_free() #Destroy the trap after it closes
