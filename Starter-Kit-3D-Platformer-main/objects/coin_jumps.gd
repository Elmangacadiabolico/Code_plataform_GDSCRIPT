extends Area3D

var time := 0.0
var grabbed := false

# Function to collect the special coin
func _on_body_entered(body):"script"
	if body.has_method("collect_special_coin") and !grabbed:
		body.collect_special_coin()
		Audio.play("res://sounds/coin.ogg") # Play sound
		$Mesh.queue_free() # Make invisible
		$Particles.emitting = false # Stop emitting stars
		grabbed = true

# Rotating, animating up and down
func _process(delta):
	rotate_y(2 * delta) # Rotation
	position.y += (cos(time * 5) * 1) * delta # Sine movement
	time += delta
