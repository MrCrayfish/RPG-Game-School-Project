package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLLoader;


	public class Level
	{
		public static var testMap:Level;
		public static var commonHouse:Level;

		public var levelName:String;
		public var levelImage:BitmapData;
		public var levelData:LevelData;
		
		public var tiles:Array = new Array();
		public var exits:Array = new Array();
		public var objects:Array = new Array();

		public function Level(levelName:String,levelImage:BitmapData)
		{
			this.levelName = levelName;
			this.levelImage = levelImage;
			initTileMap();
			initObjectMap();
		}
	
		public function initTileMap()
		{
			for(var x = 0; x < levelImage.width; x++)
			{
				tiles[x] = new Array();
				for(var y = 0; y < levelImage.height; y++)
				{
					var col:uint = levelImage.getPixel(x, y);
					tiles[x][y] = Tile.getTileFromCol(col).getID();
				}
			}
		}

		public function initObjectMap()
		{
			//objectFile = dir.resolve(levelName +"_overlay.txt");
			for (var y = 0; y < tiles.length; y++)
			{
				this.objects[y] = new Array();
				for (var x = 0; x < tiles[0].length; x++)
				{
					this.objects[y][x] = null;
				}
			}
		}

		public function getLevelName():String
		{
			return levelName;
		}

		public function setObject(x:int,y:int,object:Overlay):Level
		{
			this.objects[x][y] = object;
			return this;
		}

		public function getTile(x:int,y:int):Tile
		{
			if (x < 0 || x >= tiles.length)
			{
				return null;
			}
			if (y < 0 || y >= tiles[0].length)
			{
				return null;
			}

			return Tile.getTileFromID(tiles[x][y]);
		}

		public function getObject(x:int, y:int):Overlay
		{
			if (x < 0 || x >= objects.length)
			{
				return null;
			}
			if (y < 0 || y >= objects[0].length)
			{
				return null;
			}
			return objects[x][y];
		}

		public function updateTile(screen:Screen, x:int, y:int)
		{
			var tile:Tile = getTile(x,y);
			if (tile != null)
			{
				tile.renderTile(this, x, y, screen.terrainLayer);
			}
		}

		public function renderLevel(screen:Screen):void
		{
			trace("Starting to render level");
			renderTiles(screen.terrainLayer);
			renderSpecial(screen.terrainLayer);
			renderOjects(screen.objectLayer, screen.overlayLayer);
		}

		public function renderTiles(layer:BitmapData)
		{
			layer.fillRect(layer.rect,0);
			for (var x = 0; x < tiles.length; x++)
			{
				for (var y = 0; y < tiles[0].length; y++)
				{
					var tile:Tile = getTile(x,y);
					if (tile != null)
					{
						tile.renderTile(this,x,y,layer);
					}
				}
			}
		}

		public function renderSpecial(layer:BitmapData)
		{
			for (var i = 0; i < tiles.length; i++)
			{
				for (var j = 0; j < tiles[i].length; j++)
				{
					if (getTile(i,j) == Tile.grass)
					{
						if (getTile(i - 1,j) == Tile.dirt)
						{
							GameSprite.renderStandalone(GameSprite.grass_edge_3,i - 1,j,layer);
						}
						if (getTile(i + 1,j) == Tile.dirt)
						{
							GameSprite.renderStandalone(GameSprite.grass_edge_4,i + 1,j,layer);
						}
						if (getTile(i,j + 1) == Tile.dirt)
						{
							GameSprite.renderStandalone(GameSprite.grass_edge_1,i,j + 1,layer);
						}
						if (getTile(i,j - 1) == Tile.dirt)
						{
							GameSprite.renderStandalone(GameSprite.grass_edge_2,i,j - 1,layer);
						}
					}
				}
			}
		}

		public function renderOjects(layer:BitmapData, topLayer:BitmapData)
		{
			layer.fillRect(layer.rect,0);
			topLayer.fillRect(topLayer.rect,0);
			for (var i = 0; i < objects.length; i++)
			{
				for (var j = 0; j < objects[i].length; j++)
				{
					if (objects[i][j] != null)
					{
						objects[i][j].renderObject(this,i,j,layer, topLayer);
					}
				}
			}
		}


		public function checkForExit(main:Main,playerX:int,playerY:int):void
		{
			for (var i = 0; i < main.currentLevel.exits.length; i++)
			{
				if (playerX == main.currentLevel.exits[i].getExitX())
				{
					if (playerY == main.currentLevel.exits[i].getExitY())
					{
						main.currentLevel = main.currentLevel.exits[i].getLevel();
						main.currentLevel.renderLevel(main.screen);
						main.player.clearPlayerRender();
						main.player.setPlayerX(exits[i].getEntranceX());
						main.player.setPlayerY(exits[i].getEntranceY());
						main.player.renderPlayer();
						break;
					}
				}
			}
		}
	}
	Level.testMap = new HomeVillage();
}