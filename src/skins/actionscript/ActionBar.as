package skins.actionscript
{

	import spark.skins.mobile.ActionBarSkin;
	
	import skins.fxg.ActionBar;
	
	
	public class ActionBar extends ActionBarSkin
	{
		
		public function ActionBar()
		{
			super();
			
			// Here could be a DPI dependent logic, for demo purposes it is not necessary
			borderClass = skins.fxg.ActionBar;
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			// By default SkinnableContainerSkin draws Rect with backgroundColor but this is not
			// required in this case since background is constructed of MySkinnableContainerBackground fxg
		}
		
	}
}