extends Panel

func _ready():
	UpdateUI()

	var timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "Workers")
	add_child(timer)
	timer.start()

func UpdateUI():
	$lblMoney.text = "R$ " + str(Stats.money)
	$lblWorkers.text = str(Stats.worker)

func _on_btnWorker_pressed():
	if Stats.money >= Stats.worker_price:
		Stats.money -= Stats.worker_price
		Stats.worker += 1
		Stats.worker_price += round(Stats.worker/4)
		print("Trabalhador comprado!")
		$lblWorkers.text = str(Stats.worker)
		$btnWorker.text = str(Stats.worker_price)
		UpdateUI()
	else:
		print("Sem dinheiro!")

func _on_btnMoney_pressed():
	print("Botão pressionado!")
	Stats.money += 1
	UpdateUI()
	
func Workers():
	Stats.money += Stats.worker
	UpdateUI()
