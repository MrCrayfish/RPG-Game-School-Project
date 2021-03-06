﻿package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.StageScaleMode;
	import flash.ui.Mouse;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;

	public class Main extends Sprite
	{
		public var screen:Screen;
		public var keyHandler:KeyHandler;
		public var mouseHandler:MouseHandler;
		public var currentLevel:Level;
		public var player:Player;
		public var levelData:LevelData;
		
		public var textField:TextField = new TextField();
		public var mouse:BitmapData;
		public var mouseBitmap:Bitmap;

		public function Main()
		{
			initialise();
			registerInput();
			registerListeners();
			addComponents();
			currentLevel.renderLevel(screen);
			Mouse.hide();
		}

		private function initialise():void
		{
			currentLevel = Level.testMap;
			screen = new Screen(this);

			player = new Player(this,screen.playerLayer);
			player.setPlayerX(5);
			player.setPlayerY(5);
			player.renderPlayer();

			textField.textColor = 16777215;
			textField.scaleX = textField.scaleY = 2;
			textField.width = 512;

			mouseBitmap = new Bitmap(GameSprite.mouse_normal_1.getSprite().bitmapData.clone());
		}

		private function registerInput():void
		{
			keyHandler = new KeyHandler(stage,player);
			mouseHandler = new MouseHandler(stage,player);
		}

		private function registerListeners():void
		{
			stage.addEventListener(Event.ENTER_FRAME,update);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, updateMouse);
			stage.addEventListener(MouseEvent.CLICK, tracePos);
		}

		private function addComponents():void
		{
			addChild(textField);
			addChild(mouseBitmap);
		}

		public function setLevel(newLevel:Level)
		{
			this.currentLevel = newLevel;
		}

		public function update(e:Event):void
		{
			player.updatePosition();
		}

		public function updateMouse(e:MouseEvent):void
		{
			mouseBitmap.x = e.stageX - 8;
			mouseBitmap.y = e.stageY - 8;

			var mCoordX:int = (-screen.mapX + mouseBitmap.x + 8) / 32;
			var mCoordY:int = (-screen.mapY + mouseBitmap.y + 8) / 32;

			var object:Overlay = currentLevel.getObject(mCoordX,mCoordY);
			if (object != null && object.isSelectable())
			{
				this.mouseBitmap.bitmapData = GameSprite.mouse_normal_3.getSprite().bitmapData.clone();
			}
			else
			{
				this.mouseBitmap.bitmapData = GameSprite.mouse_normal_1.getSprite().bitmapData.clone();
			}
		}

		public function tracePos(e:MouseEvent):void
		{
			var mCoordX:int = (-screen.mapX + mouseBitmap.x + 8) / 32;
			var mCoordY:int = (-screen.mapY + mouseBitmap.y + 8) / 32;
			trace(mCoordX + " " + mCoordY);
		}
	}

}