﻿package {	import flash.events.KeyboardEvent;	import flash.display.Stage;	public class KeyHandler	{		public var keys:Array = new Array();		private var player:Player;		public function KeyHandler(stage:Stage, player:Player)		{			this.player = player;			stage.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown);			stage.addEventListener(KeyboardEvent.KEY_UP,handleKeyUp);		}		public function handleKeyUp(e:KeyboardEvent):void		{			trace("Releasing key " + e.keyCode);			keys[e.keyCode] = false;		}		public function handleKeyDown(e:KeyboardEvent):void		{			trace("Pressing key " + e.keyCode);			if (keys[e.keyCode] == false)			{				player.processKey(e.keyCode);			}			keys[e.keyCode] = true;		}	}}