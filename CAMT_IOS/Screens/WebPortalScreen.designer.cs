// WARNING
//
// This file has been generated automatically by Xamarin Studio to store outlets and
// actions made in the UI designer. If it is removed, they will be lost.
// Manual changes to this file may not be handled correctly.
//
using MonoTouch.Foundation;
using System.CodeDom.Compiler;

namespace CAMT_IOS
{
	[Register ("WebPortalScreen")]
	partial class WebPortalScreen
	{
		[Outlet]
		MonoTouch.UIKit.UIWebView webViewPortal { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (webViewPortal != null) {
				webViewPortal.Dispose ();
				webViewPortal = null;
			}
		}
	}
}
