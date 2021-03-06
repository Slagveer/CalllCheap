package skins.actionscript
{
	import spark.core.SpriteVisualElement;
	import spark.skins.mobile.SkinnableContainerSkin;
	
	import skins.fxg.SearchBarButton;
	
	
	public class BottomStateBar extends SkinnableContainerSkin
	{

		protected var backgroundClass:Class;
		
		protected var background:SpriteVisualElement;
		
		public function BottomStateBar()
		{
			super();
			
			// Here could be a DPI dependent logic, for demo purposes it is not necessary
			backgroundClass = skins.fxg.SearchBarButton;
		}

		override protected function createChildren():void
		{
			// Adding container background
			background = new backgroundClass;
			addChild(background);
			
			// Creating content group instance
			super.createChildren();
		}
		
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);
			
			// Setting size of background container
			this.setElementSize(background, unscaledWidth, unscaledHeight);
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			// By default SkinnableContainerSkin draws Rect with backgroundColor but this is not
			// required in this case since background is constructed of MySkinnableContainerBackground fxg
		}
		
	}
}