package  {
	
	public class ExitData {

		private var exitX:int;
		private var exitY:int;
		private var level:Level;
		private var entranceX:int;
		private var entranceY:int;
		
		public function ExitData(exitX:int, exitY:int, level:Level, entranceX:int, entranceY:int) {
			this.exitX = exitX;
			this.exitY = exitY;
			this.level = level;
			this.entranceX = entranceX;
			this.entranceY = entranceY;
		}
		
		public function getExitX():int
		{
			return exitX;
		}
		
		public function getExitY():int
		{
			return exitY;
		}
		
		public function getLevel():Level
		{
			return level;
		}
		
		public function getEntranceX():int
		{
			return entranceX;
		}
		
		public function getEntranceY():int
		{
			return entranceY;
		}

	}
	
}
