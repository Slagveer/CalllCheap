package renderers
{
	import flash.display.DisplayObject;
	import flash.text.TextField;
	
	import spark.primitives.BitmapImage;
	import spark.primitives.Graphic;
	
	import utils.TextUtil;
	
	public class BedrijfRenderer extends BaseRenderer
	{
		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------
		
		protected var nameField:TextField;
		protected var cheapField:TextField;
		protected var expensiveField:TextField;
		protected var avatar:BitmapImage;
		protected var avatarHolder:Graphic;
		protected var arrow:BitmapImage;
		protected var arrowHolder:Graphic;
		protected var background:DisplayObject;
		protected var backgroundClass:Class;
		protected var separator:DisplayObject;
		
		protected var paddingLeft:int;
		protected var paddingRight:int;
		protected var paddingBottom:int;
		protected var paddingTop:int;
		protected var horizontalGap:int;
		protected var verticalGap:int;
		
		[Embed(source="assets/images/mobile_icn.png")]
		public var mobileClass : Class;
		
		[Embed(source="assets/images/arrow_icn_lt.png")]
		public var arrowClass : Class;
		
		//--------------------------------------------------------------------------
		//  Contructor
		//--------------------------------------------------------------------------
		
		public function BedrijfRenderer()
		{
			percentWidth = 100;
		}
		
		//--------------------------------------------------------------------------
		//  Override Protected Methods
		//--------------------------------------------------------------------------
		
		
		//--------------------------------------------------------------------------
		
		override protected function createChildren():void
		{
			readStyles();
			
			setBackground();
			
			arrowHolder = new Graphic();
			arrow = new BitmapImage();
			arrow.fillMode = "clip";
			arrowHolder.width = 14;
			arrowHolder.height = 26;
			arrowHolder.addElement( arrow );
			addChild( arrowHolder );
			
			nameField  = TextUtil.createSimpleTextField( getStyle( "naamStyle" ) );
			addChild( nameField );
			
			expensiveField  = TextUtil.createSimpleTextField( getStyle( "duurStyle" ) , false, "none" );
			expensiveField.wordWrap = true;
			expensiveField.multiline = true;
			addChild( expensiveField );
			
			cheapField  = TextUtil.createSimpleTextField( getStyle( "goedkoopStyle" ) )
			addChild( cheapField );
			
			avatarHolder = new Graphic();
			avatar = new BitmapImage();
			avatar.fillMode = "clip";
			avatarHolder.width = 32;
			avatarHolder.height = 53;
			avatarHolder.addElement( avatar );
			addChild( avatarHolder );
			
			var separatorAsset:Class = getStyle( "separator" );
			if( separatorAsset )
			{
				separator = new separatorAsset();
				addChild( separator );
			}

			// if the data is not null, set the text
			if( data )
				setValues();
			
		}
		
		protected function setBackground():void
		{
			var backgroundAsset:Class = getStyle( "background" );
			if( backgroundAsset && backgroundClass != backgroundAsset )
			{
				if( background && contains( background ) )
					removeChild( background );
				
				backgroundClass = backgroundAsset;
				background = new backgroundAsset();
				addChildAt( background, 0 );
				if( layoutHeight && layoutWidth )
				{
					background.width = layoutWidth;
					background.height = layoutHeight;
				}
			}
		}
		
		//--------------------------------------------------------------------------
		
		override protected function updateDisplayList( unscaledWidth:Number, unscaledHeight:Number ):void
		{
			avatarHolder.x = paddingLeft;
			avatarHolder.y = paddingTop;
			avatarHolder.setLayoutBoundsSize( avatarHolder.getPreferredBoundsWidth(), avatarHolder.getPreferredBoundsHeight() );
			
			arrowHolder.x = unscaledWidth - arrowHolder.width - paddingRight;
			arrowHolder.y = paddingTop;
			arrowHolder.setLayoutBoundsSize( arrowHolder.getPreferredBoundsWidth(), arrowHolder.getPreferredBoundsHeight() );
			
			nameField.x = avatarHolder.x + avatarHolder.width + horizontalGap;
			nameField.y = paddingTop;
			
			expensiveField.x = avatarHolder.x + avatarHolder.width + horizontalGap;
			expensiveField.y = nameField.y + nameField.textHeight + verticalGap;
			expensiveField.width = unscaledWidth - paddingLeft - paddingRight - avatarHolder.getLayoutBoundsWidth() - horizontalGap;
			
			cheapField.x = avatarHolder.x + avatarHolder.width + horizontalGap;
			cheapField.y = expensiveField.y + expensiveField.textHeight + verticalGap;
			
			layoutHeight = Math.max( nameField.y +  nameField.textHeight + expensiveField.y + expensiveField.textHeight + paddingBottom, avatarHolder.height + paddingBottom + paddingTop );
			
			background.width = unscaledWidth;
			background.height = layoutHeight;
			
			avatarHolder.y = layoutHeight/2 - avatarHolder.height/2;
			arrowHolder.y = layoutHeight/2 - arrowHolder.height/2;
			
			separator.width = unscaledWidth;
			separator.y = layoutHeight - separator.height;
		}
		
		override public function getLayoutBoundsHeight(postLayoutTransform:Boolean=true):Number
		{
			return layoutHeight;
		}
		
		override protected function setValues():void
		{
			if(data != null){
				nameField.text = String(data.naam).slice(0, 25).concat(String(data.naam).length > 25 ? "..." : "");
				cheapField.text =  data.goedkoop;
				expensiveField.htmlText = data.duur;
				avatar.source = mobileClass;
				arrow.source = arrowClass
			}
		}
		
		override protected function updateSkin():void
		{
			currentCSSState = ( selected ) ? "selected" : "up";
			setBackground();
		}
		
		protected function readStyles():void
		{
			paddingTop = getStyle( "paddingTop" );
			paddingLeft = getStyle( "paddingLeft" );
			paddingRight = getStyle( "paddingRight" );
			paddingBottom = getStyle( "paddingBottom" );
			horizontalGap = getStyle( "horizontalGap" );
		}
	}
}