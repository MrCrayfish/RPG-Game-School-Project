﻿package {	import flash.display.Bitmap;	import flash.display.BitmapData;	import flash.geom.Rectangle;	import flash.geom.Point;	import flash.ui.Keyboard;	import flash.text.TextField;	public class Player	{		private var main:Main;		private var playerLayer:BitmapData;		private var playerDir:int;		private var playerSprite:Bitmap;		public var playerX:Number = 7.5 * 8;		public var playerY:Number = 7.5 * 8;		private var playerSpeed:Number = 4;		public function Player(main:Main, playerLayer:BitmapData)		{			this.main = main;			this.playerLayer = playerLayer;			this.playerSprite = GameSprite.playerD.getSprite();		}		public function updatePosition()		{			if (main.keyHandler.keys[16] == true)			{				playerSpeed = 8;			}			else			{				playerSpeed = 4;			}			if (main.keyHandler.keys[Keyboard.S] == true)			{				this.clearPlayerRender();				if (! collision(0,playerSpeed))				{					main.screen.moveMap(0, -playerSpeed);					playerY +=  playerSpeed;				}				renderPlayer();			}			if (main.keyHandler.keys[Keyboard.W] == true)			{				this.clearPlayerRender();				if (! collision(0,0 - playerSpeed))				{					main.screen.moveMap(0, +playerSpeed);					playerY -=  playerSpeed;				}				renderPlayer();			}			if (main.keyHandler.keys[Keyboard.D] == true)			{				this.clearPlayerRender();				if (! collision(playerSpeed,0))				{					main.screen.moveMap(-playerSpeed, 0);					playerX +=  playerSpeed;				}				renderPlayer();			}			if (main.keyHandler.keys[Keyboard.A] == true)			{				this.clearPlayerRender();				if (! collision( -  playerSpeed,0))				{					main.screen.moveMap(playerSpeed, 0);					playerX -=  playerSpeed;				}				renderPlayer();			}		}		public function processKey(keyCode:uint):void		{			if (keyCode == Keyboard.K)			{				GameSprite.renderStandalone(GameSprite.bush_1, getPlayerX(), getPlayerY(), main.screen.objectLayer);			}			if (keyCode == Keyboard.E)			{			}		}		public function handleInteraction(x:int, y:int):void		{			var clickX:int = ((playerX + x ) - 7.5 * 32) / 32;			var clickY:int = ((playerY + y) - 7.5 * 32) / 32;			var difX:int = (clickX - getPlayerX()) * (clickX - getPlayerX());			var difY:int = (clickY - getPlayerY()) * (clickY - getPlayerY());			var distance:Number = Math.sqrt(difX + difY);			if (Math.floor(distance) <= 1)			{				var object:Overlay = main.currentLevel.getObject(clickX,clickY);				if (object != null)				{					object.onUse(this);				}			}		}		public function collision(x:int, y:int):Boolean		{			var solid:Boolean = false;			for (var c = 0; c < 4; c++)			{				var xt:Number = ((playerX + x) + (c % 2) * 12 + 10) / 32;				var yt:Number = ((playerY + y) + (c / 2) * 8 + 16) / 32;				if (c == 2)				{					yt +=  0.2;				}				if (c == 1)				{					yt -=  0.05;				}				if (xt < 0.1 || xt > main.currentLevel.levelImage.width - 0.1)				{					return true;				}				if (yt < 0.5 || yt > main.currentLevel.levelImage.height)				{					return true;				}				if (main.currentLevel.getTile(Math.floor(xt),Math.floor(yt)).isSolid())				{					trace("Collision @ " + Math.floor(xt) + " " + Math.floor(yt));					return true;				}			}			return solid;		}		public function getCoordInFront():Location		{			var loc:Location;			switch (playerDir)			{			}			return loc;		}		public function getPlayerX():int		{			return Math.floor(playerX + 0.5 * 32) / 32;		}		public function getPlayerY():int		{			return Math.floor(playerY + 0.5 * 32) / 32;		}		public function setPlayerX(posX:int):void		{			playerX = posX * 32;			main.screen.setMapX(7.5 * 32 - playerX);		}		public function setPlayerY(posY:int):void		{			playerY = posY * 32;			main.screen.setMapY(7.5 * 32 - playerY);		}		public function teleport(level:Level, x:int, y:int)		{			main.currentLevel = level;			level.renderLevel(main.screen);			clearPlayerRender();			setPlayerX(x);			setPlayerY(y);			renderPlayer();		}		private var transparent:BitmapData = new BitmapData(16,16,true,0x00000000);		public function clearPlayerRender()		{			playerLayer.copyPixels(transparent, new Rectangle(0, 0, 16, 16), new Point(7.5 * 16,7.5 * 16));		}		public function renderPlayer()		{			var xPos:Number = main.stage.mouseX;			var yPos:Number = main.stage.mouseY;			var angle:Number = (Math.atan2(yPos-256, xPos-256) * 180 / Math.PI + 180);			switch (parseAngle(angle))			{				case 0 :					playerSprite = GameSprite.playerU.getSprite();					break;				case 1 :					playerSprite = GameSprite.playerR.getSprite();					break;				case 2 :					playerSprite = GameSprite.playerD.getSprite();					break;				case 3 :					playerSprite = GameSprite.playerL.getSprite();					break;			}			playerLayer.copyPixels(playerSprite.bitmapData, new Rectangle(0, 0, 16, 16), new Point(7.5 * 16, 7.5 * 16));		}		public function parseAngle(angle:Number):int		{			if (angle > 45 && angle <= 135)			{				return 0;			}			if (angle > 135 && angle <= 225)			{				return 1;			}			if (angle > 225 && angle <= 315)			{				return 2;			}			return 3;		}	}}