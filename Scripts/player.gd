extends KinematicBody2D
export var vel = 150
onready var chave = get_parent().get_node("chave")
onready var porta = get_parent().get_node("porta")
var near_key = false
var key = false
var iswithkey = false
var near_door = false
var door = false

func _process(delta):
	var dir = Vector2()
	if Input.is_action_pressed("ui_down"):
		dir.y = vel 
	if Input.is_action_pressed("ui_up"):
		dir.y = -vel 
	if Input.is_action_pressed("ui_left"):
		dir.x = -vel 
	if Input.is_action_pressed("ui_right"):
		dir.x = vel
	move_and_slide(dir)
	
#func _physics_process(delta):
func _input(event):
	if near_key and key and Input.is_key_pressed(KEY_E):
		chave.queue_free()
		near_key = false
		iswithkey = true
		near_door
		
	if iswithkey and door and near_door and Input.is_key_pressed(KEY_E):
		porta.queue_free()
		near_door = false
		door = false
	
	pass
func _ready():
	pass 


func _on_Area2D_body_entered(body):
	if body.name == "chave":
		near_key = true
		print('chave')
		key = true

	if body.name == "porta":
		print('porta')
		near_door = true
		door = true
	if body.name == "porta2":
		queue_free()
	pass
