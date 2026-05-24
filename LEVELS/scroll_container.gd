extends ScrollContainer

@export var thickness_pixels: int = 14

func _ready() -> void:
	# In Godot 4, it is get_h_scroll_bar() instead of get_h_scrollbar()
	var h_scrollbar: HScrollBar = get_h_scroll_bar()
	
	# Set the core thickness size
	h_scrollbar.add_theme_constant_override("thickness", thickness_pixels)
	
	# Create a visual stylebox so the texture stretches to fill the thickness
	var custom_style = StyleBoxFlat.new()
	custom_style.bg_color = Color("4ca6b4", 0.8) # Matches your UI color
	custom_style.content_margin_top = 4
	custom_style.content_margin_bottom = 4
	custom_style.corner_radius_top_left = 3
	custom_style.corner_radius_top_right = 3
	custom_style.corner_radius_bottom_left = 3
	custom_style.corner_radius_bottom_right = 3
	
	# Apply style overrides to the scrollbar states
	h_scrollbar.add_theme_stylebox_override("grabber", custom_style)
	h_scrollbar.add_theme_stylebox_override("grabber_highlight", custom_style)
	h_scrollbar.add_theme_stylebox_override("grabber_pressed", custom_style)
