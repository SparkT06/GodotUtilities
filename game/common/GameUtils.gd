extends Node

func get_main():
	return get_tree().get_first_node_in_group("Main");
	
func get_player():
	return get_tree().get_first_node_in_group("Player");

func get_enemies() -> Array:
	return get_tree().get_nodes_in_group("Enemy");
	
func get_node_layer(layer_name: String) -> Node:
	var nodes_in_group = get_tree().get_first_node_in_group(layer_name)
	return nodes_in_group

func remove_parent():
	if self.owner == null: self.owner.queue_free();
