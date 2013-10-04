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
	[Register ("MainScreen")]
	partial class MainScreen
	{
		[Outlet]
		MonoTouch.UIKit.UIButton btnAimeLogo { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnCamtBook { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnLms { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnLowes { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnNaaLogo { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnTerminologyGuide { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnVideos { get; set; }

		[Outlet]
		MonoTouch.UIKit.UITextField searchTextInput { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (searchTextInput != null) {
				searchTextInput.Dispose ();
				searchTextInput = null;
			}

			if (btnCamtBook != null) {
				btnCamtBook.Dispose ();
				btnCamtBook = null;
			}

			if (btnLms != null) {
				btnLms.Dispose ();
				btnLms = null;
			}

			if (btnTerminologyGuide != null) {
				btnTerminologyGuide.Dispose ();
				btnTerminologyGuide = null;
			}

			if (btnVideos != null) {
				btnVideos.Dispose ();
				btnVideos = null;
			}

			if (btnLowes != null) {
				btnLowes.Dispose ();
				btnLowes = null;
			}

			if (btnAimeLogo != null) {
				btnAimeLogo.Dispose ();
				btnAimeLogo = null;
			}

			if (btnNaaLogo != null) {
				btnNaaLogo.Dispose ();
				btnNaaLogo = null;
			}
		}
	}
}
