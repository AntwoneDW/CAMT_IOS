// WARNING
//
// This file has been generated automatically by Xamarin Studio to store outlets and
// actions made in the Xcode designer. If it is removed, they will be lost.
// Manual changes to this file may not be handled correctly.
//
using MonoTouch.Foundation;

namespace CAMT_IOS
{
	[Register ("SearchResultsScreen")]
	partial class SearchResultsScreen
	{
		[Outlet]
		MonoTouch.UIKit.UITableView tableSearchResults { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (tableSearchResults != null) {
				tableSearchResults.Dispose ();
				tableSearchResults = null;
			}
		}
	}
}
