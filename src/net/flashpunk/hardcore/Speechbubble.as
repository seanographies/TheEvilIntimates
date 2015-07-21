package  net.flashpunk.hardcore
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Speechbubble extends Entity 
	{
		private var speech:String = new String(" ");
		private var counter:Number = 0;
		private var speech_text:Text;
		private var nuovo_text:String;
		private var start:Boolean = true;
		private var end:Boolean = false;
		private var timer_counter:Number = 0;
		private var timer_limit:Number = 0.07;
		
		public static var SCENE_NUMBER:Number = 1;
		public static var ACT_NUMBER:Number = 1;
		public static var LINE_NUMBER:Number = 0;
		
		public function Speechbubble() 
		{
			super(60, 500, graphic, mask);
		}
		
		override public function update():void 
		{
			super.update();
			nextLine();
			playLine();	
		}
		
		//Rolling Text effect
		private function playLine():void {
			if (start) {
				readLine();
				if (counter <= speech.length) {
					speech_text = new Text(speech.substr(0, counter),0,0,{width:500,height: 1,wordWrap:true});
					timer_counter += FP.elapsed;
					if (timer_counter >= timer_limit) {
						counter++;
						graphic = speech_text;
						timer_counter = 0;
					}
				}else {
					start = false;
					end = true;
					counter = 0;
					trace("STOP playLine()");
				}
			}
		}
		
		// When mouse is clicked either skips to end of line or plays next line
		private function nextLine():void {
			if (Input.mousePressed) {
				if ( start) {
					counter = 0;
					start  = false
					speech_text = new Text(speech, 0, 0, { width:500, height: 1, wordWrap:true } );
					graphic = speech_text;
					trace("SKIP LINE");
				}else {
					counter = 0;
					LINE_NUMBER++;
					start = true;
					trace("NEXT LINE");
				}
			}
		}
		
		/**
		 * Constructor. Used to inser the lines of the script, S no. A no. and L no., placed into readLine();
		 * @param	script_line			Words of the line
		 * @param	scene_number	Scene Number
		 * @param	act_number			Act Number
		 * @param	line_number		Line Number
		 */
		private function script(script_line:String,scene_number:Number = 1, act_number:Number = 1, line_number:Number = 0):void {
			if (SCENE_NUMBER == scene_number && ACT_NUMBER == act_number && LINE_NUMBER == line_number) {
				speech = script_line;
			}
		}
		
		//contains the lines for each scene and act
		private function readLine():void {
			//S1 A1
			script("how are you buddy?");
			script("I am much better than I was feeling just now yes.", 1,1,1);
			script("that is good yeah I wish you all the best thank you", 1, 1, 2);
			nextAct(1, 3, 2);
			//S1A2
			script("This is the next act yes,", 1, 2);
			nextScene(1,2, 1, 2);
			//S2A1
			script("This is the next scene very much", 2);
		}
		
		/**
		 * Constructor. Used to change scene, based on last line, inserted into readLine();
		 * @param	currentS		The current scene
		 * @param	currentA		The current act
		 * @param	finalL			+1 to the last line of the current scene and act
		 * @param	nextS			The desired scene to be changed to
		 */
		private function nextScene(currentS:Number, currentA:Number, finalL:Number, nextS:Number):void {
			if (SCENE_NUMBER == currentS && ACT_NUMBER == currentA && LINE_NUMBER == finalL) {
				SCENE_NUMBER = nextS;
				LINE_NUMBER = 0;
				ACT_NUMBER = 1;
				trace("CALLED");
			}
		}
		
		
		/**
		 * Constructor. Used to change act, based on last line, inserted into readLine();
		 * @param	currentA		The current Act
		 * @param	finalL			+1 to the last line of the current scene and act
		 * @param	nextA			The desired act to be changed to
		 */
		private function nextAct(currentA:Number, finalL:Number, nextA:Number):void {
			if (ACT_NUMBER == currentA && LINE_NUMBER == finalL) {
				ACT_NUMBER = nextA;
				LINE_NUMBER = 0;
				trace(ACT_NUMBER);
			}
		}
		
	}

}