extends Node2D

onready var obj = get_node('/root/Main/Label')

func _ready():
	set_process(true)
	

func _process(delta):
	UpdateUI()

func UpdateUI():
	Upgrades()
	DinheiroAtualizar()
	pass

func _on_Main_pressed():
	Stats.money += Stats.dinheiroGanho
func _on_Loja_pressed():
	get_tree().change_scene("res://Loja.tscn")
func _on_Contratar_pressed():
	print("Contratar")
func _on_Desenvolver_pressed():
	print("Desenvolver")
func DinheiroAtualizar():
	$Label.text = "R$ " + str(Stats.money)
	pass

func Upgrades():
	$Mesa.frame = Stats.upMesa
	$Cadeira.frame = Stats.upCadeira
	$Quarto.frame = Stats.upCenario
	
