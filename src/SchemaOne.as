package  
{
	import flash.display.Sprite;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.utils.Input;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author sean singh
	 */
	public class SchemaOne extends Entity 
	{
		private var gList:Graphiclist = new Graphiclist();
		private var _bgsprites:Spritemap = new Spritemap(GA.SONAR_BG_SPRITESHEET, 800, 600);
		private var curAnimation:String = "default";
		
		public function SchemaOne() 
		{
			addSprites();
			graphic = gList;
			layer = GC.FOREGROUND;
			setHitbox(800, 270, 0,10);
		}
		
		override public function update():void 
		{
			super.update();
			handleReturn();
			handleSprites();
		}
		
		private function addSprites():void {
			_bgsprites.add("default", [0]);
			//_bgsprites.play("default");
			_bgsprites.add("mid", [2]);
			_bgsprites.add("midHigh", [1]);
			_bgsprites.add("midLow", [1]);
			_bgsprites.add("right", [3]);
			_bgsprites.add("left", [7]);
			
			gList.add(_bgsprites);
		}
		
		//If cursor collides with hitbox, it returns player to chatroom
		private function handleReturn():void {
			if (collide("cursor", x, y) && Input.mouseReleased) {
				trace("RETURN HOME");
			}
		}
		
		private function handleSprites():void {
			//y axis
			if (Input.mouseX >= 250 && Input.mouseX <= 500 && Input.mouseY >= 461) {
				curAnimation = "midLow";
				trace("midLow");
			}
			
			//x axis
			if (Input.mouseX >= 250 && Input.mouseX <= 500 && Input.mouseY <= 460) {
				curAnimation = "mid";
				trace("mid");
			}
			if (Input.mouseX <= 249&& Input.mouseY <= 450) {
				curAnimation = "left";
				trace("left");
			}			
			if (Input.mouseX >= 501&& Input.mouseY <= 460) {
				curAnimation = "right";
				trace("right");
			}
			
			_bgsprites.play(curAnimation);
		}
		
		
	}

}