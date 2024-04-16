/// @description dealer keeps hitting until hard 17 or soft 18

// flip animation takes 15x2 frames
// card movement from deck takes 30 frames

hidden_card = find_hidden_card()
			
if hidden_card != noone
{
	hidden_card.alarm[1] = 1
}

calculate_dealer_card()

//msg("soft_hand", soft_hand,"dealer_value", dealer_value)

if dealer_value > 17 or (dealer_value == 17 and soft_hand == false)
{
	alarm[3] = 30
	alarm[2] = -1
}
else
{
	//msg("dealer should hit!","","soft_hand", soft_hand,"dealer_value", dealer_value)	
	deal_dealer_card(true, 30)
	alarm[2] = 30
}

