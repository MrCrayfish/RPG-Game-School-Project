package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;

	public class GameSprite
	{
		public var sprite:Bitmap;

		public static var _void:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,15,15);
		public static var _air:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,14,15);

		public static var grass:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,0,0);
		public static var grass_thick:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,0,1);
		public static var grass_edge_1:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,0,15);
		public static var grass_edge_2:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,1,15);
		public static var grass_edge_3:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,2,15);
		public static var grass_edge_4:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,3,15);


		public static var dirt:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,1,0);
		public static var stone:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,2,0);
		public static var wood:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,3,0);
		public static var water:GameSprite = new GameSprite(SpriteSheet.terrain,16,16,4,0);

		public static var playerD_0:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,0,0);
		public static var playerD_1:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,0,1);
		public static var playerD_2:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,0,2);
		public static var playerL_0:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,1,0);
		public static var playerL_1:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,1,1);
		public static var playerL_2:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,1,2);
		public static var playerR_0:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,2,0);
		public static var playerR_1:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,2,1);
		public static var playerR_2:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,2,2);
		public static var playerU_0:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,3,0);
		public static var playerU_1:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,3,1);
		public static var playerU_2:GameSprite = new GameSprite(SpriteSheet.mobs,16,16,3,2);

		public static var wooden_wall_1:GameSprite = new GameSprite(SpriteSheet.objects,16,16,0,0);
		public static var wooden_wall_2:GameSprite = new GameSprite(SpriteSheet.objects,16,16,1,0);
		public static var wooden_wall_3:GameSprite = new GameSprite(SpriteSheet.objects,16,16,2,0);
		public static var wooden_wall_4:GameSprite = new GameSprite(SpriteSheet.objects,16,16,3,0);
		public static var wooden_wall_5:GameSprite = new GameSprite(SpriteSheet.objects,16,16,4,0);
		public static var wooden_wall_6:GameSprite = new GameSprite(SpriteSheet.objects,16,16,5,0);
		public static var wooden_wall_7:GameSprite = new GameSprite(SpriteSheet.objects,16,16,6,0);
		public static var wooden_wall_8:GameSprite = new GameSprite(SpriteSheet.objects,16,16,7,0);
		public static var wooden_wall_9:GameSprite = new GameSprite(SpriteSheet.objects,16,16,8,0);
		public static var wooden_wall_10:GameSprite = new GameSprite(SpriteSheet.objects,16,16,9,0);
		public static var wooden_wall_11:GameSprite = new GameSprite(SpriteSheet.objects,16,16,10,0);
		public static var wooden_wall_12:GameSprite = new GameSprite(SpriteSheet.objects,16,16,11,0);
		public static var wooden_wall_13:GameSprite = new GameSprite(SpriteSheet.objects,16,16,12,0);
		public static var wooden_wall_14:GameSprite = new GameSprite(SpriteSheet.objects,16,16,13,0);
		public static var wooden_wall_15:GameSprite = new GameSprite(SpriteSheet.objects,16,16,14,0);
		public static var wooden_wall_16:GameSprite = new GameSprite(SpriteSheet.objects,16,16,15,0);
		
		public static var stone_wall_1:GameSprite = new GameSprite(SpriteSheet.objects,16,16,0,1);
		public static var stone_wall_2:GameSprite = new GameSprite(SpriteSheet.objects,16,16,1,1);
		public static var stone_wall_3:GameSprite = new GameSprite(SpriteSheet.objects,16,16,2,1);
		public static var stone_wall_4:GameSprite = new GameSprite(SpriteSheet.objects,16,16,3,1);
		public static var stone_wall_5:GameSprite = new GameSprite(SpriteSheet.objects,16,16,4,1);
		public static var stone_wall_6:GameSprite = new GameSprite(SpriteSheet.objects,16,16,5,1);
		public static var stone_wall_7:GameSprite = new GameSprite(SpriteSheet.objects,16,16,6,1);
		public static var stone_wall_8:GameSprite = new GameSprite(SpriteSheet.objects,16,16,7,1);
		public static var stone_wall_9:GameSprite = new GameSprite(SpriteSheet.objects,16,16,8,1);
		public static var stone_wall_10:GameSprite = new GameSprite(SpriteSheet.objects,16,16,9,1);
		public static var stone_wall_11:GameSprite = new GameSprite(SpriteSheet.objects,16,16,10,1);
		public static var stone_wall_12:GameSprite = new GameSprite(SpriteSheet.objects,16,16,11,1);
		public static var stone_wall_13:GameSprite = new GameSprite(SpriteSheet.objects,16,16,12,1);
		public static var stone_wall_14:GameSprite = new GameSprite(SpriteSheet.objects,16,16,13,1);
		public static var stone_wall_15:GameSprite = new GameSprite(SpriteSheet.objects,16,16,14,1);
		public static var stone_wall_16:GameSprite = new GameSprite(SpriteSheet.objects,16,16,15,1);

		public static var fence_1:GameSprite = new GameSprite(SpriteSheet.objects,16,16,0,3);
		public static var fence_2:GameSprite = new GameSprite(SpriteSheet.objects,16,16,1,3);
		public static var fence_3:GameSprite = new GameSprite(SpriteSheet.objects,16,16,2,3);
		public static var fence_4:GameSprite = new GameSprite(SpriteSheet.objects,16,16,3,3);
		public static var fence_5:GameSprite = new GameSprite(SpriteSheet.objects,16,16,4,3);
		public static var fence_6:GameSprite = new GameSprite(SpriteSheet.objects,16,16,5,3);
		public static var fence_7:GameSprite = new GameSprite(SpriteSheet.objects,16,16,6,3);
		public static var fence_8:GameSprite = new GameSprite(SpriteSheet.objects,16,16,7,3);
		public static var fence_9:GameSprite = new GameSprite(SpriteSheet.objects,16,16,8,3);
		public static var fence_10:GameSprite = new GameSprite(SpriteSheet.objects,16,16,9,3);
		public static var fence_11:GameSprite = new GameSprite(SpriteSheet.objects,16,16,10,3);
		public static var fence_12:GameSprite = new GameSprite(SpriteSheet.objects,16,16,11,3);
		public static var fence_13:GameSprite = new GameSprite(SpriteSheet.objects,16,16,12,3);
		public static var fence_14:GameSprite = new GameSprite(SpriteSheet.objects,16,16,13,3);
		public static var fence_15:GameSprite = new GameSprite(SpriteSheet.objects,16,16,14,3);
		public static var fence_16:GameSprite = new GameSprite(SpriteSheet.objects,16,16,15,3);
		
		/* Objects */
		public static var wooden_door:GameSprite = new GameSprite(SpriteSheet.objects,16,16,0,2);
		public static var stone_door:GameSprite = new GameSprite(SpriteSheet.objects,16,16,1,2);
		public static var sign:GameSprite = new GameSprite(SpriteSheet.objects,16,16,2,2);
		public static var storeWeapons:GameSprite = new GameSprite(SpriteSheet.objects,16,16,3,2);
		public static var storeGeneral:GameSprite = new GameSprite(SpriteSheet.objects,16,16,4,2);
		public static var storeInn:GameSprite = new GameSprite(SpriteSheet.objects,16,16,5,2);
		public static var storeArmoury:GameSprite = new GameSprite(SpriteSheet.objects,16,16,6,2);
		public static var storeBlank:GameSprite = new GameSprite(SpriteSheet.objects,16,16,7,2);
		public static var flower_1:GameSprite = new GameSprite(SpriteSheet.objects,16,16,0,4);
		public static var flower_2:GameSprite = new GameSprite(SpriteSheet.objects,16,16,1,4);
		public static var flower_3:GameSprite = new GameSprite(SpriteSheet.objects,16,16,2,4);
		public static var flower_4:GameSprite = new GameSprite(SpriteSheet.objects,16,16,3,4);
		public static var flower_5:GameSprite = new GameSprite(SpriteSheet.objects,16,16,4,4);
		public static var flower_6:GameSprite = new GameSprite(SpriteSheet.objects,16,16,5,4);
		public static var bush_1:GameSprite = new GameSprite(SpriteSheet.objects,16,16,6,4);
		public static var bush_2:GameSprite = new GameSprite(SpriteSheet.objects,16,16,7,4);
		public static var bush_3:GameSprite = new GameSprite(SpriteSheet.objects,16,16,8,4);
		public static var charlotte_flower:GameSprite = new GameSprite(SpriteSheet.objects,16,16,9,4);
		public static var charlotte_shroom:GameSprite = new GameSprite(SpriteSheet.objects,16,16,10,4);
		public static var tree:GameSprite = new GameSprite(SpriteSheet.objects,16,32,2,3);
		public static var well:GameSprite = new GameSprite(SpriteSheet.objects,32,32,0,3);
		public static var tree_2:GameSprite = new GameSprite(SpriteSheet.objects,32,32,2,3);
		public static var tree_3:GameSprite = new GameSprite(SpriteSheet.objects,32,32,3,3);
		public static var barrel:GameSprite = new GameSprite(SpriteSheet.objects,16,16,8,2);
		public static var barrel_stack:GameSprite = new GameSprite(SpriteSheet.objects,32,32,6,3);
		public static var crate:GameSprite = new GameSprite(SpriteSheet.objects,16,16,9,2);
		public static var crate_stack:GameSprite = new GameSprite(SpriteSheet.objects,32,32,7,3);
		public static var bed:GameSprite = new GameSprite(SpriteSheet.objects,16,32,15,2);

		/* GUI */
		public static var mouse_normal_1:GameSprite = new GameSprite(SpriteSheet.gui,16,16,0,0);
		public static var mouse_clicked_1:GameSprite = new GameSprite(SpriteSheet.gui,16,16,1,0);
		public static var mouse_normal_2:GameSprite = new GameSprite(SpriteSheet.gui,16,16,2,0);
		public static var mouse_clicked_2:GameSprite = new GameSprite(SpriteSheet.gui,16,16,3,0);
		public static var mouse_normal_3:GameSprite = new GameSprite(SpriteSheet.gui,16,16,0,1);
		public static var mouse_clicked_3:GameSprite = new GameSprite(SpriteSheet.gui,16,16,1,1);
		public static var mouse_normal_4:GameSprite = new GameSprite(SpriteSheet.gui,16,16,2,1);
		public static var mouse_clicked_4:GameSprite = new GameSprite(SpriteSheet.gui,16,16,3,1);
		
		public static var bar:GameSprite = new GameSprite(SpriteSheet.gui,64,16,1,0);

		public function GameSprite(sheet:SpriteSheet, width:int, height:int, x:int, y:int)
		{
			this.sprite = sheet.getSprite(width,height,x,y);
		}

		public function getSprite():Bitmap
		{
			return sprite;
		}

		public static function renderStandalone(sprite:GameSprite, x:int, y:int, layer:BitmapData)
		{
			layer.copyPixels(sprite.getSprite().bitmapData, new Rectangle(0, 0, 16, 16), new Point( x * 16, y * 16 ), null, null, true);
		}
	}
}