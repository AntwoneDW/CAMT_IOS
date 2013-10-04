using System;
using System.Collections.Generic;
using System.IO;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace CAMT_IOS {
	public class TableSource : UITableViewSource {
		public static Dictionary<string,string> tableItems = new Dictionary<string, string>();
		public static List<string> tableItemText = new List<string>();
		public static List<string> tableItemPageLocation = new List<string>();
		protected string cellIdentifier = "TableCell";
		SearchResultsScreen searchResultScreen;

		public TableSource (SearchResultsScreen searchResultScreen)
		{
			this.searchResultScreen = searchResultScreen;
		}
	
		/// <summary>
		/// Called by the TableView to determine how many cells to create for that particular section.
		/// </summary>
		public override int RowsInSection (UITableView tableview, int section)
		{
			return tableItems.Keys.Count;
		}
		
		/// <summary>
		/// Called when a row is touched
		/// </summary>
		public override void RowSelected (UITableView tableView, NSIndexPath indexPath)
		{
			try {
				//string valueForKey = tableView.CellAt(indexPath).ValueForKey;
				//new UIAlertView ("Row Selected"
				//                 , tableItemText [indexPath.Row], null, "OK", null).Show ();
				tableView.DeselectRow (indexPath, true);
				string locationPath = tableItemPageLocation [indexPath.Row];
				searchResultScreen.gotoSearchResultPage( locationPath );
			}catch (Exception ex)
				{
					Console.WriteLine(ex.Message);
					Console.WriteLine(ex.StackTrace);
					if (ex.InnerException != null)
					{
						Console.WriteLine(ex.InnerException.Message);
						Console.WriteLine(ex.InnerException.StackTrace);
					}
				}
		}
		
		/// <summary>
		/// Called by the TableView to get the actual UITableViewCell to render for the particular row
		/// </summary>
		public override UITableViewCell GetCell (UITableView tableView, MonoTouch.Foundation.NSIndexPath indexPath)
		{
			// request a recycled cell to save memory
			UITableViewCell cell = tableView.DequeueReusableCell (cellIdentifier);
			// if there are no cells to reuse, create a new one
			if (cell == null)
				cell = new UITableViewCell (UITableViewCellStyle.Default, cellIdentifier);
			string tableTextStr = tableItemText [indexPath.Row];
			cell.TextLabel.Text = tableTextStr;
			
			return cell;
		}
	}
}