package  net.flashpunk.hardcore
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
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
		private var text_width:Number = 800;
		private var text_height:Number = 1;
		
		private var _sfx:Sfx = new Sfx(GA.RING_SFX);
		
		private var gm:GameManager = new GameManager;
		
		public static var CHAR_SPEAK:Number = 0;
		
		public static var SCENE_NUMBER:Number = 1;
		public static var ACT_NUMBER:Number = 1;
		public static var LINE_NUMBER:Number = 0;
		
		public function Speechbubble() 
		{
			super(20, 500, graphic, mask);
		}
		
		override public function update():void 
		{
			super.update();
			nextLine();
			playLine();
			handleGM();
		}
		
		//play sfx when users connect
		private function handleSfx():void {
			if (SCENE_NUMBER == 1) {
				if (LINE_NUMBER == 1 || LINE_NUMBER == 2 || LINE_NUMBER == 3 || LINE_NUMBER == 0) {
					_sfx.play();
				}
			}
		}
		
		//changes the level based on Scene, Line and Act Number
		private function handleGM():void {
			if (SCENE_NUMBER == 1 && LINE_NUMBER == 49) {
				GC.SCENETICKET++;
				gm.changeScene();
			}
		}
		
		//Rolling Text effect
		private function playLine():void {
			if (start) {
				readLine();
				if (counter <= speech.length) {
					speech_text = new Text(speech.substr(0, counter), 0, 0, { width:text_width, height: text_height, wordWrap:true, color: 0xC5A507, size:24 } );
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
					speech_text = new Text(speech, 0, 0, { width:text_width, height: text_height, wordWrap:true, color: 0xC5A507,size:24 } );
					graphic = speech_text;
					trace("SKIP LINE");
				}else {
					counter = 0;
					LINE_NUMBER++;
					start = true;
					trace("NEXT LINE");
					handleSfx();
				}
			}
		}
		
		/**
		 * Constructor. Used to inser the lines of the script, S no. A no. and L no., placed into readLine();
		 * @param	script_line			Words of the line
		 * @param	scene_number	Scene Number
		 * @param	act_number			Act Number
		 * @param	line_number		Line Number
		 * @param	char_number		0= default, 1= Oedipus, 2= MotherLeopard, 3= Godfather
		 */
		private function script(script_line:String,scene_number:Number = 1, act_number:Number = 1, line_number:Number = 0, char_number:Number = 0):void {
			if (SCENE_NUMBER == scene_number && ACT_NUMBER == act_number && LINE_NUMBER == line_number) {
				CHAR_SPEAK = char_number;
				speech = script_line;
			}
		}
		
		//contains the lines for each scene and act
		private function readLine():void {
			//S1 A1
			script("// Belial Connected.", 1, 1, 0, 0);
			script("// Mother Leopard Connected.", 1,1,1,2);
			script("// Godfather Connected.", 1, 1,2,3);
			script("// Oedipus Connected.", 1, 1,3,1);
			script("I thought you said 0001.", 1, 1,4,1);
			script("It's ok... really, I dont mind, it's all right.", 1, 1, 5,0);
			script("Ok, meeting adjourned. Kthxbai!", 1, 1, 6, 1);
			script("Seriously", 1, 1, 7, 0);
			script("Yeha, stop mucking around.", 1, 1, 8, 2);
			script("*Yeah", 1, 1, 9, 2);
			script("I thought we said no spam, you know that we're not brainless idiots that actually think you turned into a cowboy when you typed that sentence, don't waste space correcting your mistakes.", 1, 1, 10, 1);
			script("And I thought B said 0000.", 1, 1, 11, 2);
			script("I can't sleep.", 1, 1, 12, 0);
			script("Im sorry, I keep thinking you did Crescendo. This happens....maybe you can't sleep because your brain is still heavily stimulated from starring at a computer screen for hours?", 1, 1, 13,2);
			script("Don't worry, they don't know. Fuck... I don't even know who you are. The system is flawless, its an unorganized mess, there is absolutely no link to us.", 1, 1, 14,1);
			script("I agree with O, your scared of them finding you. There are no traces, we don't have traces. We are nothing. This is nothing.", 1, 1, 15,3);
			script("Only SM13.", 1, 1, 16,0);
			script("It's not supposed to have any meaning, we were the ones that gave it meaning.You were here when we tried to decipher it, Skeleton Masks 13 took us about half a day to come up with. Just calling us SM13 makes us sound like a group of robots.", 1, 1, 17,2);
			script("Yeah its just some random alphanumeric value, I still don't like that name though.", 1, 1, 18,1);
			script("Through all of the generations of Evil Intimates, I swear SM13 is the most arbitrary, the previous generation was 200.", 1, 1, 19,3);
			script("Pffft, they were codenamed 200?", 1, 1, 20,1);
			script("It's not even a codename, its just a random tag that is given to each generation/era of The Evil Intimates. And how did you find that out?", 1, 1, 21,2);
			script("My DOSE Charge had a readme file in it.", 1, 1, 22,3);
			script("That is really dangerous, leaving traces like that.", 1, 1, 23,0);
			script("Is that all it said?", 1, 1, 24,1);
			script("Yeah, just ' The Evil Intimates: 200'.", 1, 1, 25,3);
			script("Are you feeling better now B?", 1, 1, 26,2);
			script("Yeah, I think you're right, I should probably log off and burn everything soon, when are you guys going to?", 1, 1, 27,0);
			script("Was in the process of it before you called, I like to leave The Lounge as the last thing I burn, that way I can still keep contact.", 1, 1, 28,1);
			script("You only have 2 hours left to burn everything.", 1, 1, 29,3);
			script("I would recommend you just burn it all at once.", 1, 1, 30,2);
			script("Arrange all the files in descending file size, it's much more efficient that way.", 1, 1, 31,3);
			script("Alright, thanks.", 1, 1, 32,0);
			script("If the Apollo Program was a Hoax, I will kill myself.", 1, 1, 33,1);
			script("Owh, you heard about that? They are vouching for that to be the next Operation, hopefully the next generation won't be named SM14.", 1, 1, 34,2);
			script("Tell me, why would it be a hoax? Propaganda against USSR? They actually went up to the moon but the US Flag they placed down was too small to see from earth so they filmed the landing as a better source of evidence on earth?", 1, 1, 35,3);
			script("You know, if man never landed on the moon, that means we have no hope, humanity is doomed...stupid humans", 1, 1, 36,1);
			script("Ok", 1, 1, 37,3);
			script("Well, goodbye and good luck! Take care B, and hopefully we meet again, in another lounge room and time.", 1, 1, 38,1);
			script("\\ Oedipus Disconnected", 1, 1, 39,0);
			script("I'll take that as my cue, don't forget the method of burning, and leave this lounge as the last to burn, I'll be doing the same in case you need someone to speak to. Goodnight B and G.", 1, 1, 40,2);
			script("\\ Mother Leopard Disconnected", 1, 1, 41,0);
			script("You'll be fine, and you'll be at it again. You have achieved one of the most liberating and defying acts in the world... I don't think I can express into words the spark of the revolution you have caused. That fucking old man will wake up tomorrow and face the justice, face the pain he has caused millions of people. The truth is freed.", 1, 1, 42,3);
			script("I understand... Wait! You got the ROMs?", 1, 1, 43,0);
			script("Yes I do...I don't really want to know what relations you have with this man and woman and what you want to do with their profiles... But....I tried to maintain as much anonymity between us as I could while hacking it, hopefully it's enough.", 1, 1, 44,3);
			script("It's alright, they are just strangers.", 1, 1, 45,0);
			script("I trust you, here you are. Take care and Good Luck!", 1, 1, 46,3);
			script("\\ Godfather Disconnected", 1, 1, 47,0);
			script("\\ Belial Disconnected", 1, 1, 48, 0);
			script("[LOGGED IN]", 1, 1, 49, 0);
			nextScene(1, 1, 50, 3);
			//S3A1
			script("Its the birthday celebration, there's 2 guys and 3 girls all in formal wear, their smiles are content with their being, you're wondering why you are so alone tonight.", 3, 1);
			script("He makes a funny face and the other guy has an arm around him, the best friend", 3, 1,1);
			script("They probably grew up together, went to the same high school, served together, after they were discharged they studied together", 3, 1, 2);
			nextAct(3,1, 3, 2);
			//S3A2
			script("[MUSIC PLAYER: Don`t Want to Know If You Are - Husker Du]", 3, 2);
			script("Theres one of the whole group, a sociable amount of people of all genders, Some met from the University, some from Highschool, some from alleys of the clubs and some from lonely tram rides with an approachable face.", 3, 2,1);
			script("The girl now, her and another smiling at the camera, in a tent, blue eyes, green eyes, in the afternoon. The outdoors are the places you explore with your adventurous friends, you do this at least twice a year.", 3, 2,2);
			script("There are albums of parties, events for organizations, she's a photographer. A hobbyist pursuit, through this you make many friends, offering to take photos hiding behind the lens. You smile as a queue for those you are photographing to smile as well, its so much easier than telling them every time to smile or say cheese like how your father did. ", 3, 2,3);
			script("You're 23 years old, they make jokes about being too old, it's really a way to say that you are actually really young, but life is moving really fast. You room with 2 of the other girls you met at various events taking photos of them.", 3, 2, 4);
			nextAct(3,2, 5, 3);
			//S3A3
			script("[MUSIC PLAYER: Already Died - Eagles of Death Metal]", 3, 3);
			script("The boy again, arms around a tall blonde, blue eyes, too shy. All your other friends are experienced with women, you don't really know what to do, all you image is the relationship that your parents have, that's what love means to you. You don't understand that there's a transition period, a place where you learn things about the other person.", 3, 3,1);
			script("Its in the morning, he is wearing a sweater and long pants, hair all messed up from just waking up. She probably took that photo in her room, because it's too plain of The Black Keys and Kaiser Chiefs wallpapers, the boys that sing standing still with one hand on their guitars and the other on their cock, they don't know how to make music that is passionate and makes you move.", 3, 3,2);
			script("It's graduation, he's already graduated with an engineering degree, the best friend is there with him. They have been through 3 of the biggest milestones of their lives together. A lot of people wish you success, you are empowered, your mother and father are proud.", 3, 3, 3);
			nextAct(3,3, 4, 4);
			//S3A4
			script("[MUSIC PLAYER: I Know It's Over - The Smiths]", 3, 4);
			script("She's not in this photo, it's of her friends from university, the one in the middle just got engaged at 24. You recognize the shorter girl with the nose piercing, you wish you could get into her account too. In the next 4 shots she comes into the picture, all different pictures. When will you get engaged? How will you meet him, you start to imagine all the fantasies of her meeting him and you meeting her.", 3, 4,1);
			script("You wonder what people your age are doing now, you wish you didn't have to fight for freedom and just accepted the authorities and prison the world lives in. You wish you had never strayed from those boys that played sport during lunch time, because you found out the world wasn't free.", 3, 4,2);
			script("You were embarrassed that everyone else never cared, but thats because they could succeed in the system, those who can't, logically go against it. If you can't fit in, then there must be something wrong with it. Because everyone must be apart of it, total unity, never elitist or exclusive.", 3, 4,3);
			script("This is your life now...this boy and girl are a chimera, you have boxed yourself in. You await calls, just listening to the 3 fuckers that ruined your life and that bigot and racist who drinks champagne in his office and cheats on his wife, with 3 kids, to wake up tomorrow morning with his company exploited.", 3, 4,4);
			script("That's why you are on your own tonight.", 3, 4,5);
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
		 * @param	currentS		The current Scene
		 * @param	currentA		The current Act
		 * @param	finalL			+1 to the last line of the current scene and act
		 * @param	nextA			The desired act to be changed to
		 */
		private function nextAct(currentS:Number,currentA:Number, finalL:Number, nextA:Number):void {
			if (SCENE_NUMBER == currentS && ACT_NUMBER == currentA && LINE_NUMBER == finalL) {
				ACT_NUMBER = nextA;
				LINE_NUMBER = 0;
				trace(ACT_NUMBER);
			}
		}
		
	}

}