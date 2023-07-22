package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState {
	public static var FNFUltimateVersion:String = '1.0';
	public static var psychEngineVersion:String = '0.6.3';
	public static var curSelected:Int = 0;

	var gfDance:FlxSprite;
	var danceLeft:Bool = false;


	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	

	// Options List Array
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'credits',
		'options'
	];

	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;

	override function create() {
		#if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end
		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('MainMenu'));
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;

		// UI CODE!

		// Story Mode

		var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;

		var menuItem:FlxSprite = new FlxSprite(100, 100);

		menuItem.scale.x = scale * 2;

		menuItem.scale.y = scale * 2;

		menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[0]);

		menuItem.animation.addByPrefix('idle', optionShit[0] + " basic", 24);

		menuItem.animation.addByPrefix('selected', optionShit[0] + " white", 24);

		menuItem.animation.play('idle');

		menuItem.ID = 0;

		menuItem.setGraphicSize(Std.int(menuItem.width * 0.70));

		menuItems.add(menuItem);

		var scr:Float = (optionShit.length - 4) * 0.135;

		if (optionShit.length < 6) scr = 0;

		menuItem.scrollFactor.set(0, scr);

		menuItem.antialiasing = ClientPrefs.globalAntialiasing;

		menuItem.updateHitbox();

		// FreePlay Mode

		offset = 108 - (Math.max(optionShit.length, 4) - 4) * 80;

		menuItem = new FlxSprite(100, 250);

		menuItem.scale.x = scale * 2;

		menuItem.scale.y = scale * 2;

		menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[1]);

		menuItem.animation.addByPrefix('idle', optionShit[1] + " basic", 24);

		menuItem.animation.addByPrefix('selected', optionShit[1] + " white", 24);

		menuItem.animation.play('idle');

		menuItem.ID = 1;

		menuItem.setGraphicSize(Std.int(menuItem.width * 0.70));

		menuItems.add(menuItem);

		scr = (optionShit.length - 4) * 0.135;

		if (optionShit.length < 6) scr = 1;

		menuItem.scrollFactor.set(1, scr);

		menuItem.antialiasing = ClientPrefs.globalAntialiasing;

		menuItem.updateHitbox();

		// Credits

		offset = 108 - (Math.max(optionShit.length, 4) - 4) * 80;

		menuItem = new FlxSprite(100, 400);

		menuItem.scale.x = scale * 2;

		menuItem.scale.y = scale * 2;

		menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[2]);

		menuItem.animation.addByPrefix('idle', optionShit[2] + " basic", 24);

		menuItem.animation.addByPrefix('selected', optionShit[2] + " white", 24);

		menuItem.animation.play('idle');

		menuItem.ID = 2;

		menuItem.setGraphicSize(Std.int(menuItem.width * 0.70));

		menuItems.add(menuItem);

		scr = (optionShit.length - 4) * 0.135;

		if (optionShit.length < 6) scr = 2;

		menuItem.scrollFactor.set(2, scr);

		menuItem.antialiasing = ClientPrefs.globalAntialiasing;

		menuItem.updateHitbox();

		// Options

		offset = 108 - (Math.max(optionShit.length, 4) - 4) * 80;

		menuItem = new FlxSprite(100, 550);

		menuItem.scale.x = scale * 2;

		menuItem.scale.y = scale * 2;

		menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[3]);

		menuItem.animation.addByPrefix('idle', optionShit[3] + " basic", 24);

		menuItem.animation.addByPrefix('selected', optionShit[3] + " white", 24);

		menuItem.animation.play('idle');

		menuItem.ID = 3;

		menuItem.setGraphicSize(Std.int(menuItem.width * 0.70));

		menuItems.add(menuItem);

		scr = (optionShit.length - 4) * 0.135;

		if (optionShit.length < 6) scr = 3;

		menuItem.scrollFactor.set(3, scr);

		menuItem.antialiasing = ClientPrefs.globalAntialiasing;

		menuItem.updateHitbox();

		// GF CODE!

		var gfDance:FlxSprite; // to put the gf on the menu mme

		var danceLeft:Bool = false;

		// Gf Main Menu
		gfDance = new FlxSprite(FlxG.width * 0.4, FlxG.height * 0.07);
		gfDance.frames = Paths.getSparrowAtlas('gfDanceTitle');
		gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, true);
		add(gfDance);
		gfDance.setGraphicSize(750, 700);
		if (gfDance != null) {
			danceLeft = !danceLeft;
			if (danceLeft) gfDance.animation.play('danceLeft');
		}

		//FlxG.camera.follow(camFollowPos, null, 1);

		// Version information
		var versionShit:FlxText = new FlxText(12, FlxG.height - 68, 0, "FNFUltimate " + FNFUltimateVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		versionShit = new FlxText(12, FlxG.height - 44, 0, "PsychEngine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		versionShit = new FlxText(12, FlxG.height - 24, 0, "FNF' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float) {
		if (FlxG.sound.music.volume < 0.8) {
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			if (FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (!selectedSomethin) {
			if (controls.UI_UP_P) {
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P) {
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK) {
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT) {
				if (optionShit[curSelected] == 'donate') {
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				} else {
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite) {
						if (curSelected != spr.ID) {
							FlxTween.tween(spr, { alpha: 0 }, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween) {
									spr.kill();
								}
							});
						} else {
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker) {
								var daChoice:String = optionShit[curSelected];

								switch (daChoice) {
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new options.OptionsState());
									/*
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									*/
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys)) {
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0) {
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite) {
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected) {
				spr.animation.play('selected');
				var add:Float = 0;
				if (menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}
}


