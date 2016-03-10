package
{
	
	import flash.display.*;
	import flash.events.*;
	
	import flash.text.*;

	public class GameScherm extends MovieClip
	{
		public var rakende:Boolean = false;
		public var gekliktTijdensRakende:Boolean = false;
		public var snelheid: Number = 5;
		public var levens:int = 3;
		
		
		public var tekstveld:TextField;

		
		public function GameScherm()
		{
			addEventListener(Event.ADDED_TO_STAGE, Added);
			
		}
		
		public function Added(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, Update);
			trace(stage);
			stage.addEventListener(MouseEvent.CLICK, Geklikt);
		}

		
		public function Update(e:Event) :void
		{
			ball.x += snelheid;
			tekstveld = (onzeTekst as TextField);
			tekstveld.text = "Lives = " + levens;

			
			if (ball.x < 15 || ball.x > 530)
			{
				snelheid *= -1;
			}
			for (var i:int = 0; i < numChildren; i++)
			{
				var child:DisplayObject = this.getChildAt(i);
				if (child is Portaal || child is PortaalDB || child is PortaalGe || child is PortaalGr || child is PortaalO || child is PortaalP || child is PortaalRoz || child is PortaalRB)
				{
					var a = ball.hitTestObject(child);
					
					if (a)
					{
						ball.BeingHit(child);
						//trace ("raakt");
						rakende = true;
						if (child == portaal1 && gekliktTijdensRakende)
						{
							ball.x = portaal2.x;
							ball.y = portaal2.y + 5;
						}
						else if (child == portaal3 && gekliktTijdensRakende)
						{
							ball.x = portaal4.x;
							ball.y = portaal4.y + 5;
						}
						else if (child == portaal5 && gekliktTijdensRakende)
						{
							ball.x = portaal6.x;
							ball.y = portaal6.y + 5;
						}
						else if (child == portaal7 && gekliktTijdensRakende)
						{
							ball.x = portaal8.x;
							ball.y = portaal8.y + 5;
						}
						else if (child == portaal9 && gekliktTijdensRakende)
						{
							ball.x = portaal10.x;
							ball.y = portaal10.y + 5;
						}
						
						else if (child == portaal11 && gekliktTijdensRakende)
						{
							ball.x = portaal12.x;
							ball.y = portaal12.y + 5;
						}
						else if (child == portaal13 && gekliktTijdensRakende)
						{
							ball.x = portaal14.x;
							ball.y = portaal14.y + 5;
						}
						else if (child == portaal15 && gekliktTijdensRakende)
						{
							dispatchEvent(new Event ("Win", true));
							
						}
					}
				}
				else if (child is LevelM)
				{
					var b = ball.hitTestObject(child);
					if (b)
					{
						ball.BeingHit(child);
						//trace ("Raakt muur");
						snelheid *= -1;
					}
				}
				
				else if (child is Spikes)
				{
					var c = ball.hitTestObject(child);
					
					if (c)
					{
						ball.BeingHit(child);
						snelheid *= -1;
						//trace ("Raakt spikes");
						levens -= 1;
						//trace ("Lives = " + levens);
						
					}
				}
				else if (child is Level)
				{
			
				}
			}
			//trace("----------------");
			gekliktTijdensRakende = false;
			
			
			if (levens < 1)
			{
				dispatchEvent(new Event ("GameOver", true));
			}
		}

		public function Geklikt(gebeurtenis: MouseEvent)
		{
			//trace("Geklikt");
			if (rakende ==  true)
			{
				//trace ("raakt en geklikt op portaal");
				gekliktTijdensRakende = true;				
				rakende = false;
			}
			else if (rakende == false)
			{
				
			}
		}
	}
}

