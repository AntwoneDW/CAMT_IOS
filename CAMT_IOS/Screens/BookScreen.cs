using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace CAMT_IOS
{
	public partial class BookScreen : UIViewController
	{
		public static string bookUrl  { get; set; } 

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public BookScreen ()
			: base (UserInterfaceIdiomIsPhone ? "BookScreen_iPhone" : "BookScreen_iPad", null)
		{
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
			this.webViewBookScreen.LoadRequest(new NSUrlRequest(new NSUrl(bookUrl)));
			// Perform any additional setup after loading the view, typically from a nib.
		}
	}
}

