@tool
class_name TypewriterEffect extends RichTextEffect

var bbcode := "typewriter"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	#var speed: float = char_fx.env.get("freq", 0.5)
	var time: float = char_fx.env.get("time", 5.0)
	
	char_fx.visible = false
	
	var ratio := char_fx.elapsed_time / time
	var offset := char_fx.glyph_count * ratio
	
	char_fx.visible = char_fx.relative_index < offset
		
	#print("Ratio %s, Range %s, Offset %s, RIndex %s" % [ratio, char_fx.range, char_fx.offset, char_fx.relative_index])
	
	
	
	return true
