class_name Reconciler

var root: Node
var current_index := 0
var _cache: Dictionary[String, Variant]


static func create(root_: Node) -> Reconciler:
	var r := Reconciler.new()
	r.root = root_
	return r


func node(type: Object, key: String) -> Variant:
	var child := _get_or_create(key, type)
	root.move_child(child, current_index)
	current_index += 1
	return child


func flush() -> void:
	var children := root.get_children()
	var delta := children.size() - current_index
	if delta > 0:
		for i in delta:
			var excess_node := children[current_index + i]
			root.remove_child(excess_node)
			_cache.erase(excess_node.name)
			excess_node.queue_free()
	current_index = 0


func _get_or_create(key: String, type: Object) -> Node:
	var cached: Node = _cache.get(key)
	if cached: return cached
	@warning_ignore("unsafe_method_access")
	var child: Node = type.instantiate() if type is PackedScene else type.new()
	_cache[key] = child
	child.name = key
	root.add_child(child)
	return child
