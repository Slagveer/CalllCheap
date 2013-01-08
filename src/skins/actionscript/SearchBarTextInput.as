package skins.actionscript
{
	import spark.core.SpriteVisualElement;
	import spark.skins.mobile.SkinnableContainerSkin;
	
	import skins.fxg.SearchBarTextInput;
	
	
	public class SearchBarTextInput extends SkinnableContainerSkin
	{

		protected var backgroundClass:Class;
		
		protected var background:SpriteVisualElement;
		
		public function SearchBarTextInput()
		{
			super();
			
			// Here could be a DPI dependent logic, for demo purposes it is not necessary
			backgroundClass = skins.fxg.SearchBarTextInput;
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