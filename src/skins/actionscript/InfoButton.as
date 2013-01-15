package skins.actionscript
{
	import spark.components.Button;
	import spark.skins.mobile.ButtonSkin;
	
	import skins.fxg.InfoButton;
	
	public class InfoButton extends ButtonSkin
	{
		
		//[Embed(source="/assets/skins/filterbuttonUp240.png")]
		//private var borderClassUp:Class;
		
		
		//[Embed(source="/assets/skins/filterbuttonDown240.png")]
		//private var borderClassDown:Class;
		
		public function InfoButton()
		{
			super();
			width= 271;
			height = 53;
			upBorderSkin = skins.fxg.InfoButtonUp;//borderClassUp;
			downBorderSkin = skins.fxg.InfoButtonDown;//borderClassDown;
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
				labelDisplay.setStyle("color",0xFFFFFF);
				return upBorderSkin;
			}
			
		}
		
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
	}
}