extends CharacterBody2D

var paused

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# UI nodes
@onready var pause_screen =  %Pause_Menu

func _input(event):
	#interact with world         
		#if event.is_action_pressed("ui_interact"):
			#var target = ray_cast.get_collider()
		#if target != null:
			#if target.is_in_group("NPC"):
				# Talk to NPC
			   # target.dialog()
			#return  
			
# ---------------- Pause Menu -------------------------------------------
	 
#show pause menu
					if !pause_screen.visible:
						if event.is_action_pressed("Pause"):
				#pause game     s
							get_tree().paused = true
				#show pause screen popup
							%Pause_Menu.visible = true
				#stops movement processing 
							set_physics_process(false)
				#set pauses state to be true
							paused = true
							#resume game
				
func _on_resume_pressed():
		#hide pause menu
	pause_screen.visible = false
		#set pauses state to be false
	get_tree().paused = false
	paused = false
		#accept movement and input
	set_process_input(true)
	set_physics_process(true)  
	
#func _on_quit_pressed():
#		Global.change_scene("res://Scenes/main_scene.tscn")
#		get_tree().paused = false

#		Global.change_scene("res://Scenes/MainScene.tscn")
#		get_tree().paused = false
#		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
func _process(delta):
	#Movement when direction button pressed
	if Input.is_action_just_pressed("down"):
		$AnimationPlayer.play("WalkDown");
	if Input.is_action_just_pressed("right"):
		$AnimationPlayer.play("WalkRight");
	if Input.is_action_just_pressed("ui_left"):
		$AnimationPlayer.play("WalkLeft");
	if Input.is_action_just_pressed("ui_up"):
		$AnimationPlayer.play("WalkUp");
	
	#Movement when direction button released
	if Input.is_action_just_released("down"):
		$AnimationPlayer.stop()
	if Input.is_action_just_released("right"):
		$AnimationPlayer.stop()
	if Input.is_action_just_released("left"):
		$AnimationPlayer.stop()
	if Input.is_action_just_released("up"):
		$AnimationPlayer.stop()
		
	



