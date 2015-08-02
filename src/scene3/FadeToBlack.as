package scene3 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class FadeToBlack extends Entity 
	{
		protected var square:BitmapData = new BitmapData(800, 600, false, 0x021724);
		protected var _image:Image;
		public function FadeToBlack() 
		{
			_image = new Image(square);
			_image.alpha = 0;
			super(0, 0, _image, mask);
			layer = GC.FADE;
		}
		
		override public function update():void 
		{
			super.update();
			updateFade();
			
		}
		
		private function updateFade():void {
			for (var i:int = 0; i < 2; i++) {
				_image.alpha += 0.003;
			}
			
			if (_image.alpha == 1) {
				FP.world.removeAll();
			}
		}
	}

}