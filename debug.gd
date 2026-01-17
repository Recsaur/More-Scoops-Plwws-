extends Control

@onready var SL = $Label
@onready var STC = $Label2
@onready var CS = $Label3
@onready var ACC = $Label4
@onready var COMBO = $Label5
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var WholeLot = 0.0
	var calc = 0.0
	SL.text = str(GameController.NumScoopsLaunched)
	STC.text = str(GameController.ScoopsToCustomers)
	CS.text = str(GameController.CustomersServed)
	if GameController.NumScoopsLaunched > 0 and GameController.ScoopsToCustomers > 0:
		calc = (float(GameController.ScoopsToCustomers)/GameController.NumScoopsLaunched)*100
		WholeLot = "%.2f" % calc
		ACC.text = str(WholeLot,"%")
	COMBO.text = str(GameController.ConsecutiveOrder,"x")
