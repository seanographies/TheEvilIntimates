package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Cursor extends Entity 
	{
		private var _image:Image = new Image(GA.CURSOR_IMAGE);
		
		public function Cursor() 
		{
			_image.centerOO();
			Mouse.hide();
			type = "cursor";
			
			super(Input.mouseX, Input.mouseY);
		}
		
		override public function update():void 
		{
			super.update();
			this.x = Input.mouseX;
			this.y = Input.mouseY;
			updateHitbox();
			handleClick();
			nextLevel();
			}
		
		private function handleClick():void {
			if (Input.mousePressed && collide("sonar", x, y) && GC.SEEKER > -1) {
				GC.SEEKER -= 1;
			}
		}
		
		private function nextLevel():void {
			if (Input.mousePressed && collide("obj", x, y) && GC.SEEKER > -1) {
				trace("next level");
			}
		}
		
		//adjusts the hitbox based on GC.SEEKER
		private function updateHitbox():void {
			switch(GC.SEEKER) {
				case 5:
					setHitbox(128, 128, 64, 64);
					break;
				case 4:
					setHitbox(64, 64, 32, 32);
					break;
				case 3:
					setHitbox(32, 32, 16, 16);
					break;
				case 2:
					setHitbox(32, 32, 16, 16);
					break;
				case 1:
					setHitbox(16, 16, 8, 8);
					break;
			}
		}
		
		
	}

}