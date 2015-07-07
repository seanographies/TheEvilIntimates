package - Copy.schemaone 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class SonarTile extends Entity 
	{
		private var _image:Image = new Image(GA.CURSOR_IMAGE);
		
		public function SonarTile(x:Number=0, y:Number=0) 
		{
			_image.centerOO();
			setHitbox(32, 32, 16, 16);
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		private function collideCursor():void {
			if (collide("cursor", x, y)) {
				graphic = _image;
			}else {
				graphic = null;
			}
		}
		
		
		
	}

}