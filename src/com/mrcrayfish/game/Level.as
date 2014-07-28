package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	public class Level
	{
		private static var levels:Array = new Array();
		public static var testMap:Level;
		public static var commonHouse:Level;

		public var levelImage:BitmapData;
		public var levelName:String;
		public var exits:Array = new Array();
		public var objects:Array = new Array();

		public function Level(levelName:String, levelImage:BitmapData)
		{
			this.levelName = levelName;
			this.levelImage = levelImage;
			initObjectMap();
		}

		public function initObjectMap()
		{
			for (var i = 0; i < levelImage.width; i++)
			{
				this.objects[i] = new Array();
			}
		}

		public function push():Level
		{
			levels.push(this);
			return this;
		}

		public function getLevelName():String
		{
			return levelName;
		}

		public function setExit(x:int, y:int, level:Level, entranceX:int, entranceY:int):Level
		{
			exits[exits.length] = new ExitData(x,y,level,entranceX,entranceY);
			return this;
		}

		public function setObject(x:int, y:int, object:Overlay):Level
		{
			this.objects[x][y] = object;
			return this;
		}

		public function getLevelImage():BitmapData
		{
			return levelImage;
		}

		public static function getLevelByName(levelName:String):Level
		{
			for (var i = 0; i < Level.levels.length; i++)
			{
				if (Level.levels[i].getLevelName() == levelName)
				{
					trace("Got level");
					return Level.levels[i];
				}
			}
			return null;
		}

		public function getTile(x:int, y:int):Tile
		{
			if (levelImage.getPixel(x,y) == 5018368)
			{
				return Tile.grass;
			}
			else if (levelImage.getPixel(x, y) == 8547150)
			{
				return Tile.dirt;
			}
			else if (levelImage.getPixel(x, y) == 10066329)
			{
				return Tile.stone;
			}
			else if (levelImage.getPixel(x, y) == 11438684)
			{
				trace("setting to wall");
				return Tile.wooden_wall;
			}
			else if (levelImage.getPixel(x, y) == 29380)
			{
				return Tile.water;
			}
			else if (levelImage.getPixel(x, y) == 14024703)
			{
				trace("setting to air");
				return Tile._air;
			}
			else
			{
				//trace("Unknown tile at x:" + x + " y:" + y + " with the colour of " + levelImage.getPixel(x, y));
				return null;
			}
		}

		public function renderLevel(screen:Screen)
		{
			renderTiles(screen.terrainLayer);
			renderSpecial(screen.terrainLayer);
			renderOjects(screen.objectLayer);
		}

		public function renderTiles(layer:BitmapData)
		{
			layer.fillRect(layer.rect, 0);
			for (var i = 0; i < levelImage.width; i++)
			{
				for (var j = 0; j < levelImage.height; j++)
				{
					var tile:Tile = getTile(i,j);
					if (tile != null)
					{
						tile.renderTile(this, i, j, layer);
					}
				}
			}
		}

		public function renderSpecial(layer:BitmapData)
		{
			for (var i = 0; i < levelImage.width; i++)
			{
				for (var j = 0; j < levelImage.height; j++)
				{
					if (getTile(i,j) == Tile.grass)
					{
						if (getTile(i - 1, j) == Tile.dirt)
						{
							GameSprite.renderStandalone(GameSprite.grass_edge_3,i - 1, j, layer);
						}
						if (getTile(i + 1, j) == Tile.dirt)
						{
							GameSprite.renderStandalone(GameSprite.grass_edge_4,i + 1, j, layer);
						}
						if (getTile(i, j + 1) == Tile.dirt)
						{
							GameSprite.renderStandalone(GameSprite.grass_edge_1,i, j + 1, layer);
						}
						if (getTile(i, j - 1) == Tile.dirt)
						{
							GameSprite.renderStandalone(GameSprite.grass_edge_2,i, j - 1, layer);
						}
					}
				}
			}
		}

		public function renderOjects(layer:BitmapData)
		{
			layer.fillRect(layer.rect, 0);
			for (var i = 0; i < objects.length; i++)
			{
				for (var j = 0; j < objects[i].length; j++)
				{
					if (objects[i][j] != null)
					{
						trace(objects[i][j]);
						objects[i][j].renderObject(this, i, j, layer);
					}
				}
			}
		}


		public function checkForExit(main:Main, playerX:int, playerY:int):void
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
	Level.testMap = new HomeVillage().push();
}