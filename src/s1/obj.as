package s1 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.TiledImage;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Grid;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class obj extends Entity 
	{
		private var _grid:Grid = new Grid(816, 320, 32, 32, -16, 304);
		private var _tiles:Tilemap;
		private var _spawn:Boolean = true;
		private var RangeX:int = 24;
		private var RangeY:int = 8;
		private var _column:int;
		private var _row:int;
		private var low:int = 0;
		
		private var _obj1:Image = new Image (GA.OBJ_1);
		private var _obj2:Image = new Image (GA.OBJ_2);
		private var _obj3:Image = new Image (GA.OBJ_3);
		private var _obj4:Image = new Image (GA.OBJ_4);
		private var gList:Graphiclist = new Graphiclist();
		
		public function obj() 
		{
			//mask = _grid;
			setHitbox(32, 32, 16, 16);
			type = "obj";
			addSprites();
			graphic = gList;
			layer = 5;
		}
		
		override public function update():void 
		{
			super.update();
			spawn();
		}
		
		private function addSprites():void {
			_obj1.centerOO();
			_obj2.centerOO();
			_obj3.centerOO();
			_obj4.centerOO();
			
			gList.add(_obj1);
			gList.add(_obj2);
			gList.add(_obj3);
			gList.add(_obj4);
		}
		
		//Following Moan.as in Ludumdare31
		protected function spawn():void {
			if (_spawn) {
				_column = Math.floor(Math.random() * RangeX) + low;
				_row = Math.floor(Math.random() * RangeY) + low;
				
				_grid.setTile(_column,_row);
				_spawn = false;
				
				GV.OBJ_X_COLUMN = _column;
				GV.OBJ_Y_ROW = _row;
				GV.OBJ_X = _column * 32;
				GV.OBJ_Y = _row * 32 + 320;
				this.x = _column * 32;
				this.y = _row * 32 + 320;
				trace("Obj Column is " + _column);
				trace("Obj Row is " + _row);
			}
		}
		
	}

}