package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Cursor extends Entity 
	{
		
		public function Cursor() 
		{
			Mouse.hide();
			setHitbox(16,16,8,8);
			type = "cursor";
			
			super(Input.mouseX, Input.mouseY);
		}
		
		override public function update():void 
		{
			super.update();
			this.x = Input.mouseX;
			this.y = Input.mouseY;
		}
		
		
	}

}