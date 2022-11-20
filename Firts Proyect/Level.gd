extends Node2D

var playerScore = 0
var OponentScore = 0

func _ready():
	_restart_game()

func _process(delta):
	$MarcadorPlayer.text = "Player: " + str(playerScore)
	$MarcadorOponente.text = "Oponente: " + str(OponentScore)

func _restart_game ():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2 (960, 540)
	#$Ball.reset_ball()
	$RestarTimer.start()
	$Oponente.position = Vector2(1870, $Oponente.position.y)


func _on_ArcoPlayer_body_entered(body):
	if body is Ball:
		OponentScore += 1 
		_restart_game ()


func _on_ArcoOponente_body_entered(body):
	if body is Ball:
		playerScore += 1
		_restart_game ()
