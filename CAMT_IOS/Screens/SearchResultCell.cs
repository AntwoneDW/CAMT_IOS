using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace CAMT_IOS
{
	public partial class SearchResultCell : UITableViewCell
	{
		public static readonly NSString Key = new NSString ("SearchResultCell");
		public static readonly UINib Nib;

		static SearchResultCell ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone)
				Nib = UINib.FromName ("SearchResultCell_iPhone", NSBundle.MainBundle);
			else
				Nib = UINib.FromName ("SearchResultCell_iPad", NSBundle.MainBundle);
		}

		public SearchResultCell (IntPtr handle) : base (handle)
		{
		}

		public static SearchResultCell Create ()
		{
			return (SearchResultCell)Nib.Instantiate (null, null) [0];
		}
	}
}

