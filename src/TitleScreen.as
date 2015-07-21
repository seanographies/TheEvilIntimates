package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class TitleScreen extends Entity 
	{
		private var gm:GameManager = new GameManager();
		
		public function TitleScreen() 
		{
			super(x, y, graphic, mask);
			
		}
		
		override public function update():void 
		{
			super.update();
			handleClick();
		}
		
		//TODO: Change scene ticket Var back to ++
		private function handleClick():void {
			if (Input.mousePressed) {
				GC.SCENETICKET+=2;
				gm.changeScene();
				FP.world.remove(this);
			}
		}
	}

}