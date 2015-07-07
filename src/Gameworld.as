package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Gameworld extends World 
	{
		
		public function Gameworld() 
		{
			super();
		}
		
		override public function begin():void 
		{
			super.begin();
			add(new SchemaOne);
			add(new Cursor);
		}
		
	}

}