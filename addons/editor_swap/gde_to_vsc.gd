@tool
extends EditorPlugin

# Exported boolean variable
@export var toggle_feature: bool = false

var button: CheckButton

# This function is called when the plugin is enabled
func _enter_tree():
	# Create a button and add it to the editor
	button = CheckButton.new()
	button.connect("pressed", _on_toggle_pressed)
	add_control_to_container(CONTAINER_TOOLBAR, button)

# This function is called when the plugin is disabled
func _exit_tree():
	# Remove the button from the editor
	remove_control_from_container(CONTAINER_TOOLBAR, button)

func _ready():
	pass

# Called when the button is pressed
func _on_toggle_pressed():
	toggle_feature = !toggle_feature
	_update_editor_settings()

# Update the editor settings based on the toggle
func _update_editor_settings():
	var path = "text_editor/external/use_external_editor"
	var settings = EditorInterface.get_editor_settings()
	settings.set_setting(path,toggle_feature)
	var b : Button
	b = Button.new()
	# Apply additional changes based on the toggle value
	if toggle_feature:
		# Enable some feature
		print("VSC Editor Feature Enabled")
	else:
		# Disable the feature
		print("VSC Editor Feature Disabled")
