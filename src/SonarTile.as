package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class SonarTile extends Entity 
	{
		private var _imageClicked:Image = new Image(GA.SONAR_SEEKER);
		private var _spritemap:Spritemap = new Spritemap (GA.SONAR_SPRITESHEET, 32, 32);
		private var _image:Image = new Image(GA.CURSOR_IMAGE);
		private var clicked:Boolean = false;
		private var column_obj:Number;
		private var row_obj:Number;
		private var framerate:Number = 2;
		
		private var gList:Graphiclist;
		
		public function SonarTile(_x:Number=0, _y:Number=0) 
		{
			_image.centerOO();
			_imageClicked.centerOO();
			setHitbox(16, 16, 8, 8);
			type = "sonar";
			addSprites();
			
			super(_x, _y);
			layer = 2;
		}
		
		override public function update():void 
		{
			super.update();
			handleClick();
			seeker();
			handleCursor();
		}
		
		private function addSprites():void {
			_spritemap.add("1", [0, 1, 2, 3], framerate);
			_spritemap.add("2", [4, 5, 6, 7], framerate);
			_spritemap.add("3", [8, 9, 10, 11], framerate);
			_spritemap.add("4", [12, 13, 14, 15], framerate);
			var _spriteselect:Number = new Number(Math.floor(Math.random() * 4) + 1);
			switch (_spriteselect) {
				case 1:
					_spritemap.play("1");
					break;
				case 2:
					_spritemap.play("2");
					break;
				case 3:
					_spritemap.play("3");
					break
				case 4:
					_spritemap.play("4");
				break;
			}
			_spritemap.centerOO();
			graphic = _spritemap;
		}
		
		private function handleClick():void {
			if (Input.mousePressed && collide("cursor", x, y) && GC.SEEKER > -1) {
				clicked = true;
			}
		}
		
		//calculates how far objective is based on 32 x 32 grid
		private function seeker():void {
			if (clicked) {
				graphic = _imageClicked;
				layer = GC.BACKGROUND;
			}
		}
		
		private function handleCursor():void {
			if (collide("cursor", x, y) && !clicked) {
				//graphic = _image;
			}else if (clicked){
				seeker();
			}else {
				graphic = _spritemap;
			}
		}
		
		
		
	}

}