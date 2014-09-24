﻿package {	import flash.display.Bitmap;	import flash.display.BitmapData;	import flash.geom.Rectangle;	import flash.geom.Point;	public class ObjectWoodenWall extends Tile	{		public function ObjectWoodenWall()		{			super("wooden_wall", GameSprite.wooden_wall_1, true, 11043926);		}		override public function renderTile(level:Level, x:int, y:int, layer:BitmapData):void		{			var left:Boolean = level.getTile(x - 1, y) == this;			var right:Boolean = level.getTile(x + 1, y) == this;			var up:Boolean = level.getTile(x, y - 1) == this;			var down:Boolean = level.getTile(x, y + 1) == this;			//trace(left + " " + right + " " + up + " " + down);			var sprite:Bitmap;			if (! left && ! right && up && ! down)			{				sprite = GameSprite.wooden_wall_2.getSprite();			}			else if (!left && !right && !up && down)			{				sprite = GameSprite.wooden_wall_3.getSprite();			}			else if (left && !right && !up && !down)			{				sprite = GameSprite.wooden_wall_4.getSprite();			}			else if (!left && right && !up && !down)			{				sprite = GameSprite.wooden_wall_5.getSprite();			}			else if (!left && !right && up && down)			{				sprite = GameSprite.wooden_wall_6.getSprite();			}			else if (left && right && !up && !down)			{				sprite = GameSprite.wooden_wall_7.getSprite();			}			else if (!left && right && !up && down)			{				sprite = GameSprite.wooden_wall_8.getSprite();			}			else if (left && !right && !up && down)			{				sprite = GameSprite.wooden_wall_9.getSprite();			}			else if (!left && right && up && !down)			{				sprite = GameSprite.wooden_wall_10.getSprite();			}			else if (left && !right && up && !down)			{				sprite = GameSprite.wooden_wall_11.getSprite();			}			else if (!left && right && up && down)			{				sprite = GameSprite.wooden_wall_12.getSprite();			}			else if (left && right && !up && down)			{				sprite = GameSprite.wooden_wall_13.getSprite();			}			else if (left && right && up && !down)			{				sprite = GameSprite.wooden_wall_14.getSprite();			}			else if (left && !right && up && down)			{				sprite = GameSprite.wooden_wall_15.getSprite();			}			else if (left && right && up && down)			{				sprite = GameSprite.wooden_wall_16.getSprite();			}			else			{				sprite = GameSprite.wooden_wall_1.getSprite();			}						//trace("trying to render");			layer.copyPixels(sprite.bitmapData, new Rectangle(0, 0, 16, 16), new Point( x * 16, y * 16 ));		}	}}