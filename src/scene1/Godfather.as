package scene1 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.hardcore.Speechbubble;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Godfather extends Entity 
	{
		private  var _spritesheet:Spritemap = new Spritemap(GA.EI_SPRITESHEET, 128, 128);
		private var curAnimation:String = "off";
		private var _music:Sfx = new Sfx(GA.VOYEUR_MUSIC);
		public function Godfather(x:Number=0, y:Number=0) 
		{
			addSprites();
			super(x, y);
			_music.loop();
		}
		
		private function addSprites():void {
			_spritesheet.add("off", [4]);
			_spritesheet.add("on", [5]);
			_spritesheet.centerOO();
			_spritesheet.scale = GC.EI_SCALE;
			_spritesheet.play(curAnimation);
		}
		
		override public function update():void 
		{
			super.update();
			handleSprites();
			handleGraphic();
		}
		
		//display graphic once connected and null when not
		private function handleGraphic():void {
			if (Speechbubble.LINE_NUMBER >= 2 && Speechbubble.LINE_NUMBER < 45) {
				graphic = _spritesheet;
			}else {
				graphic = null;
			}
			
			if (Speechbubble.LINE_NUMBER >= 45) {
				_music.stop();
			}
		}
		
		//If line == char_speak in speechbubble, then turn char sprite on
		private function handleSprites():void {
			if (Speechbubble.CHAR_SPEAK == 3) {
				curAnimation = "on";
				
			}else {
				curAnimation = "off";
			}
			_spritesheet.play(curAnimation);
		}
		
	}

}