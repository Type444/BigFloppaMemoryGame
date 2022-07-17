extends TextureButton

signal get

onready var TextureName
onready var TextureIndex


func _ready():
	TextureName = self.get_pressed_texture().get_path()
	TextureIndex = get_index()




func _on_FloppaButton_pressed():
	GameData.current_name = TextureName
	GameData.current_index = TextureIndex
	if ((TextureName == GameData.last_name)&&(TextureIndex!=GameData.last_index)):
		emit_signal("get")
	GameData.last_name = TextureName
	GameData.last_index = TextureIndex
	
