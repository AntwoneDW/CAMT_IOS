using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace CAMT_IOS
{
	public partial class MainScreen : UIViewController
	{

		BookScreen bookScreen;
		SearchResultsScreen searchResultsScreen;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public MainScreen ()
			: base (UserInterfaceIdiomIsPhone ? "MainScreen_iPhone" : "MainScreen_iPad", null)
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

			//---- when the hello world button is clicked
			this.btnCamtBook.TouchUpInside += (sender, e) => {
				//---- instantiate a new hello world screen, if it's null
				// (it may not be null if they've navigated backwards
				if(this.bookScreen == null)
				{ this.bookScreen = new BookScreen(); }
				//---- push our hello world screen onto the navigation
				//controller and pass a true so it navigates
				string url = "http://google.com";
				BookScreen.bookUrl = url;
				this.NavigationController.PushViewController(this.bookScreen, true);
			};

			//---- same thing, but for the hello universe screen
			this.btnTerminologyGuide.TouchUpInside += (sender, e) => {
				//---- instantiate a new hello world screen, if it's null
				// (it may not be null if they've navigated backwards
				if(this.bookScreen == null)
				{ this.bookScreen = new BookScreen(); }
				//---- push our hello world screen onto the navigation
				//controller and pass a true so it navigates
				string url = "http://reddit.com";
				BookScreen.bookUrl = url;
				this.NavigationController.PushViewController(this.bookScreen, true);
			};

			/*
			  base.ViewDidLoad ();			
			// Perform any additional setup after loading the view, typically from a nib.
			*/
		}
	}
}

