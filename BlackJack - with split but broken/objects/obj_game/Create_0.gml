/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_table)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

instance_create_depth(0,0,0,obj_fullscreen)

repeat_and_deal = false
double_and_deal = false
double_down = false

deck_x = 1921
deck_y = -161
dealer_chips_x = 250
dealer_chips_y = -137
player_chips_x = 350
player_chips_y = 608


card_xoffset = 56
card_yoffset = 79

player_hand_current = 0 // 0 middle, 1 right, 2 left
player_splits = 0
ace_joker_split = false
player_cards[0] = []
player_cards[1] = []
player_cards[2] = []
player_card_instances[0] = []
player_card_instances[1] = []
player_card_instances[2] = []
player_card_dealt = 0
player_card_xsep = 56
player_card_ysep = -79


player_card_x[0] = 904
player_card_y[0] = 586

player_card_x[1] = 1187
player_card_y[1] = 586

player_card_x[2] = 645
player_card_y[2] = 586


dealer_cards = []
dealer_card_x = 839
dealer_card_y = 9
dealer_card_dealt = 0
dealer_card_xsep = 120
dealer_card_ysep = 0

// pre-declare, but only used inside calculation scripts
total_value = 0
num_jokers = 0
num_aces = 0
soft_hand = false // if ace or jack's higher value is used, it is a soft hand


new_deck()



// fixed starting cards for testing
//array_push(deck, 7,7,0,0,1,1,13,13)
//array_push(deck, 1,1,0,42,14,28,8,8)
//array_push(deck, 1,1,0,42,14,28,5,5) // soft 17 example using joker
//array_push(deck, 1,1,0,42,29,29,4,4) // soft 17 example using ace
//array_push(deck, 1,1,0,42,7,7,0,0,10,10) // hard 17 example using joker
//array_push(deck, 0,1,10,10) // natural blackjack



/*
dbg("deck", deck)

for (i = 0; i < 18; i++) 
{
	// deal one card
	dealt_card = array_pop(deck)
	
	dbg("ID: " + string(dealt_card), "value: " + string(get_card_value(dealt_card)))
	details = get_card_details(dealt_card) // for debugging only
	
	dbg(sprite_get_name(details[0]),details[1])
	dbg("----------")
}

dbg("deck", deck)
*/


//alarm[1] = room_speed // update strings

balance_value = 5000
balance_string = string(balance_value)
balance_x = 407
balance_y = 744
balance_w = string_width(balance_string) + 10
balance_h = string_height(balance_string)
balance_x1 = balance_x - balance_w * 0.5
balance_y1 = balance_y - balance_h * 0.5
balance_x2 = balance_x + balance_w * 0.5
balance_y2 = balance_y + balance_h * 0.5

last_bet_value = 0

bet_x[0] = 915
bet_y[0] = 786
bet_string_x[0] = 970
bet_string_y[0] = 901

bet_x[1] = 1187
bet_y[1] = 786
bet_string_x[1] = 1244
bet_string_y[1] = 901

bet_x[2] = 645
bet_y[2] = 786
bet_string_x[2] = 699
bet_string_y[2] = 901



player_x[0] = 961
player_y[0] = 763

player_x[1] = 1244
player_y[1] = 763

player_x[2] = 702
player_y[2] = 763


// calculate positions for bets and player cards
for(i=0; i<=2;i+=1)
{
	bet_value[i] = 0
	bet_string[i] = string(bet_value[i])
	bet_obj[i] = noone
	bet_w[i] = string_width(bet_string[i]) + 10
	bet_h[i] = string_height(bet_string[i])
	bet_x1[i] = bet_string_x[i] - bet_w[i] * 0.5
	bet_y1[i] = bet_string_y[i] - bet_h[i] * 0.5
	bet_x2[i] = bet_string_x[i] + bet_w[i] * 0.5
	bet_y2[i] = bet_string_y[i] + bet_h[i] * 0.5
	

	player_value[i] = 0
	player_string[i] = string(player_value[i])
	player_w[i] = string_width(player_string[i]) + 10
	player_h[i] = string_height(player_string[i])
	player_x1[i] = player_x[i] - player_w[i] * 0.5
	player_y1[i] = player_y[i] - player_h[i] * 0.5
	player_x2[i] = player_x[i] + player_w[i] * 0.5
	player_y2[i] = player_y[i] + player_h[i] * 0.5
}


dealer_value = 0
dealer_string = string(dealer_value)
dealer_x = 895
dealer_y = 187
dealer_w = string_width(dealer_string) + 10
dealer_h = string_width(dealer_string)
dealer_x1 = dealer_x - dealer_w * 0.5
dealer_y1 = dealer_y - dealer_h * 0.5
dealer_x2 = dealer_x + dealer_w * 0.5
dealer_y2 = dealer_y + dealer_h * 0.5



new_bet = instance_create_depth(140,717,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 5
new_bet.visible = false
new_bet = instance_create_depth(216,781,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 25
new_bet.visible = false
new_bet = instance_create_depth(303,833,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 100
new_bet.visible = false
new_bet = instance_create_depth(393,879,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 500
new_bet.visible = false


new_button = instance_create_depth(1632,142,0,obj_button)
new_button.sprite_index = btn_new_card_shoe
