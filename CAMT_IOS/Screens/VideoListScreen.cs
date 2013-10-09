using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using MonoTouch.MediaPlayer;
using System.IO;
using System.Collections.Generic;

namespace CAMT_IOS
{
	public partial class VideoListScreen : UIViewController
	{
		MPMoviePlayerController moviePlayer;
		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public VideoListScreen ()
			: base (UserInterfaceIdiomIsPhone ? "VideoListScreen_iPhone" : "VideoListScreen_iPad", null)
		{
		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}
		/* 
			"CloggedWaterPump_x264.mp4",
			"Dish Washer and Corner Seal.flv_x264.mp4",
			"Dryer Air Flow Troubleshooting_x264.mp4",
			"Refridgerator Thermomemeter_x264.mp4",
			"Reset Oven Temp_x264.mp4",

		 */
		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			List<string> fileNameList = new List<string> ();
			foreach (string filePath in Directory.GetFiles (MainScreen.videoFileDirStr)) 
			{
				string fileName = Path.GetFileName (filePath);
				if (fileName.EndsWith (".mp4")) 
				{
					fileNameList.Add (fileName);
				}
			}
			TableSource vidTblSrc = new TableSource(this, fileNameList.ToArray() );
			this.dynamicVideoTable.Source = vidTblSrc;

		}

		public class TableSource : UITableViewSource {
			protected string[] tableItems;
			protected string cellIdentifier = "TableCell";
			VideoListScreen vidScreen;
			public TableSource (VideoListScreen vidScreenArg, string[] items)
			{
				vidScreen = vidScreenArg;
				tableItems = items;
			}
			public override int RowsInSection (UITableView tableview, int section)
			{
				return tableItems.Length;
			}
			public override UITableViewCell GetCell (UITableView tableView, MonoTouch.Foundation.NSIndexPath indexPath)
			{
				// request a recycled cell to save memory
				UITableViewCell cell = tableView.DequeueReusableCell (cellIdentifier);
				// if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell (UITableViewCellStyle.Default, cellIdentifier);
				cell.TextLabel.Text = tableItems[indexPath.Row];
				return cell;
			}
			public override void RowSelected (UITableView tableView, NSIndexPath indexPath)
			{   
				//new UIAlertView("Row Selected", tableItems[indexPath.Row], null, "OK", null).Show();
				string fileName = tableItems [indexPath.Row];
				tableView.DeselectRow (indexPath, true); // iOS convention is to remove the highlight
				vidScreen.PlayThatVideo (fileName);
			}

		}

		void PlayThatVideo (string vidName)
		{
			Console.WriteLine ("About to play: " + vidName);
			string videoFileLocationPrefix = MainScreen.videoFileDirStr;
			Console.WriteLine ("videoFileLocationPrefix: " + videoFileLocationPrefix);
			string finalVidPath = Path.Combine (videoFileLocationPrefix, vidName);
			Console.WriteLine ("finalVidPath: " + finalVidPath);
			bool vidFileExists = File.Exists (finalVidPath);
			Console.WriteLine ("vidFileExists: " + vidFileExists);
			if (vidFileExists == true) {
				moviePlayer = new MPMoviePlayerController (NSUrl.FromFilename (finalVidPath));
				View.AddSubview (moviePlayer.View);
				moviePlayer.SetFullscreen (true, true);
				moviePlayer.Play ();
			}
			else {
				new UIAlertView ("Not Ready Yet", "That video has not downloaded yet, try to click in a few minutes", null, "OK", null).Show ();
			}
		}
	}
}

