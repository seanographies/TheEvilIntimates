package  
{
	import net.flashpunk.FP;
	import s1.obj;
	import scene2.Tutorial;
	/**
	 * ...
	 * @author sean singh
	 */
	public class GameManager 
	{
		
		public function GameManager() 
		{
			
		}
		
		public function changeScene():void {
			switch(GC.SCENETICKET) {
				case 0:
					trace("Title Screen");
					break;
				case 1:
					trace("Scene 1 - Lounge");
					FP.world.removeAll();
					break;
				case 2:
					trace("Scene 2 - Tutorial");
					FP.world.removeAll();
					FP.world.add(new Tutorial);
					FP.world.add(new obj);
					break;
				case 3:
					trace("Scene 3 - Binoculars");
					FP.world.removeAll();
					FP.world = new Gameworld(GA.SCHEMAONE_LEVEL);
					break;
			}
		}
		
		
	}

}