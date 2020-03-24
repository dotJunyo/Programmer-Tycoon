extends Node2D
#Variáveis do relógio do celular
var tempo_hora
var tempo_minuto

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
	
func RelogioCelular():
	tempo_hora = OS.get_time()["hour"]
	tempo_minuto = OS.get_time()["minute"]
	$lblRelogio.text = str(tempo_hora) + ":" + str(tempo_minuto)
	
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

