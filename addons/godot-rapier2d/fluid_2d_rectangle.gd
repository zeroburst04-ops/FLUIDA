@tool
extends Fluid2D

@export var height := 10:
	set(value):
		if height != value:
			height = value
			points = create_rectangle_points(width, height)
			update_uv_mapping() # Update UVs whenever points change
	get:
		return height

@export var width := 10:
	set(value):
		if width != value:
			width = value
			points = create_rectangle_points(width, height)
			update_uv_mapping() # Update UVs whenever points change
	get:
		return width

# New function to generate UV coordinates for your custom points grid
func update_uv_mapping() -> void:
	if points.size() == 0:
		return
		
	var new_uvs = PackedVector2Array()
	
	# Loop through all your procedural points to calculate their relative 0.0 - 1.0 position
	for p in points:
		var u = clamp(p.x / float(width), 0.0, 1.0)
		var v = clamp(p.y / float(height), 0.0, 1.0)
		new_uvs.append(Vector2(u, v))
		
	# Assign the calculated array back to the node's built-in UV property
	# Note: Depending on your custom Fluid2D base class, this property might be named 'uv' or 'uvs'
	if "uv" in self:
		self.uv = new_uvs
	elif "uvs" in self:
		self.uvs = new_uvs
