/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_table)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

instance_create_depth(0,0,0,obj_fullscreen)
instance_create_depth(0,0,0,obj_action)

depth = -999




// card shoe is -54 degrees
/*
action_add(DEBUG_MESSAGE, 60,60,["test1"])
action_add(DEBUG_MESSAGE, 60,60,["test2"])
test_coin = instance_create_depth(350,608,0,obj_coin)
action_move(0,30,test_coin, 900,900, 30)
action_move(0,30,test_coin, 100,100, 30)
action_move(0,30,test_coin, 450,450, 30)
*/

repeat_and_deal = false
double_and_deal = false
double_down = false
ace_joker_split = false
insurance_taken = false


deck_x = 1587 //1921
deck_y = 153//-161
dealer_chips_x = 250
dealer_chips_y = -137
player_chips_x = 350
player_chips_y = 608


card_xoffset = 56
card_yoffset = 79

player_cards = []
player_card_x = 904
player_card_y = 586
player_card_dealt = 0
player_card_xsep = 56
player_card_ysep = -79

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


deck = array_create(56);

new_deck()

// fixed starting cards for testing
//array_push(deck, 7,7,0,0,1,1,13,13)
//array_push(deck, 1,1,0,42,14,28,8,8)
//array_push(deck, 1,1,0,42,14,28,5,5) // soft 17 example using joker
//array_push(deck, 1,1,0,42,29,29,4,4) // soft 17 example using ace
//array_push(deck, 1,1,0,42,7,7,0,0,10,10) // hard 17 example using joker



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

// multi chip display
balance_chips = []
chip_values = [1,5,10,25,100,500,1000] // values from whatever chip sprite you use

balance_chips = calculate_chip_stack(balance_value)


bet_value = 0
last_bet_value = 0
bet_string = string(bet_value)
bet_obj = noone
bet_x = 915
bet_y = 786
bet_w = string_width(bet_string) + 10
bet_h = string_width(bet_string)
bet_string_x = 970
bet_string_y = 901
bet_x1 = bet_string_x - bet_w * 0.5
bet_y1 = bet_string_y - bet_h * 0.5
bet_x2 = bet_string_x + bet_w * 0.5
bet_y2 = bet_string_y + bet_h * 0.5

dealer_value = 0
dealer_string = string(dealer_value)
dealer_x = 895
dealer_y = 195
dealer_w = string_width(dealer_string) + 10
dealer_h = string_width(dealer_string)
dealer_x1 = dealer_x - dealer_w * 0.5
dealer_y1 = dealer_y - dealer_h * 0.5
dealer_x2 = dealer_x + dealer_w * 0.5
dealer_y2 = dealer_y + dealer_h * 0.5

player_value = 0
player_string = string(player_value)
player_x = 968
player_y = 557
player_w = string_width(player_string) + 10
player_h = string_width(player_string)
player_x1 = player_x - player_w * 0.5
player_y1 = player_y - player_h * 0.5
player_x2 = player_x + player_w * 0.5
player_y2 = player_y + player_h * 0.5


new_bet = instance_create_depth(3,605,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 5
new_bet.image_index = 1
new_bet = instance_create_depth(103,679,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 10
new_bet.image_index = 2
new_bet = instance_create_depth(210,745,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 25
new_bet.image_index = 3
new_bet = instance_create_depth(322,804,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 100
new_bet.image_index = 4
new_bet = instance_create_depth(440,850,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 500
new_bet.image_index = 5
new_bet = instance_create_depth(562,884,0,obj_button)
new_bet.sprite_index = btn_bet
new_bet.value = 1000
new_bet.image_index = 6



new_button = instance_create_depth(1483,-149,2,obj_button)
new_button.sprite_index = btn_new_card_shoe

top_of_deck = instance_create_depth(deck_x,deck_y,-998,obj_static)
top_of_deck.sprite_index = spr_card_back
top_of_deck.image_index = 0
top_of_deck.image_angle = 45

shoe_top = instance_create_depth(1483,-149,-999,obj_static)
shoe_top.sprite_index = btn_new_card_shoe
shoe_top.image_index = 1

// ------------------------------------------------------------



hand0 = instance_create_depth(0,0,0,obj_hand)
hand0.my_hand_id = 0
hand1 = instance_create_depth(0,0,0,obj_hand)
hand1.my_hand_id = 1
hand2 = instance_create_depth(0,0,0,obj_hand)
hand2.my_hand_id = 2

player_hand_list[0] = hand0
player_hand_list[1] = hand1
player_hand_list[2] = hand2
player_hand_current = hand0
player_hand_current_id = 0
player_splits = 0

//player_hand_current = self


hand0.player_card_x = 904
hand0.player_card_y = 586
hand0.player_x = 961
hand0.player_y = 763
hand0.player_card_dealt = 0
hand0.player_card_xsep = player_card_xsep
hand0.player_card_ysep = player_card_ysep
hand0.card_xoffset = card_xoffset
hand0.card_yoffset = card_yoffset
hand0.bet_x = 915
hand0.bet_y = 786
hand0.bet_string_x = 970
hand0.bet_string_y = 901


hand1.player_card_x = 1187
hand1.player_card_y = 586
hand1.player_x = 1244
hand1.player_y = 763
hand1.player_card_dealt = 0
hand1.player_card_xsep = player_card_xsep
hand1.player_card_ysep = player_card_ysep
hand1.card_xoffset = card_xoffset
hand1.card_yoffset = card_yoffset
hand1.bet_x = 1187
hand1.bet_y = 786
hand1.bet_string_x = 1244
hand1.bet_string_y = 901



hand2.player_card_x = 645
hand2.player_card_y = 586
hand2.player_x = 702
hand2.player_y = 763
hand2.player_card_dealt = 0
hand2.player_card_xsep = player_card_xsep
hand2.player_card_ysep = player_card_ysep
hand2.card_xoffset = card_xoffset
hand2.card_yoffset = card_yoffset
hand2.bet_x = 645
hand2.bet_y = 786
hand2.bet_string_x = 699
hand2.bet_string_y = 901