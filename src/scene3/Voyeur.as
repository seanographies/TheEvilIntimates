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
		private var _currentAct:Number;
		private var gm:GameManager = new GameManager;
		public function Voyeur() 
		{
			_currentAct = new Number(Speechbubble.ACT_NUMBER);
			trace("Current act is" + _currentAct);
			addSprites();
			super(x, y, graphic);
			layer = GC.FOREGROUND;
		}
		
		override public function update():void 
		{
			super.update();
			updateLines();
			trace("LIVE ACT IS" + Speechbubble.ACT_NUMBER);
		}
		
		private function addSprites():void {
			_spritemap.add("default", [0, 1, 2, 3, 4, 5, 6, 7], 1, true);
			_spritemap.play("default");
			graphic = _spritemap;
		}
		
		//If act does not equal the previous act return to Seeker scene
		private function updateLines():void {
			if (Speechbubble.ACT_NUMBER !== _currentAct) {
				trace("GO BACK");
				GC.SCENETICKET = 3;
				gm.changeScene();
				FP.world.remove(this);
			}
		}
		
	}

}