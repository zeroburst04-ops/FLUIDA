extends Control

@onready var Level_Data : = %Pipe_Data
@onready var TS_Knee : = preload("res://Pipes/TS_Knee/ts_knee.tscn")
@onready var TS_Socket : = preload("res://Pipes/TS_Socket/ts_socket.tscn")
@onready var TS_Tee : = preload("res://Pipes/TS_Tee/ts_tee.tscn")

@onready var Pipes : = %Pipes

func _process(delta: float) -> void:
	%TS_Knee_Count.text = str(Level_Data.pipe_inventory["TS_Knee"]) + "x"
	%TS_Socket_Count.text = str(Level_Data.pipe_inventory["TS_Socket"]) + "x"
	%TS_Socket_Reducer_Count.text = str(Level_Data.pipe_inventory["TS_Socket_Reducer"]) + "x"
	%TS_Tee_Count.text = str(Level_Data.pipe_inventory["TS_Tee"]) + "x"

func _on_ts_knee_button_button_down() -> void:
	if Level_Data.pipe_inventory["TS_Knee"] > 0:
		Level_Data.pipe_inventory["TS_Knee"] -= 1
		var i = TS_Knee.instantiate()
		i.global_position = get_global_mouse_position()
		Pipes.add_child(i)

func _on_ts_socket_button_button_down() -> void:
	if Level_Data.pipe_inventory["TS_Socket"] > 0:
		Level_Data.pipe_inventory["TS_Socket"] -= 1
		var i = TS_Socket.instantiate()
		i.CurrentState = i.States.Normal
		i.global_position = get_global_mouse_position()
		Pipes.add_child(i)

func _on_ts_socket_reducer_button_button_down() -> void:
	if Level_Data.pipe_inventory["TS_Socket_Reducer"] > 0:
		Level_Data.pipe_inventory["TS_Socket_Reducer"] -= 1
		print("Print")
		var i = TS_Socket.instantiate()
		i.CurrentState = i.States.Reducer
		i.global_position = get_global_mouse_position()
		Pipes.add_child(i)

func _on_ts_tee_button_down() -> void:
	if Level_Data.pipe_inventory["TS_Tee"] > 0:
		Level_Data.pipe_inventory["TS_Tee"] -= 1
		var i = TS_Tee.instantiate()
		i.global_position = get_global_mouse_position()
		Pipes.add_child(i)
