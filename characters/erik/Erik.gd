extends Area2D

signal hit

export var speed = 250 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite.play()

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("attack"):
		$AnimatedSprite.animation = "attack"

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.animation = "run"
	else:
		$AnimatedSprite.animation = "idle"
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x - 8)
	position.y = clamp(position.y, 0, screen_size.y - 8)
	
	if velocity.x != 0:
		$AnimatedSprite.flip_h = velocity.x < 0

func _on_Erik_body_entered(body):
	hide() # Player disappears after being hit.
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
