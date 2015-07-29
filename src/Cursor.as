package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
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
		private var _image:Image = new Image(GA.CURSOR_COVER);
		private var _image64:Image = new Image(GA.CURSOR_COVER64);
		private var _image32:Image = new Image(GA.CURSOR_COVER32);
		private var _image16:Image = new Image(GA.CURSOR_COVER16);
		private var _text:Text = new Text("RESET");
		private var gList:Graphiclist =  new Graphiclist;
		private var gm:GameManager = new GameManager;
		public function Cursor() 
		{
			_text.centerOO();
			_text.color = 0xC5A506;
			_text.size = 32;
			_image.centerOO();
			_image64.centerOO();
			_image32.centerOO();
			_image16.centerOO();
			Mouse.hide();
			type = "cursor";
			layer = GC.UNDERFOREGROUND;
			graphic = _image;
			super(Input.mouseX, Input.mouseY);
		}
		
		override public function update():void 
		{
			this.x = Input.mouseX;
			this.y = Input.mouseY;
			super.update();
			if (this.y <= 170) {
				this.y = 170;
			}
			handleClick();
			nextLevel();
			handleMouseHide();
		}
		
		private function handleClick():void {
			if (Input.mousePressed && collide("sonar", x, y) && GC.SEEKER > -1) {
				GC.SEEKER -= 1;
			}
		}
		
		//changes to voyeur level to read speechbubble
		private function nextLevel():void {
			if (Input.mousePressed && collide("obj", x, y) && GC.SEEKER > -1) {
				FP.world.remove(this);
				trace("CALLED");
				if (GC.SCENETICKET == 2) {
					GC.SCENETICKET++;
					gm.changeScene();
				}else {
					GC.SCENETICKET++;
					gm.changeScene();
				}
			}else {
				updateHitbox();
			}
		}
		
		//adjusts the hitbox based on GC.SEEKER
		private function updateHitbox():void {
			if (GC.SCENETICKET == 2) {
				setHitbox(16, 16, 8, 8);
				graphic = _image16;
			}else {
				switch(GC.SEEKER) {
					case 5:
						setHitbox(128, 128, 64, 64);
						graphic = _image;
						break;
					case 4:
						setHitbox(64, 64, 32, 32);
						graphic = _image64;
						break;
					case 3:
						setHitbox(32, 32, 16, 16);
						graphic = _image32;
						break;
					case 2:
						setHitbox(32, 32, 16, 16);
						graphic = _image32;
						break;
					case 1:
						setHitbox(16, 16, 8, 8);
						graphic = _image16;
						break;
				}	
			}	
		}
		
		private function handleMouseHide():void {
			if (this.y <= 255) {
				//Mouse.show();
				graphic = _text;
				layer = GC.FOREGROUND;
			}else {
				layer = GC.UNDERFOREGROUND;
				Mouse.hide();
				updateHitbox();
			}
		}
	}

}