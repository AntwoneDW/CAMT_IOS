using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace CAMT_IOS
{
	public partial class WebPortalScreen : UIViewController
	{
		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public WebPortalScreen ()
			: base (UserInterfaceIdiomIsPhone ? "WebPortalScreen_iPhone" : "WebPortalScreen_iPad", null)
		{
		}
		public static string theUrl = "";
		public void loadThisUrl( string urlToLoad )
		{
			if (urlToLoad != theUrl) 
			{
				Console.WriteLine ("urlToLoad:  " + urlToLoad );
				theUrl = urlToLoad;
				//webView.LoadRequest(new NSUrlRequest(new NSUrl(localHtmlUrl, false)));
				this.webViewPortal.LoadRequest(new NSUrlRequest(new NSUrl(theUrl)));
				// Perform any additional setup after loading the view, typically from a nib.
				this.webViewPortal.ScalesPageToFit = true;
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
			
			// Perform any additional setup after loading the view, typically from a nib.
		}
	}
}

