package
{
	import flash.events.*;

	import flash.display.MovieClip;


	public class StartScherm extends MovieClip
	{


		public function StartScherm()
		{
			addEventListener(Event.ADDED_TO_STAGE, Added);
		}
		
		public function Added(e:Event):void
		{
			stage.addEventListener(MouseEvent.CLICK, Geklikt);
		}
		
		public function Geklikt(e:MouseEvent)
		{
			dispatchEvent(new Event ("StartGame", true));
		}
	}

}