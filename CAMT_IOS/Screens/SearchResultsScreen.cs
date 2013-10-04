using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace CAMT_IOS
{
	public partial class SearchResultsScreen : UIViewController
	{
		BookScreen bookScreen;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public SearchResultsScreen ()
			: base (UserInterfaceIdiomIsPhone ? "SearchResultsScreen_iPhone" : "SearchResultsScreen_iPad", null)
		{
		}

		public void gotoSearchResultPage(string pathUrl)
		{
			if(this.bookScreen == null)
			{ this.bookScreen = new BookScreen(); }
			Console.WriteLine ("pathUrl:  " + pathUrl );
			//BookScreen.bookUrl = url;
			this.NavigationController.PushViewController(this.bookScreen, true);
			bookScreen.loadThisUrl(pathUrl);
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

			tableSearchResults.AutoresizingMask = UIViewAutoresizing.All;
			//string[] tableItems = new string[] {"Vegetables","Fruits","Flower Buds","Legumes","Bulbs","Tubers"};
			tableSearchResults.Source = new TableSource(this);

			// Perform any additional setup after loading the view, typically from a nib.
		}
	}
}

