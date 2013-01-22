package skins.actionscript
{
	import mx.core.DPIClassification;
	import mx.core.mx_internal;
	
	import spark.skins.mobile.TransparentActionButtonSkin;
	
	import skins.fxg.ActionBarButton_up;
	import skins.fxg.ActionBarButton_down;
	
	use namespace mx_internal;
	
	public class ActionBarButton extends TransparentActionButtonSkin
	{
		public function ActionBarButton()
		{
			super();
			
			switch (applicationDPI)
			{
				case DPIClassification.DPI_320:
				{
					upBorderSkin = skins.fxg.ActionBarButton_up;
					downBorderSkin = skins.fxg.ActionBarButton_down;
					
					break;
				}
				default:
				{
					upBorderSkin = skins.fxg.ActionBarButton_up;
					downBorderSkin = skins.fxg.ActionBarButton_down;
					
					break;
				}
			}
		}
		
		override mx_internal function layoutBorder(unscaledWidth:Number, unscaledHeight:Number):void
		{
			// don't call super, don't layout twice
			// leading vertical separator is outside the left bounds of the button
			setElementSize(border, unscaledWidth + layoutBorderSize, this.height);
			setElementPosition(border, -layoutBorderSize, 0);
		}
	}
}