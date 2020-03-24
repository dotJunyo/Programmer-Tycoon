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
	$lblMoney.text = "R$ " + str(Main.money)
	$lblWorkers.text = str(Main.worker)

func _on_btnWorker_pressed():
	if Main.money >= Main.worker_price:
		Main.money -= Main.worker_price
		Main.worker += 1
		Main.worker_price += round(Main.worker/4)
		print("Trabalhador comprado!")
		$lblWorkers.text = str(Main.worker)
		$btnWorker.text = str(Main.worker_price)
		UpdateUI()
	else:
		print("Sem dinheiro!")

func _on_btnMoney_pressed():
	print("Botão pressionado!")
	Main.money += 1
	UpdateUI()
	
func Workers():
	Main.money += Main.worker
	UpdateUI()
