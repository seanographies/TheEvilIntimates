package scene3 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.hardcore.Speechbubble;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Voyeur extends Entity 
	{
		private var _spritemap:Spritemap = new Spritemap(GA.VOYEUR_BG_SPRITESHEET, 800, 600);
		private var _currentLine:Number;
		private var gm:GameManager = new GameManager;
		public function Voyeur() 
		{
			_currentLine = new Number(Speechbubble.LINE_NUMBER);
			trace("Current line is" + _currentLine);
			addSprites();
			super(x, y, graphic);
		}
		
		override public function update():void 
		{
			super.update();
			updateLines();
			trace("LIVE LINE IS" + Speechbubble.LINE_NUMBER);
		}
		
		private function addSprites():void {
			_spritemap.add("default", [0, 1, 2, 3, 4, 5, 6, 7], 1, true);
			_spritemap.play("default");
			graphic = _spritemap;
		}
		
		private function updateLines():void {
			if (Speechbubble.LINE_NUMBER !==_currentLine) {
				trace("GO BACK");
				GC.SCENETICKET = 3;
				gm.changeScene();
				FP.world.remove(this);
			}
		}
		
	}

}