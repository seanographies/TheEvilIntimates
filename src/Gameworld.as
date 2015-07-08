package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Gameworld extends World 
	{
		//map grid
		protected var map:Entity
		public var _mapGrid:Grid;
		public var _mapImage:Image;
		private var _mapData:Class;
		
		public function Gameworld(mapData:Class) 
		{
			_mapData = mapData;
			super();
			loadmap(_mapData);
		}
		
		override public function begin():void 
		{
			super.begin();
			add(new SchemaOne);
			add(new Cursor);
		}
		
		private function loadmap(mapData:Class):void {
			var mapXML:XML = FP.getXML(mapData);
			var node:XML;
			//map grid
			_mapGrid = new Grid (uint(mapXML.@width), (uint(mapXML.@height)), 32,32,0,0);
            _mapGrid.loadFromString(String(mapXML.Grid), "", "\n");
			
			for each(node in mapXML.Entities.Sonar) {
				add(new SonarTile(Number(node.@x), Number(node.@y)));
			}
		}
		
	}

}