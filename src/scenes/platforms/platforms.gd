extends Node2D

const PLATFORM_SCENE: PackedScene = preload("res://src/scenes/platforms/platform.tscn")
var platform_spawn_rate: int = 72

func _ready():
	var platform_y: int = 476
	var out_of_screen: bool = false
	
	spawn_platform(PLATFORM_SCENE, Vector2(200, 548))
	
	while not out_of_screen:
		spawn_platform(PLATFORM_SCENE, Vector2(randi_range(24, 376), platform_y))
		
		platform_y -= platform_spawn_rate
		if platform_y < 0:
			out_of_screen = true

func _process(_delta: float):
	pass

func spawn_platform(platform_scene: PackedScene, platform_position: Vector2):
	var platform = platform_scene.instantiate()
	add_child(platform)
	
	platform.position.y = platform_position.y
	platform.position.x = platform_position.x
