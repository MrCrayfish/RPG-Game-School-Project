package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.text.TextField;

	public class Player
	{

		var main:Main;
		var playerLayer:BitmapData;

		var dir:int;
		var playerSprite:Bitmap;

		public var playerX:Number = 7.5 * 8;
		public var playerY:Number = 7.5 * 8;

		public function Player(main:Main, playerLayer:BitmapData)
		{
			this.main = main;
			this.playerLayer = playerLayer;
			this.playerSprite = GameSprite.playerD.getSprite();
		}

		private var playerSpeed:Number = 4;

		public function updatePosition()
		{
			if (main.keyHandler.keys[Keyboard.R] == true)
			{
				playerSpeed = 8;
			}
			else
			{
				playerSpeed = 4;
			}
			if (main.keyHandler.keys[Keyboard.DOWN] == true)
			{
				playerSprite = GameSprite.playerD.getSprite();
				this.clearPlayerRender();
				if (! collision(0,playerSpeed))
				{
					main.screen.moveMap(0, -playerSpeed);
					playerY +=  playerSpeed;
				}
				renderPlayer();
			}
			if (main.keyHandler.keys[Keyboard.UP] == true)
			{
				playerSprite = GameSprite.playerU.getSprite();
				this.clearPlayerRender();
				if (! collision(0,0 - playerSpeed))
				{
					main.screen.moveMap(0, +playerSpeed);
					playerY -=  playerSpeed;
				}
				renderPlayer();
			}
			if (main.keyHandler.keys[Keyboard.RIGHT] == true)
			{
				playerSprite = GameSprite.playerR.getSprite();
				this.clearPlayerRender();
				if (! collision(playerSpeed,0))
				{
					main.screen.moveMap(-playerSpeed, 0);
					playerX +=  playerSpeed;
				}
				renderPlayer();
			}
			if (main.keyHandler.keys[Keyboard.LEFT] == true)
			{
				playerSprite = GameSprite.playerL.getSprite();
				this.clearPlayerRender();
				if (! collision( -  playerSpeed,0))
				{
					main.screen.moveMap(playerSpeed, 0);
					playerX -=  playerSpeed;
				}
				renderPlayer();
			}
		}

		public function collision(x:int, y:int):Boolean
		{
			var solid:Boolean = false;
			for (var c = 0; c < 4; c++)
			{
				var xt:Number = ((playerX + x) + (c % 2) * 12 + 10) / 32;
				var yt:Number = ((playerY + y) + (c / 2) * 8 + 16) / 32;
				if (c == 2)
				{
					yt +=  0.2;
				}
				if (c == 1)
				{
					yt -=  0.05;
				}
				if(xt < 0.1 || xt > main.currentLevel.levelImage.width - 0.1)
				{
					return true;
				}
				if(yt < 0.5 || yt > main.currentLevel.levelImage.height)
				{
					return true;
				}
				if (main.currentLevel.getTile(Math.floor(xt),Math.floor(yt)).isSolid())
				{
					trace("Collision @ " + Math.floor(xt) + " " + Math.floor(yt));
					return true;
				}
			}
			return solid;
		}

		private var transparent:BitmapData = new BitmapData(16,16,true,0x00000000);

		public function clearPlayerRender()
		{
			playerLayer.copyPixels(transparent, new Rectangle(0, 0, 16, 16), new Point(7.5 * 16,7.5 * 16));
		}

		public function renderPlayer()
		{
			playerLayer.copyPixels(playerSprite.bitmapData, new Rectangle(0, 0, 16, 16), new Point(7.5 * 16, 7.5 * 16));
		}

		public function getPlayerX():int
		{
			return Math.floor(playerX + 0.5 * 32) / 32;
		}

		public function getPlayerY():int
		{
			return Math.floor(playerY + 0.5 * 32) / 32;
		}

		public function setPlayerX(posX:int):void
		{
			playerX = posX * 32;
			main.screen.setMapX(7.5 * 32 - playerX);
		}

		public function setPlayerY(posY:int):void
		{
			playerY = posY * 32;
			main.screen.setMapY(7.5 * 32 - playerY);
		}
		

	}

}