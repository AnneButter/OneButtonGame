package
{

	import flash.display.*;
	import flash.events.*;

	public class Ball extends MovieClip
	{
		

		public function Ball()
		{
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		public function BeingHit(reference:DisplayObject):void
		{
			//trace("COOL! DOE JE DING!");
		}
		
		private function Update(e:Event)
		{
			
		}
	}
}