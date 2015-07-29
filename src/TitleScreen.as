package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class TitleScreen extends Entity 
	{
		private var gm:GameManager = new GameManager();
		private var _bg:Image = new Image(GA.TITLE_SCREEN_BG);
		private var _ei:Image = new Image(GA.EVIL_INTIMATE);
		private var gList:Graphiclist = new Graphiclist;
		private var _sfx:Sfx = new Sfx(GA.TITLESCREEN_SFX);
		
		public function TitleScreen() 
		{
			addSprites();
			super(x, y, gList, mask);
			_sfx.loop();
			
		}
		
		private function addSprites():void {
			gList.add(_bg);
			_ei.centerOO();
			_ei.x = 400;
			_ei.y = 330;
			_ei.scale = 2;
			gList.add(_ei);
		}
		override public function update():void 
		{
			super.update();
			handleClick();
		}
		
		private function handleClick():void {
			if (Input.mousePressed) {
				_sfx.stop();
				GC.SCENETICKET++;
				gm.changeScene();
				FP.world.remove(this);
			}
		}
	}

}