// WARNING
//
// This file has been generated automatically by Xamarin Studio to store outlets and
// actions made in the Xcode designer. If it is removed, they will be lost.
// Manual changes to this file may not be handled correctly.
//
using MonoTouch.Foundation;

namespace CAMT_IOS
{
	[Register ("BookScreen")]
	partial class BookScreen
	{
		[Outlet]
		MonoTouch.UIKit.UIWebView webViewBookScreen { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (webViewBookScreen != null) {
				webViewBookScreen.Dispose ();
				webViewBookScreen = null;
			}
		}
	}
}
