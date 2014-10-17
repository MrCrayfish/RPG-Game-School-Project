package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;

	public class Tile
	{
		private static var tiles:Array = new Array();

		public static var _void:Tile = new Tile(0,"void",GameSprite._void,false);
		public static var _air:Tile = new Tile(1,"air",GameSprite._air,false);

		public static var grass:Tile = new Tile(2,"grass",GameSprite.grass,false);
		public static var grass_thick:Tile = new Tile(9,"grass",GameSprite.grass_thick,false);
		public static var dirt:Tile = new Tile(3,"dirt",GameSprite.dirt,false);
		public static var stone:Tile = new Tile(4,"stone",GameSprite.stone,false);
		public static var wood:Tile = new Tile(5,"wood",GameSprite.wood,false);
		public static var water:Tile = new Tile(6,"water",GameSprite.water,false);
		public static var wooden_wall:Tile;
		public static var stone_wall:Tile;

		public var name:String;
		private var id:int;
		private var solid:Boolean;
		private var tileSprite:Bitmap;


		public function Tile(id:int, name:String, sprite:GameSprite, solid:Boolean)
		{
			this.id = id;
			this.name = name;
			this.tileSprite = sprite.getSprite();
			this.solid = solid;
			tiles.push(this);
		}

		public function isSolid():Boolean
		{
			return solid;
		}

		public function getName():String
		{
			return name;
		}
		
		public function getID():int
		{
			return id;
		}

		public function renderTile(level:Level, x:int, y:int, layer:BitmapData):void
		{
			layer.copyPixels(tileSprite.bitmapData, new Rectangle(0, 0, 16, 16), new Point( x * 16, y * 16 ));
		}

		public static function getTileFromID(id:int):Tile
		{
			for (var i = 0; i < Tile.tiles.length; i++)
			{
				if (Tile.tiles[i].id == id)
				{
					return Tile.tiles[i];
				}
			}
			return Tile._void;
		}

		public static function getTileFromCol(col:uint):Tile
		{
			trace(col);
			if(col == 8349771)
			{
				trace("Returning dirt");
				return Tile.dirt;
			}
			if(col == 5018112)
			{
				return Tile.grass;
			}
			if(col == 11241305)
			{
				return Tile.wooden_wall;
			}
			if(col == 9868950)
			{
				return Tile.stone_wall;
			}
			if(col == 3961600)
			{
				return Tile.grass_thick;
			}
			if(col == 14199410)
			{
				return Tile.wood;
			}
			return Tile._void;
		}
	}
	Tile.wooden_wall = new ObjectWoodenWall();
	Tile.stone_wall = new ObjectStoneWall();
}