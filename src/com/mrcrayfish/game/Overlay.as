﻿package {	import flash.display.Bitmap;	import flash.display.BitmapData;	import flash.geom.Rectangle;	import flash.geom.Point;	public class Overlay	{		private var tileSprite:Bitmap;		public var solid:Boolean = false;		public var specialRender:Boolean = false;		protected var xOffset:int = 0;		protected var yOffset:int = 0;		public static var inivisible:Overlay = new Overlay(GameSprite._air.getSprite(),true);		public static var wooden_door:Overlay = new Overlay(GameSprite.wooden_door.getSprite(),true);		public static var flower_1:Overlay = new Overlay(GameSprite.flower_1.getSprite(),false);		public static var flower_2:Overlay = new Overlay(GameSprite.flower_2.getSprite(),false);		public static var flower_3:Overlay = new Overlay(GameSprite.flower_3.getSprite(),false);		public static var flower_4:Overlay = new Overlay(GameSprite.flower_4.getSprite(),false);		public static var flower_5:Overlay = new Overlay(GameSprite.flower_5.getSprite(),false);		public static var flower_6:Overlay = new Overlay(GameSprite.flower_6.getSprite(),false);		public static var bush_1:Overlay = new Overlay(GameSprite.bush_1.getSprite(),false);		public static var bush_2:Overlay = new Overlay(GameSprite.bush_2.getSprite(),false);		public static var bush_3:Overlay = new Overlay(GameSprite.bush_3.getSprite(),false);		public static var charlotte_flower:Overlay = new Overlay(GameSprite.charlotte_flower.getSprite(),false);		public static var charlotte_shroom:Overlay = new Overlay(GameSprite.charlotte_shroom.getSprite(),false);		public static var tree:Overlay = new Overlay(GameSprite.tree.getSprite(),false).setOffset(0,-16);		public static var tree_2:Overlay = new Overlay(GameSprite.tree_2.getSprite(),true).setOffset(-8,-16).setSpecialRender(true);		public static var tree_3:Overlay = new Overlay(GameSprite.tree_3.getSprite(),true).setOffset(-8,-16).setSpecialRender(true);		public static var well:Overlay = new Overlay(GameSprite.well.getSprite(),true);		public static var sign:Overlay = new Overlay(GameSprite.sign.getSprite(),false);		public static var storeWeapons:Overlay = new Overlay(GameSprite.storeWeapons.getSprite(),false);		public static var storeGeneral:Overlay = new Overlay(GameSprite.storeGeneral.getSprite(),false);		public static var storeInn:Overlay = new Overlay(GameSprite.storeInn.getSprite(),false);		public static var storeArmoury:Overlay = new Overlay(GameSprite.storeArmoury.getSprite(),false);		public static var storeBlank:Overlay = new Overlay(GameSprite.storeBlank.getSprite(),false);		public static var fence:Overlay;				public static var barrel:Overlay = new Overlay(GameSprite.barrel.getSprite(),true);		public static var barrel_stack:Overlay = new Overlay(GameSprite.barrel_stack.getSprite(),true).setOffset(0, -16).setSpecialRender(true);;		public static var crate:Overlay = new Overlay(GameSprite.crate.getSprite(),true);		public static var crate_stack:Overlay = new Overlay(GameSprite.crate_stack.getSprite(),true).setOffset(0, -16).setSpecialRender(true);		public static var bed:Overlay = new Overlay(GameSprite.bed.getSprite(),true);		public function Overlay(sprite:Bitmap, solid:Boolean)		{			this.tileSprite = sprite;			this.solid = solid;		}		public function setOffset(x:int, y:int):Overlay		{			this.xOffset = x;			this.yOffset = y;			return this;		}		public function setSpecialRender(flag:Boolean):Overlay		{			this.specialRender = flag;			return this;		}		public function onUse(player:Player)		{			//player.teleport(new LevelCommonHouse(), 1, 2);		}		public function isSelectable():Boolean		{			return false;		}		public function isSolid():Boolean		{			return solid;		}		public function renderObject(level:Level, x:int, y:int, layer:BitmapData, topLayer:BitmapData)		{			if (specialRender)			{				layer.copyPixels(tileSprite.bitmapData, new Rectangle(0, 16, tileSprite.width, tileSprite.height), new Point(x * 16 + xOffset, y * 16 + yOffset + 16), null, null, true);				topLayer.copyPixels(tileSprite.bitmapData, new Rectangle(0, 0, tileSprite.width, 16), new Point( x * 16 + xOffset, y * 16 + yOffset), null, null, true);			}			else			{				layer.copyPixels(tileSprite.bitmapData, new Rectangle(0, 0, tileSprite.width, tileSprite.height), new Point( x * 16 + xOffset, y * 16 + yOffset), null, null, true);			}		}	}	Overlay.fence = new ObjectWoodenFence().setOffset(0, -1);}