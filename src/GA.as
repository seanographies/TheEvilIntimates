package  
{
	/**
	 * ...
	 * @author sean singh
	 */
	public class GA 
	{
		//Title Screen
		[Embed(source = "../assets/TITLE_SCREEN.fw.png")] public static const TITLE_SCREEN_BG:Class;
		[Embed(source = "../assets/EVIL_INTIMATE.fw.png")] public static const EVIL_INTIMATE:Class;
		[Embed(source = "../assets/sfx/titlescreen.mp3")] public static const TITLESCREEN_SFX:Class;
		//Scene 1
		[Embed(source = "../assets/EI_Spritesheet.fw.png")] public static const EI_SPRITESHEET:Class;
		[Embed(source = "../assets/sfx/ringnew_01.mp3")] public static const RING_SFX:Class;
		//Scene 4
		[Embed(source = "../assets/voyeur_bg_spritesheet.png")] public static const VOYEUR_BG_SPRITESHEET:Class;
		//SONAR, Schema #1
		[Embed(source = "../assets/sonar_bg_spritesheet.fw.png")] public static const SONAR_BG_SPRITESHEET:Class;
		[Embed(source = "../assets/sonar_sprites.fw.png")] public static const SONAR_SPRITESHEET:Class;
		[Embed(source = "../assets/cursor_sprite.fw.png")] public static const CURSOR_IMAGE:Class;
		[Embed(source = "../assets/binocular_person.fw.png")] public static const BINOCULARS_SPRITE:Class;
		[Embed(source = "../assets/sonar_seeker.fw.png")] public static const SONAR_SEEKER:Class;
		[Embed(source = "../assets/obj_mask.fw.png")]  public static const OBJ_1:Class;
		[Embed(source = "../assets/obj_2.fw.png")] public static const OBJ_2:Class;
		[Embed(source = "../assets/obj_3.fw.png")] public static const OBJ_3:Class;
		[Embed(source = "../assets/obj_4.fw.png")] public static const OBJ_4:Class;
		[Embed(source="../assets/cursor_cover128.fw.png")] public static const CURSOR_COVER:Class;
		[Embed(source = "../assets/cursor_cover64.fw.png")] public static const CURSOR_COVER64:Class;
		[Embed(source = "../assets/cursor_cover32.fw.png")] public static const CURSOR_COVER32:Class;
		[Embed(source = "../assets/cursor_cover16.fw.png")] public static const CURSOR_COVER16:Class;
		//Levels
		[Embed(source = "../levels/SchemaOne.oel", mimeType = "application/octet-stream")] public static const SCHEMAONE_LEVEL:Class;
		[Embed(source = "../levels/Titlescreen.oel", mimeType = "application/octet-stream")] public static const TITLESCREEN_LEVEL:Class;
		[Embed(source = "../levels/Lounge.oel", mimeType = "application/octet-stream")] public static const LOUNGE_LEVEL:Class;
		[Embed(source = "../levels/Voyeur.oel", mimeType = "application/octet-stream")] public static const VOYEUR_LEVEL:Class;
	}

}