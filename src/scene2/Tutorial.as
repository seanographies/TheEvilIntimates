package scene2 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Tutorial extends Entity 
	{
		private var _instruct:Text = new Text("SEEK TOWARDS THE INNERMOST CORE", 50, 100);
		private var gList:Graphiclist = new Graphiclist;
		public function Tutorial() 
		{
			layer = GC.FOREGROUND;
			_instruct.color = 0xC5A507;
			_instruct.size = 48;
			gList.add(_instruct);
			super(x, y, gList, mask);
			
		}
		
		override public function update():void 
		{
			super.update();
			handleClick();
		}
		
		private function handleClick():void {
			if (Input.mousePressed) {
				FP.world.add(new Cursor);
			}
		}
		
	}

}