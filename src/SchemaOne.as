package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import GA;
	/**
	 * ...
	 * @author sean singh
	 */
	public class SchemaOne extends Entity 
	{
		private var gList:Graphiclist = new Graphiclist();
		private var _bgsprites:Spritemap = new Spritemap(GA.SONAR_BG_SPRITESHEET, 800, 600);
		
		public function SchemaOne() 
		{
			addSprites();
			graphic = gList;
			layer = 1;
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		private function addSprites():void {
			_bgsprites.add("default", [0, 1, 2, 3], 2);
			_bgsprites.play("default");
			gList.add(_bgsprites);
		}
		
		
	}

}