package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;

	public class Tile
	{
		public static var _void:Tile = new Tile("void",GameSprite._void,false);
		public static var _air:Tile = new Tile("air",GameSprite._air,false);

		public static var grass:Tile = new Tile("grass",GameSprite.grass,false);
		public static var dirt:Tile = new Tile("dirt",GameSprite.dirt,false);
		public static var stone:Tile = new Tile("stone",GameSprite.stone,true);
		public static var wood:Tile = new Tile("wood",GameSprite.wood,true);
		public static var water:Tile = new Tile("water",GameSprite.water,false);
		public static var wooden_wall:Tile;


		private var name:String;
		private var solid:Boolean;
		private var tileSprite:Bitmap;

		public function Tile(name:String, sprite:GameSprite, solid:Boolean)
		{
			this.name = name;
			this.tileSprite = sprite.getSprite();
			this.solid = solid;
		}

		public function isSolid():Boolean
		{
			return solid;
		}

		public function getName():String
		{
			return name;
		}

		public function renderTile(level:Level, x:int, y:int, layer:BitmapData):void
		{
			layer.copyPixels(tileSprite.bitmapData, new Rectangle(0, 0, 16, 16), new Point( x * 16, y * 16 ));
		}
	}
	Tile.wooden_wall = new ObjectWoodenWall();
}