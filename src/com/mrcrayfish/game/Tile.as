﻿package {	import flash.display.Bitmap;	import flash.display.BitmapData;	import flash.geom.Rectangle;	import flash.geom.Point;	public class Tile	{		private static var tiles:Array = new Array();				public static var _void:Tile = new Tile("void",GameSprite._void,false,14024703);		public static var _air:Tile = new Tile("air",GameSprite._air,false,0);		public static var grass:Tile = new Tile("grass",GameSprite.grass,false,5018112);		public static var dirt:Tile = new Tile("dirt",GameSprite.dirt,false,8152392);		public static var stone:Tile = new Tile("stone",GameSprite.stone,true,10066329);		public static var wood:Tile = new Tile("wood",GameSprite.wood,true,1000);		public static var water:Tile = new Tile("water",GameSprite.water,false,29380);		public static var wooden_wall:Tile;		public var name:String;		private var solid:Boolean;		private var tileSprite:Bitmap;		public var pixelCol:uint;		public function Tile(name:String, sprite:GameSprite, solid:Boolean, pixelCol:uint)		{			this.name = name;			this.tileSprite = sprite.getSprite();			this.solid = solid;			this.pixelCol = pixelCol;			tiles.push(this);		}		public function isSolid():Boolean		{			return solid;		}		public function getName():String		{			return name;		}		public function renderTile(level:Level, x:int, y:int, layer:BitmapData):void		{			layer.copyPixels(tileSprite.bitmapData, new Rectangle(0, 0, 16, 16), new Point( x * 16, y * 16 ));		}				public static function getTileFromPixel(pixelCol:uint):Tile		{			for (var i = 0; i < Tile.tiles.length; i++)			{				if(Tile.tiles[i].pixelCol == pixelCol)				{					return Tile.tiles[i];				}			}			return Tile._void;		}	}	Tile.wooden_wall = new ObjectWoodenWall();}