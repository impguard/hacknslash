extends CharacterBody2D

@export var speed = 48

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta):	
	handle_movement()
	handle_animation()
	move_and_slide()
	
func handle_movement():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
func handle_animation():
	if velocity.length() == 0:
		sprite.stop()
		return
		
	if !sprite.is_playing():
		sprite.frame = 1
	
	if velocity.x < 0:
		sprite.play("walk_left")
	elif velocity.x > 0:
		sprite.play("walk_right")
	elif velocity.y < 0:
		sprite.play("walk_up")
	elif velocity.y > 0:
		sprite.play("walk_down")
