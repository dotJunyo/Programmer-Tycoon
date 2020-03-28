extends Node

#Economia
var money = 0
var worker = 0
var worker_price = 5

#UpgradesEconomia
var dinheiroUpgrade = 0
var dinheiroGanho = 1

#Loja
var upgradesTotais = 0
var upMesa = 0
var upCadeira = 0
var upPC = 0
var upQuarto = 0
var upCenario = 0

func _ready():
	set_process(true)
	
func _process(delta):
	upgradesTotais = upCadeira + upMesa + upCenario + upPC + upQuarto
	ganharDinheiro()

func ganharDinheiro():
	dinheiroGanho = 1 + dinheiroUpgrade
	
	if upMesa >= 1: 
		dinheiroUpgrade = upMesa * 2
	
