extends RayCast3D


func _ready():
	pass 


func _process(_delta):
	if is_colliding():
		print(get_collider())
