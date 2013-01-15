package skins.actionscript
{
	
	import spark.components.Group;
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.ViewNavigatorApplicationSkin;
	
	public class App extends ViewNavigatorApplicationSkin
	{
		
		[Bindable]
		[Embed(source="/assets/images/bg_main.jpg")]
		private var bgClass:Class;
		
		private var bg:BitmapImage = new BitmapImage();
		private var holder:Group = new Group;
		
		
		//private var bg:Image = new Image();
		
		public function App()
		{
			
			super();
			holder.horizontalCenter = 0;
			addChild(holder);
			bg.source = bgClass;
			
			bg.width = 640;
			bg.height = 1608;
			holder.addElement(bg);
			
			
		}
		
		
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);
			bg.x = -320 + unscaledWidth/2;
			bg.y = -480 + unscaledHeight/2;
			
		}
		
	}
}