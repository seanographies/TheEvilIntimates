package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import s1.obj;
	import net.flashpunk.hardcore.Speechbubble;
	import scene1.Godfather;
	import scene1.MotherLeopard;
	import scene1.Oedipus;
	import scene3.Voyeur;
	
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
		//font
		[Embed(source="../assets/BMgermar.TTF", fontName = "custom", mimeType = "application/x-font-truetype",fontWeight="normal", fontStyle="normal", advancedAntiAliasing="true", embedAsCFF="false")] protected static const CUSTOM_FONT:Class;
		
		public function Gameworld(mapData:Class) 
		{
			_mapData = mapData;
			super();
			Text.font = "custom";
			loadmap(_mapData);
		}
		
		override public function begin():void 
		{
			super.begin();
		}
		
		private function loadmap(mapData:Class):void {
			var mapXML:XML = FP.getXML(mapData);
			var node:XML;
			//map grid
			_mapGrid = new Grid (uint(mapXML.@width), (uint(mapXML.@height)), 32,32,0,0);
            _mapGrid.loadFromString(String(mapXML.Grid), "", "\n");
			
			for each (node in mapXML.Entities.Bg) {
				add(new SchemaOne);
				add(new Cursor);
				add(new obj);
			}
			
			for each(node in mapXML.Entities.Sonar) {
				add(new SonarTile(Number(node.@x), Number(node.@y)));
			}
			
			for each(node in mapXML.Entities.Titlescreen) {
				add(new TitleScreen);
			}
			
			for each(node in mapXML.Entities.Godfather) {
				add(new Godfather(Number(node.@x), Number(node.@y)));
				add(new Speechbubble);
			}
			
			for each(node in mapXML.Entities.Oedipus) {
				add(new Oedipus(Number(node.@x), Number(node.@y)));
			}			
			
			for each(node in mapXML.Entities.MotherLeopard) {
				add(new MotherLeopard(Number(node.@x), Number(node.@y)));
			}			
			
			for each(node in mapXML.Entities.Voyeur) {
				add(new Voyeur);
				add(new Speechbubble);
			}
			
			
		}
		
	}

}