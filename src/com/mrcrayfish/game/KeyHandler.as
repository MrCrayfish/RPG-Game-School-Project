package 
{
	import flash.events.KeyboardEvent;
	import flash.display.Stage;

	public class KeyHandler
	{
		public var keys:Array = new Array();

		public function KeyHandler(stage:Stage)
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,handleKeyUp);
		}

		public function handleKeyUp(e:KeyboardEvent):void
		{
			keys[e.keyCode] = false;
		}

		public function handleKeyDown(e:KeyboardEvent):void
		{
			keys[e.keyCode] = true;
			
		}

	}

}