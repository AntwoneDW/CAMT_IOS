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
	[Register ("VideoListScreen")]
	partial class VideoListScreen
	{
		[Outlet]
		MonoTouch.UIKit.UIButton btnCloggedWaterPump { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnDishWasherAndCornerSeal { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnDryAirFlowTrouble { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnRefrigTherm { get; set; }

		[Outlet]
		MonoTouch.UIKit.UIButton btnResetOvenTemp { get; set; }

		[Outlet]
		MonoTouch.UIKit.UITableView dynamicVideoTable { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (btnCloggedWaterPump != null) {
				btnCloggedWaterPump.Dispose ();
				btnCloggedWaterPump = null;
			}

			if (btnDishWasherAndCornerSeal != null) {
				btnDishWasherAndCornerSeal.Dispose ();
				btnDishWasherAndCornerSeal = null;
			}

			if (btnDryAirFlowTrouble != null) {
				btnDryAirFlowTrouble.Dispose ();
				btnDryAirFlowTrouble = null;
			}

			if (btnRefrigTherm != null) {
				btnRefrigTherm.Dispose ();
				btnRefrigTherm = null;
			}

			if (btnResetOvenTemp != null) {
				btnResetOvenTemp.Dispose ();
				btnResetOvenTemp = null;
			}

			if (dynamicVideoTable != null) {
				dynamicVideoTable.Dispose ();
				dynamicVideoTable = null;
			}
		}
	}
}
