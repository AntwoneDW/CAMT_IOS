using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace CAMT_IOS
{
	public partial class BookScreen : UIViewController
	{
		private static string bookUrl{ get; set; } 

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public BookScreen ()
			: base (UserInterfaceIdiomIsPhone ? "BookScreen_iPhone" : "BookScreen_iPad", null)
		{
			//Console.WriteLine ("SETTING THE WEBVIEW TO FILL THE SCREEN");
			//this.webViewBookScreen.AutoresizingMask = UIViewAutoresizing.FlexibleWidth;

		}


		public void loadThisUrl( string urlToLoad )
		{
			if (urlToLoad != bookUrl) 
			{
				Console.WriteLine ("urlToLoad:  " + urlToLoad );
				bookUrl = urlToLoad;
				//webView.LoadRequest(new NSUrlRequest(new NSUrl(localHtmlUrl, false)));
				this.webViewBookScreen.LoadRequest(new NSUrlRequest(new NSUrl(bookUrl, false)));
				// Perform any additional setup after loading the view, typically from a nib.
				//this.webViewBookScreen.ScalesPageToFit = true;
			}
		}


		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			Console.WriteLine ("SETTING THE WEBVIEW TO FILL THE SCREEN from viewdidload");
			this.webViewBookScreen.AutoresizingMask = UIViewAutoresizing.FlexibleWidth;
		}
	}
}

