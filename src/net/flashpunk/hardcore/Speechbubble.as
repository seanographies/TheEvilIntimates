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
	import scene3.FadeToBlack;
	
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
		private var text_width:Number = 795;
		private var text_height:Number = 1;
		
		private var _sfx:Sfx = new Sfx(GA.RING_SFX);
		private var _music:Sfx = new Sfx(GA.VOYEUR_MUSIC);
		
		private var gm:GameManager = new GameManager;
		
		public static var CHAR_SPEAK:Number = 0;
		
		public static var SCENE_NUMBER:Number = 1;
		public static var ACT_NUMBER:Number = 1;
		public static var LINE_NUMBER:Number = 0;
		
		public function Speechbubble() 
		{
			super(10, 450, graphic, mask);
		}
		
		override public function update():void 
		{
			super.update();
			nextLine();
			playLine();
			handleGM();
			handlePosition();
		}
		
		private function handlePosition():void {
			if (SCENE_NUMBER == 3) {
				this.x = 10;
				this.y = 350;
			}
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
			if (SCENE_NUMBER == 1 && LINE_NUMBER == 47) {
				GC.SCENETICKET++;
				gm.changeScene();
			}
			if (ACT_NUMBER == 5 && LINE_NUMBER == 6) {
				FP.world.add(new FadeToBlack);
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
		 * Constructor. Used to insert the lines of the script, S no. A no. and L no., placed into readLine();
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
			script("If the Apollo Program was a Hoax, my minuscule  faith in humanity will be reduced to absolutely nothing....", 1, 1,4,1);
			script("Gossip spreads like bloody wildfire. I'm not entirely sure who they will be targeting, but it seems like its going be one of those 3-4 year operations for the intimates.", 1, 1,5,2);
			script("Tell me, why would it be a hoax? Propaganda against USSR? They actually went up to the moon but the US Flag they placed down was too small to see from earth so they filmed the landing as a better source of evidence on earth?", 1, 1,6,3);
			script("You know that, if man never landed on the moon, that means we have no hope, humanity is fucked.", 1, 1,7,1);
			script("Well, hopefully the next outfit won't be named SM14.", 1, 1,8,0);
			script("That was such bullshit, what is SM13 anyways, like its some random tag, not even a name.", 1, 1,9,1);
			script("It's not suppose to have any meaning, every generation of intimates has a tag, a totally arbitrary alphanumeric value attached to their specific generation. It's just better to actually give it some meaning, just calling it SM13 makes us feel robotic.", 1, 1,10,2);
			script("As opposed to Skeleton Masks 13?", 1, 1,11,1);
			script("As opposed to 20o.", 1, 1,12,3);
			script("Um....", 1, 1,13,1);
			script("That's what the previous generation was called, 20o.", 1, 1,14,3);
			script("Pffftttt, I thought we were shit. How pathetic.", 1, 1,15,1);
			script("Wait, what? You know this how?", 1, 1,16,2);
			script("There was a readme in my LIGHTNINGSABER.exe", 1, 1,17,3);
			script("Wow, that is really dangerous. How can people just leave traces like that.", 1, 1,18,0);
			script("Feeling better now B?", 1, 1,19,2);
			script("Yup....thanks.....", 1, 1,20,0);
			script("Oh come on guys, we're suppose to make B feel better and all this rubbish isn't helping.", 1, 1,21,2);
			script(" Don't worry, there is nothing to be scared about. Fuck... I don't even know who you are. The system is flawless, decentralized, there's barely a system. Its a mess! There is absolutely no link to us or between.", 1, 1,22,1);
			script("I agree with O, you're scared of them finding you. There are no traces, we don't have traces. We are nothing. This is nothing.", 1, 1,23,3);
			script("Only SM13", 1, 1,24,0);
			script("Whatever the fuck that means.", 1, 1,25,1);
			script("You all burned yet?", 1, 1,26,0);
			script("I was in the process before you called us to lounge.", 1, 1,27,1);
			script("Same, I always leave lounge as the last to burn, that way I can still keep in contact in case of anything.", 1, 1,28,2);
			script("I recommend you do the same B, also arrange the files in descending file size, that way it can burn faster.", 1, 1,29,3);
			script("Ok, thanks. I shouldn't have bothered you guys then....", 1, 1,30,0);
			script("Ahhh, its nothing. You should be fine.... I can hear my dad get ready for work, g2g. Goodbye! Maybe we will meet again in another lounge and time.", 1, 1,31,1);
			script("// Oedipus Disconnected.", 1, 1,32,1);
			script("I'm going to take that as my queue, I wish you two all the best, I couldn't  have asked for a better group of individuals to collaborate with. Take care and good night/morning/afternoon/evening wherever you are, slumped over a laptop in a dark room.", 1, 1,33,2);
			script("Ok bye M!", 1, 1,34,0);
			script("Likewise, all the best M.", 1, 1,35,3);
			script("// Mother Leopard Disconnected.", 1, 1,36,2);
			script("Well....I don't really know what to say. I'm not good at this, expressing myself, all I know is some piece of paper is all I need to survive in this society, saying that I'm a good boy that does my homework.", 1, 1,37,3);
			script("You have taught me a lot G, I treat you like a mentor, I respect you a lot.", 1, 1,38,0);
			script("I think I know what to say now. You'll be fine, trust me.... you will be. It's overwhelming, its scary, its exhilarating. We did it for the cause, whatever that may be for you. This is just a spark, of what is to come. Things will change...no...they have changed. That old bigot fuck is going to wake up tomorrow....and....he will be ruined, all the lies, the corruption, shown to the world. The truth is out.", 1, 1,39,3);
			script("I understand. G, did you transfer the ROM's?", 1, 1,40,0);
			script("Yes I did...I don't really want to know what relations you have with this man and woman and what you want to do with their profiles... But....I tried to maintain as much anonymity between us as I could while hacking it, hopefully it's enough.", 1, 1,41,3);
			script("It's alright, they are just strangers.", 1, 1,42,0);
			script("Well, I trust you to be fine. Take good care and may the force be with you.", 1, 1,43,3);
			script("hahah, thanks. You keep well too.", 1, 1,44,0);
			script("// Godfather Disconnected.", 1, 1,45,3);
			script("// Belial Disconnected.", 1, 1,46,0);
			script("[LOGGED IN]", 1, 1, 47, 0);
			nextScene(1, 1, 48, 3);
			//S3A1
			script("Its the birthday celebration, there's 2 guys and 3 girls all in formal wear, their smiles are content with their being, you're wondering why you are so alone tonight.", 3, 1);
			script("He makes a funny face and the other guy has an arm around him, the best friend", 3, 1,1);
			script("They probably grew up together, went to the same high school, served together, and after, they studied together.", 3, 1, 2);
			nextAct(3,1, 3, 2);
			//S3A2
			script("[MUSIC PLAYER: Don`t Want to Know If You Are Lonely - Husker Du]", 3, 2);
			script("Theres one of the whole group, a sociable amount of people of all genders, Some met from the University, some from Highschool, some from alleys of the clubs and some from lonely tram rides with an approachable face.", 3, 2,1);
			script("The girl now, her and another smiling at the camera, in a tent, blue eyes, green eyes, in the afternoon. The outdoors are the places you explore with your adventurous friends.", 3, 2,2);
			script("There are albums of parties, events for organizations, she's a photographer. A hobby, through this you make many friends, offering to take photos hiding behind the lens. You smile as a queue for those you are photographing to smile as well, its so much easier than telling them every time to smile or say cheese like how your father did.", 3, 2,3);
			script("You're 23 years old, they make jokes about being too old, it's really a way to say that you are actually really young, but life is moving really fast.", 3, 2, 4);
			nextAct(3,2, 5, 3);
			//S3A3
			script("[MUSIC PLAYER: In Sadding Around - Jawbreaker]", 3,3);
			script("Theres a photo of her in a leather jacket with a Nirvana shirt and another friend with Sonic Youth's Goo. The one that listens to Sonic Youth has a cigarette between her fingers, trying to emulate Kim Gordon.", 3,3,1);
			script("She introduces you to new music, all you ever listened to was pop girls, catchy lyrics, about boys, girls and love.", 3,3,2);
			script("Theres two boys on the bed with her, they are laughing one is getting  tackled by the other. You don't really spend a lot of time with boys, your friends  seem to know a lot more about them than you do. Maybe you were sick the day at school when they had a lesson on 'The opposite gender'.", 3, 3, 3);
			nextAct(3, 3, 4, 4);
			//S3A4
			script("[MUSIC PLAYER: Already Died - Eagles of Death Metal]", 3, 4);
			script("The boy again, arms around a tall blonde, blue eyes, too shy. All your other friends are experienced with women, you don't really know what to do, all you image is the relationship that your parents have, that's what relationships mean to you. ", 3, 4,1);
			script("Its in the morning, he is wearing a jumper and long pants, hair all messed up from just waking up. She probably took that photo in her room, because it's too plain of The Black Keys and Kaiser Chiefs posters, the boys that sing standing idle with one hand on their guitars and the other on their crotch.  They don't know how to make music that is passionate and makes you move.", 3, 4,2);
			script("It's graduation, he's graduated with an engineering degree, the best friend is there with him. They have been through 3 of the biggest milestones of their lives together. A lot of people wish you success, you are empowered, your mother and father are proud of you.", 3, 4, 3);
			nextAct(3, 4, 4,5);
			//S3A5
			script("[MUSIC PLAYER: I Know It's Over - The Smiths]", 3, 5);
			script("She's not in this photo, it's of her friends from university, the one in the middle just got engaged at 24. You recognize the shorter girl with the nose piercing, you wish you could get into her account too. In the next 4 shots she comes into the picture. When will you get engaged? How will you meet him, you start to imagine all the fantasies of her meeting him and you meeting her.", 3, 5,1);
			script("You wonder what people your age are doing now, you wish you didn't have to do this and just accepted the prison the world lives in. You wish you had never strayed from those kids that played sport during lunch time, because you found out the world wasn't free.", 3, 5,2);
			script("You were embarrassed that everyone else never cared, but thats because they could succeed in the system, those who can't, logically go against it. If you can't fit in, then there must be something wrong with the system that is in place. Because everyone must be apart of it, total unity, never elitist or exclusive.", 3, 5,3);
			script("This is your life now...this boy and girl are a chimera you have boxed yourself in. You await calls, just listening to the 3 fuckers that may have ruined your life and that bigot and racist who drinks champagne in his office and cheats on his wife, with 3 kids, to wake up tomorrow morning exploited, taste of his own medicine.", 3, 5,4);
			script("That's why you are on your own tonight.", 3, 5,5);
			script(" ", 3, 5,6);
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