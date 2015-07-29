package  
{
	import net.flashpunk.FP;
	import net.flashpunk.hardcore.Speechbubble;
	import net.flashpunk.World;
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
					FP.world.add(new Speechbubble);
					FP.world = new Gameworld(GA.LOUNGE_LEVEL);
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
					GC.SEEKER = 5;
					FP.world = new Gameworld(GA.SCHEMAONE_LEVEL);
					break;
				case 4:
					trace ("Scene 4 - Voyeur Dialog");
					FP.world.removeAll();
					FP.world = new Gameworld(GA.VOYEUR_LEVEL);
			}
			
		}
		
		
	}

}