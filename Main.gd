extends Node2D

var money = 10000
var worker = 0
var worker_price = 5

func UpdateUI():
	print("money")

func _on_mainscreen_pressed():
	money += 1
	UpdateUI()
	print("Clicou")


func _on_Main_pressed():
	money += 1
	print("Money!")


func _on_Loja_pressed():
	get_tree().change_scene("res://Loja.tscn")
	


func _on_Contratar_pressed():
	print("Contratar")


func _on_Desenvolver_pressed():
	print("Desenvolver")
