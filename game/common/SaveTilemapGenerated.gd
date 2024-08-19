@tool
extends Node2D

# Assume `tilemap` is your generated TileMap node
var generation_count = 0
@onready var tile_map_path: TileMap = $TileMap
@export var generate : bool :
	set(value):
		generate = value
		generate_tilemap()

func generate_tilemap():
	if generate:
	# Your procedural generation logic here
		var _tilemap = tile_map_path
		# Add the TileMap to the scene
		#add_child(_tilemap)
		# Save the TileMap as a separate scene
		save_tilemap_as_scene(_tilemap)

func save_tilemap_as_scene(tilemap: TileMap):
	# Create a new scene with the TileMap as the root
	var scene = PackedScene.new()
	scene.pack(tilemap)
	var g = Time.get_datetime_dict_from_system()
	var timestamp = str(g.year) + "-" + str(g.month) + "-" + str(g.day) + "_" + str(g.hour) + "-" + str(g.minute) + "-" + str(g.second)
	print(g)
	# Define a path to save the scene
	var scene_path = "res://generated_tilemaps/tilemap_" + timestamp  + ".tscn"
	
	# Save the scene to the specified path
	var error = ResourceSaver.save(scene, scene_path)
	print("it came here")
	if error == OK:
		print("TileMap saved as: " + scene_path)
	else:
		print("Failed to save TileMap: " + str(error))
