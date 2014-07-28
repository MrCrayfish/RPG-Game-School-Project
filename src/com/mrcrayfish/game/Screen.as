package  {
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Screen extends Sprite{
		
		var main:Main;
		
		var terrainLayer:BitmapData = new BitmapData(2048, 2048, true, 0x00000000);
		var terrainBitmap:Bitmap = new Bitmap(terrainLayer);
		var objectLayer:BitmapData = new BitmapData(512, 512, true, 0x00000000);
		var objectBitmap:Bitmap = new Bitmap(objectLayer);
		var playerLayer:BitmapData = new BitmapData(512, 512, true, 0x00000000);
		var playerBitmap:Bitmap = new Bitmap(playerLayer);
		var fadeLayer:BitmapData = new BitmapData(512, 512, true, 0xFFFFFF);
		var fadeBitmap:Bitmap = new Bitmap(fadeLayer);

		public function Screen(main:Main) {
			this.main = main;
			terrainBitmap.scaleX = terrainBitmap.scaleY = 2;
			objectBitmap.scaleX = objectBitmap.scaleY = 2;
			playerBitmap.scaleX = playerBitmap.scaleY = 2;
			main.currentLevel.renderLevel(this);
			main.addChild(terrainBitmap);
			main.addChild(objectBitmap);
			main.addChild(playerBitmap);
			
		}
		
		public function moveMap(x:int, y:int)
		{
			terrainBitmap.x += x;
			terrainBitmap.y += y;
			objectBitmap.x += x;
			objectBitmap.y += y;
		}
		
		public function setMapY(y:int)
		{
			terrainBitmap.y = y;
			objectBitmap.y = y;
		}
		
		public function setMapX(x:int)
		{
			terrainBitmap.x = x;
			objectBitmap.x = x;
		}	
	}
}
