extends Node2D
#Variáveis do relógio do celular
var tempo_hora
var tempo_hora_fix
var tempo_minuto
var tempo_minuto_fix

#Variáveis da bateria do celular
var bateria
var bateriaCarregando

#Variáveis do wifi do celular
var conectado

func _ready():
	set_process(true)
	
func _process(delta):
	RelogioCelular()
	BateriaCelular()
	WifiCelular()
	UpdateUI()
	
func UpdateUI():
	$asprLoja/asprLojaMesa.frame = Stats.upMesa
	
func RelogioCelular():
	tempo_hora = OS.get_time()["hour"]
	if tempo_hora <= 9:
		tempo_hora_fix = "0" + tempo_hora
	else:
		tempo_hora_fix = tempo_hora
	tempo_minuto = OS.get_time()["minute"]
	if tempo_minuto <= 9:
		tempo_minuto_fix = "0" + str(tempo_minuto)
	else:
		tempo_minuto_fix = tempo_minuto
	$lblRelogio.text = str(tempo_hora_fix) + ":" + str(tempo_minuto_fix)
	
func BateriaCelular():
	bateria = OS.get_power_percent_left()
	bateriaCarregando = OS.get_power_state()
	if bateriaCarregando <= 1:
		if bateria < 25:
			$asprBateria.frame = 0
		elif bateria < 50:
			$asprBateria.frame = 1
		elif bateria < 75:
			$asprBateria.frame = 2
		else:
			$asprBateria.frame = 3
	else:
		if bateria < 25:
			$asprBateria.frame = 4
		elif bateria < 50:
			$asprBateria.frame = 5
		elif bateria < 75:
			$asprBateria.frame = 6
		else:
			$asprBateria.frame = 7

func WifiCelular():
	if Conectado.wifi:
		$asprWifi.frame = 0
	else:
		$asprWifi.frame = 1

func _on_Voltar_pressed():
	get_tree().change_scene("res://Main.tscn")

func _on_upLojaMesa_pressed():
	if Stats.upMesa <= 3:
		Stats.upMesa += 1


