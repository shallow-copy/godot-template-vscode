class_name State extends Resource

@export var count := 0

func increment_count(n: int) -> void:
	self.count += n
	self.changed.emit()
