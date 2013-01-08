package skins.actionscript
{
	import spark.components.Button;
	import spark.skins.mobile.ButtonSkin;
	
	import skins.fxg.SearchBarButton;
	
	public class SearchBarButton extends ButtonSkin
	{
		
		//[Embed(source="/assets/skins/filterbuttonUp240.png")]
		//private var borderClassUp:Class;
		
		
		//[Embed(source="/assets/skins/filterbuttonDown240.png")]
		//private var borderClassDown:Class;
		
		public function SearchBarButton()
		{
			super();
			width= 182;
			height = 77;
			upBorderSkin = skins.fxg.SearchBarButton;//borderClassUp;
			downBorderSkin = skins.fxg.SearchBarButtonDown;//borderClassDown;
		}
		
		override protected function childrenCreated():void
		{
			super.childrenCreated();
			
			var host:Button = hostComponent as Button;	
			
			host.y = 150;
			
		}
		
		override protected function getBorderClassForCurrentState():Class
		{
			if (currentState == "down"){
				labelDisplay.setStyle("color",0xFFFFFF);
				return downBorderSkin;
			}
			else{
				labelDisplay.setStyle("color",0x48250A);
				return upBorderSkin;
			}
			
		}
		
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
	}
}