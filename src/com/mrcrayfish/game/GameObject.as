package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	public class Objects
	{
		private var solid:Boolean = false;
		private var tileSprite:Bitmap;
		
		public static var wooden_door:Objects = new ObjectWoodenDoor();

		public function Objects(sprite:Bitmap, solid:Boolean):void
		{
			this.tileSprite = sprite;
			this.solid = solid;
		}

		public function setSprite(sprite:Bitmap):void
		{
			this.tileSprite = sprite;
		}

		public function setSolid(flag:Boolean):void
		{
			this.solid = flag;
		}

		public function onUse(player:Player)
		{

		}

		public function isSolid():Boolean
		{
			return solid;
		}

		public function renderObject(x:int, y:int, layer:BitmapData):void
		{
			trace("rending object");
			layer.copyPixels(tileSprite.bitmapData, new Rectangle(0, 0, 16, 16), new Point( x * 16, y * 16 ));
		}
	}
}