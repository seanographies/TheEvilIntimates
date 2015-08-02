package scene1 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.hardcore.Speechbubble;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class MotherLeopard extends Entity 
	{
		private var _spritesheet:Spritemap = new Spritemap(GA.EI_SPRITESHEET, 128, 128);
		private var curAnimation:String = "off";
		public function MotherLeopard(x:Number=0, y:Number=0) 
		{
			addSprites();
			super(x, y);
		}
		
		private function addSprites():void {
			_spritesheet.add("off", [0]);
			_spritesheet.add("on", [1]);
			_spritesheet.centerOO();
			_spritesheet.scale = GC.EI_SCALE;
			_spritesheet.play(curAnimation);
			graphic = _spritesheet;
		}
		
		override public function update():void 
		{
			super.update();
			handleSprites();
			handleGraphic();
		}
		
		//display graphic once connected and null when not
		private function handleGraphic():void {
			if (Speechbubble.LINE_NUMBER >= 1 && Speechbubble.LINE_NUMBER < 36) {
				graphic = _spritesheet;
			}else {
				graphic = null;
			}
		}
		
		private function handleSprites():void {
			if (Speechbubble.CHAR_SPEAK == 2) {
				curAnimation = "on";
				
			}else {
				curAnimation = "off";
			}
			_spritesheet.play(curAnimation);
		}
		
	}

}