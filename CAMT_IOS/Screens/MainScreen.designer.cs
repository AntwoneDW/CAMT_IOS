// WARNING
//
// This file has been generated automatically by Xamarin Studio to store outlets and
// actions made in the Xcode designer. If it is removed, they will be lost.
// Manual changes to this file may not be handled correctly.
//
using MonoTouch.Foundation;

namespace CAMT_IOS
{
	[Register ("MainScreen")]
	partial class MainScreen
	{
		[Outlet]
		MonoTouch.UIKit.UIButton btnCamtBook { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnLms { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnTerminologyGuide { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnVideos { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (btnCamtBook != null) {
				btnCamtBook.Dispose ();
				btnCamtBook = null;
			}

			if (btnTerminologyGuide != null) {
				btnTerminologyGuide.Dispose ();
				btnTerminologyGuide = null;
			}

			if (btnVideos != null) {
				btnVideos.Dispose ();
				btnVideos = null;
			}

			if (btnLms != null) {
				btnLms.Dispose ();
				btnLms = null;
			}
		}
	}
}
