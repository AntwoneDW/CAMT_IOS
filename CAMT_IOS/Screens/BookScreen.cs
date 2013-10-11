using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace CAMT_IOS
{
	public partial class BookScreen : UIViewController
	{
		private static string bookUrl{ get; set; } 
		UIActionSheet actionSheet;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public BookScreen ()
			: base (UserInterfaceIdiomIsPhone ? "BookScreen_iPhone" : "BookScreen_iPad", null)
		{
			//Console.WriteLine ("SETTING THE WEBVIEW TO FILL THE SCREEN");
			//this.webViewBookScreen.AutoresizingMask = UIViewAutoresizing.FlexibleWidth;

		}

		public static string menuToShow = "";

		public void loadThisUrl( string urlToLoad )
		{
			if (urlToLoad != bookUrl || bookUrl == null ) 
			{
				Console.WriteLine ("urlToLoad:  \n" + urlToLoad );
				var uri = new System.Uri(urlToLoad);
				var converted = uri.AbsoluteUri;
				Console.WriteLine ("urlToLoad (URI):  \n" + converted );
				bookUrl = converted;
				//webView.LoadRequest(new NSUrlRequest(new NSUrl(localHtmlUrl, false)));
				this.webViewBookScreen.LoadRequest(new NSUrlRequest(new NSUrl(urlToLoad, false)));
				//this.webViewBookScreen.CanGoBack = false;
				// Perform any additional setup after loading the view, typically from a nib.
				this.webViewBookScreen.ScalesPageToFit = true;
			}
		}


		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public static string[] participantOneTitleAnchorArr = 
		new string[]{
			"Interior and Exterior||INTERIOR AND EXTERIOR", 
			"Electrical||ELECTRICAL",
			"Plumbing||PLUMBING",
			"HVAC||HVAC",
			"Appliance||APPLIANCE",
			"Skill Checks||SKILLS" };	
		public static string[] termGuideEnglishTitleAnchorArr = 
			new string[]{
			"FRONT_COVER||FRONT_COVER", 
			"INTERIOR AND EXTERIOR MAINTENANCE AND REPAIR||INT_AND_EXT", 
			"ELECTRICAL MAINTENANCE AND REPAIR||ELECTRICAL",
			"PLUMBING MAINTENANCE AND REPAIR||PLUMBING",
			"HVAC MAINTENANCE AND REPAIR||HVAC",
			"APPLIANCE MAINTENANCE AND REPAIR||APPLIANCE",
			"Index||INDEX" };

		public static string[] termGuideSpanTitleAnchorArr = 
			new string[]{
			"GUIA DE CAJA DE HERRAMIENTAS||FRONT_COVER", 
			"REPARACIÓN DE INTERIORES Y EXTERIORES||INT_AND_EXT",
			"REPARACIÓN ELÉCTRICO||ELECTRICAL",
			"REPARACIÓN DE TUBERÍAS||PLUMBING",
			"REPARACIÓN DE CLIMATACIÓN||HVAC",
			"REPARACIÓN DE APARATOS||APPLIANCE",
			"Índice||INDEX" };

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			Console.WriteLine ("SETTING THE WEBVIEW TO FILL THE SCREEN from viewdidload");
			this.webViewBookScreen.AutoresizingMask = UIViewAutoresizing.FlexibleWidth;

			var actionButton = new UIBarButtonItem (UIBarButtonSystemItem.Action, (s, e) => {
				try
				{				
					actionSheet = new UIActionSheet ("ActionSheet with Buttons");
					/*
					Interior and Exterior: page 7
					<a name="INTERIOR AND EXTERIOR"></a> 
					Electrical: page 40
					<a name="ELECTRICAL"></a> 
					Plumbing: page 96
					<a name="PLUMBING"></a> 
					HVAC: 164
					<a name="HVAC"></a> 
					Appliance: 253
					<a name="APPLIANCE"></a> 
					Skill Checks: 315
					<a name="SKILLS"></a> 
					 */	
					if( menuToShow == "CAMT_Participant" )
					{
						///ACTION SHEET LANGUAGE OPTION START
						foreach(string title in participantOneTitleAnchorArr )
						{
							actionSheet.AddButton( title.Split(new char[]{'|','|'},2)[0] );
						}
					}
					if( menuToShow == "CAMT_English_HR_2011" )
					{
						///ACTION SHEET LANGUAGE OPTION START
						foreach(string title in termGuideEnglishTitleAnchorArr )
						{
							actionSheet.AddButton( title.Split(new char[]{'|','|'},2)[0] );
						}
					}
					if( menuToShow == "CAMT_Text_Spanish_HR_2011" )
					{
						///ACTION SHEET LANGUAGE OPTION START
						foreach(string title in termGuideSpanTitleAnchorArr )
						{
							actionSheet.AddButton( title.Split(new char[]{'|','|'},2)[0] );
						}
					}

					actionSheet.Clicked += delegate(object a, UIButtonEventArgs b) {
						string buttonString = actionSheet.ButtonTitle( b.ButtonIndex ) ; 
						string anchorLink = null;
						if( menuToShow == "CAMT_Participant" )
						{
							///ACTION SHEET LANGUAGE OPTION START
							foreach(string title in participantOneTitleAnchorArr )
							{
								if( title.Split(new char[]{'|','|'},2)[0]  == buttonString )
								{
									anchorLink = title.Split(new char[]{'|','|'},2)[1] ;
									break;
								}
							}
						}
						if( menuToShow == "CAMT_English_HR_2011" )
						{
							///ACTION SHEET LANGUAGE OPTION START
							foreach(string title in termGuideEnglishTitleAnchorArr )
							{
								if( title.Split(new char[]{'|','|'},2)[0]  == buttonString )
								{
									anchorLink = title.Split(new char[]{'|','|'},2)[1] ;
									break;
								}
							}
						}
						if( menuToShow == "CAMT_Text_Spanish_HR_2011" )
						{
							///ACTION SHEET LANGUAGE OPTION START
							foreach(string title in termGuideSpanTitleAnchorArr )
							{
								if( title.Split(new char[]{'|','|'},2)[0] == buttonString )
								{
									anchorLink = title.Split(new char[]{'|','|'},2)[1] ;
									break;
								}
							}
						}
						anchorLink = anchorLink.Replace("|","");
						if( anchorLink != null )
						{
							string newBookUrl = bookUrl+"#"+anchorLink;
							Console.WriteLine("newBookUrl = \n" + newBookUrl );
							//this.webViewBookScreen = new UIWebView(View.Frame);
							var uri = new System.Uri(newBookUrl);
							var converted = uri.AbsoluteUri;
							string jsString = "location.href='"+converted+"' ;";
							Console.WriteLine("jsString: " + jsString );
							webViewBookScreen.EvaluateJavascript(jsString);
							//this.webViewBookScreen.LoadRequest(new NSUrlRequest(new NSUrl(newBookUrl, false)));
							//this.webViewBookScreen.LoadRequest(new NSUrlRequest(new NSUrl(newBookUrl, false)));
							//this.webViewBookScreen.LoadRequest(new NSUrlRequest(new NSUrl(newBookUrl, false)));
							//Console.WriteLine("this.webViewBookScreen.Request.Url AFTER = \n" 
							 //                 + this.webViewBookScreen.Request.Url );
							//Console.WriteLine("this.webViewBookScreen.Request.Url AFTER 2 = \n" 
							  //                + this.webViewBookScreen.Request.Url );

						}

					};
					actionSheet.ShowInView (View);
					/// ACTION SHEET LANGUAGE OPTION END			
				}catch(Exception ex)
				{
					Console.WriteLine (ex.Message);
					Console.WriteLine (ex.StackTrace);
				}
			});

			var spacer = new UIBarButtonItem(UIBarButtonSystemItem.FlexibleSpace) { Width = 50 };
					
			var spacer2 = new UIBarButtonItem(UIBarButtonSystemItem.FlexibleSpace) { Width = 50 };

			this.SetToolbarItems( new UIBarButtonItem[] {
				spacer, actionButton, spacer2
			}, false);


			this.NavigationController.ToolbarHidden = false;
		}




	}
}

