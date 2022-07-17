extends Node2D



onready var floppa_normal = load("res://Images/Normal_Shadowed.png")

onready var floppa_pelmeni = load("res://Images/Pelmeni.jpg")
onready var floppa_roar = load("res://Images/Roar.jpg")
onready var floppa_hat = load("res://Images/Hat.jpg")
onready var floppa_toy = load("res://Images/toy.jpg")
onready var floppa_drink = load("res://Images/Drink.jpg")
onready var floppa_bowl = load("res://Images/Bowl.jpg")
onready var floppa_minecart = load("res://Images/Minecart.png")
onready var floppa_tasty = load("res://Images/Tasty.jpg")
onready var floppa_bath = load("res://Images/Bath.jpg")
onready var floppa_doshik = load("res://Images/Doshirak.jpg")
onready var floppa_cook = load("res://Images/Cook.jpg")
onready var floppa_angry = load("res://Images/Angry.jpeg")

onready var FloppaButton = load("res://FloppaButton.tscn")

onready var PressedFloppaArr = [floppa_angry,floppa_cook,floppa_doshik,floppa_bath,floppa_tasty,floppa_bowl,floppa_minecart,floppa_drink,floppa_roar,floppa_pelmeni,floppa_hat,floppa_toy]
onready var ImgAmount = PressedFloppaArr.size()

onready var array1 = range(ImgAmount)
onready var array2 = range(ImgAmount)

var time = 0

func _ready():
	array1+=array2
	randomize()
	array1.shuffle()

	for i in range(ImgAmount*2+1):		
		var FloppaInstance = FloppaButton.instance()
		FloppaInstance.set_normal_texture(floppa_normal)
		FloppaInstance.connect("get", self, "_on_get")
		if i != 12:
			
			if i > 12:
				FloppaInstance.set_pressed_texture(PressedFloppaArr[array1[i-1]])
			else:
				FloppaInstance.set_pressed_texture(PressedFloppaArr[array1[i]])
		else:
			FloppaInstance.set_pressed_texture(floppa_normal)
		$GridContainer.add_child(FloppaInstance)
		
	
	
func _on_get() -> void:
	$MatchSound.play()
	var pressed_texture = $GridContainer.get_child(GameData.last_index).get_pressed_texture()
	if GameData.last_name == GameData.current_name:
		$GridContainer.get_child(GameData.last_index).set_normal_texture(pressed_texture) 
		$GridContainer.get_child(GameData.current_index).set_normal_texture(pressed_texture) 
		GameData.score+=1
		if GameData.score>11:
			
			$Timer.stop()
			$CanvasLayer/Panel/BestTime.text = "Best Time:\n" + str(time)



func _on_Timer_timeout():
	time+=1
	$CanvasLayer/Panel/CurrentTime.text = "Time:\n" + str(time)
