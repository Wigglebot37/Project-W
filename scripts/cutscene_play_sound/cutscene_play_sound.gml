///@function cutscene_play_sound(soundid,priority,loops);
///@param {index} Sound_id
///@param {real} Priority
///@param {bool} Looping

function cutscene_play_sound(soundid,priority,loops) {
	audio_play_sound(soundid,priority,loops);
	cutscene_end_action();
}