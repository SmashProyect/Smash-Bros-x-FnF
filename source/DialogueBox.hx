package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitMiddle:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'shunshine':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'the-world-of-mario':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'jump-up':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'jungle-rap':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'kong-country':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'gangplank-galleon':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'song-of-storms':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'gerudo':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'the-hero-of-time':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'flower-garden':
				FlxG.sound.playMusic(Paths.music('SmashMenu'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);

			case 'shunshine':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
			case 'the-world-of-mario':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
			case 'jump-up':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
			case 'jungle-rap':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
			case 'kong-country':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
			case 'gangplank-galleon':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
			case 'song-of-storms':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
			case 'gerudo':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
			case 'the-hero-of-time':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
			case 'flower-garden':
				hasDialog = true;
				
				box = new FlxSprite(-300, 390);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 15, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [8], "", 15);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitLeft = new FlxSprite(30, 75);
		portraitLeft.frames = Paths.getSparrowAtlas('lol/senpaiPortrait');
		portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;
		
		portraitRight = new FlxSprite(840, 60);
		portraitRight.frames = Paths.getSparrowAtlas('lol/bfPortrait');
		portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;
	
		portraitMiddle = new FlxSprite(425, 75);
		portraitMiddle.frames = Paths.getSparrowAtlas('lol/Portrait');
		portraitMiddle.animation.addByPrefix('enter', 'Girlfriend portrait enter', 24, false);
		portraitMiddle.updateHitbox();
		portraitMiddle.scrollFactor.set();
		add(portraitMiddle);
		portraitMiddle.visible = false;
		
		box.animation.play('normalOpen');
		if(PlayState.curStage != "ZonaYoshiN")if(PlayState.curStage != "ZonaYoshiM")if(PlayState.curStage != "ZonaYoshiD")if(PlayState.curStage != "TemploTiempoN")if(PlayState.curStage != "TemploTiempoM")if(PlayState.curStage != "TemploTiempoD")if(PlayState.curStage != "DKHouseD")if(PlayState.curStage != "DKHouseM")if(PlayState.curStage != "DKHouseN")if(PlayState.curStage != "MarioHouseN")if(PlayState.curStage != "MarioHouseM")if(PlayState.curStage != "MarioHouseD")box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 38);
		dropText.font = 'Kid Games';
		dropText.color = 0xFF000000;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 38);
		swagDialogue.font = 'Kid Games';
		swagDialogue.color = 0xFF000000;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		switch (curCharacter)
		{
			case 'bf':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelBText'), 0.6)];
			case 'System':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('SystemText'), 0.6)];
			case 'BF':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('bfText'), 0.6)];
			case 'BFUhh':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('bfText'), 0.6)];
			case 'GFCheer':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('gfText'), 0.6)];
			case 'GFTalk':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('gfText'), 0.6)];
			case 'GFScared':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('gfText'), 0.6)];
			case 'GFMajoraTalk':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('gfText'), 0.6)];
			case 'Mario':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('MarioText'), 0.6)];
			case 'MarioSad':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('MarioText'), 0.6)];
			case 'DK':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('DKText'), 0.6)];
			case 'Link':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('LinkText'), 0.6)];
			case 'LinkSad':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('LinkText'), 0.6)];
			case 'Yoshi':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('YoshiText'), 0.6)];
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'System':
				portraitMiddle.visible = false;
				portraitRight.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/System');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'BF':
				portraitMiddle.visible = false;
				portraitLeft.visible = false;
				portraitRight.frames = Paths.getSparrowAtlas('portraits/BF');
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'BFUhh':
				portraitMiddle.visible = false;
				portraitLeft.visible = false;
				portraitRight.frames = Paths.getSparrowAtlas('portraits/BFUhh');
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'GFCheer':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitMiddle.frames = Paths.getSparrowAtlas('portraits/GFCheer');
				if (!portraitMiddle.visible)
				{
					portraitMiddle.visible = true;
					portraitMiddle.animation.play('enter');
				}	
			case 'GFTalk':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitMiddle.frames = Paths.getSparrowAtlas('portraits/GFTalk');
				if (!portraitMiddle.visible)
				{
					portraitMiddle.visible = true;
					portraitMiddle.animation.play('enter');
				}
			case 'GFScared':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitMiddle.frames = Paths.getSparrowAtlas('portraits/GFScared');
				if (!portraitMiddle.visible)
				{
					portraitMiddle.visible = true;
					portraitMiddle.animation.play('enter');
				}	
			case 'GFMajoraTalk':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitMiddle.frames = Paths.getSparrowAtlas('portraits/GFMajoraTalk');
				if (!portraitMiddle.visible)
				{
					portraitMiddle.visible = true;
					portraitMiddle.animation.play('enter');
				}	
			case 'Mario':
				portraitMiddle.visible = false;
				portraitRight.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/Mario');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'MarioSad':
				portraitMiddle.visible = false;
				portraitRight.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/MarioSad');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'DK':
				portraitMiddle.visible = false;
				portraitRight.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/DK');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}	
			case 'Link':
				portraitMiddle.visible = false;
				portraitRight.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/Link');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}	
			case 'LinkSad':
				portraitMiddle.visible = false;
				portraitRight.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/LinkSad');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}	
			case 'Yoshi':
				portraitMiddle.visible = false;
				portraitRight.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('portraits/Yoshi');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}	
			

		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
