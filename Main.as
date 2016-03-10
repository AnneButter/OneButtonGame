package
{
	
	import flash.display.*;
	import flash.events.*;
	
	import flash.text.*;

	public class Main extends MovieClip
	{
		
		var _startScherm:StartScherm;
		var _gameScherm:GameScherm;
		var _winScherm:WinScherm;
		var _gameOverScherm:GameOverScherm;
		
		public function Main()
		{
			_startScherm = new StartScherm;
			//addChild(new GameScherm);
			addChild(_startScherm);
			addEventListener("StartGame", GoToGameScherm);
		}

		public function GoToGameScherm(e:Event)
		{
			trace ("Ga naar volgend scherm");
			removeChild(_startScherm);
			_gameScherm = new GameScherm;
			addChild(_gameScherm);
			addEventListener("Win", GoToWinScherm);
			addEventListener("GameOver", GoToGameOverScherm);
		}
		
		public function GoToWinScherm(e:Event)
		{
			removeChild(_gameScherm);
			_winScherm = new WinScherm;
			addChild(_winScherm);
			//addEventListener("win", GoToWinScherm);
		}
		
		public function GoToGameOverScherm(e:Event)
		{
			removeChild(_gameScherm);
			_gameOverScherm = new GameOverScherm;
			addChild(_gameOverScherm);
			addEventListener("TryAgain", GoBack);
		}
		
		public function GoBack(e:Event)
		{
			removeChild(_gameOverScherm);
			_gameScherm = new GameScherm;
			addChild(_gameScherm);
			addEventListener("Win", GoToWinScherm);
			addEventListener("GameOver", GoToGameOverScherm);
		}
	}
}
