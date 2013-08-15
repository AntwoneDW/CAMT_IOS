using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using MonoTouch.MediaPlayer;
using System.IO;

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
			
			// Perform any additional setup after loading the view, typically from a nib.
			this.btnCloggedWaterPump.TouchUpInside += (sender, e) => {
				string vidName = "CloggedWaterPump_x264.mp4";
				PlayThatVideo (vidName);
			};

			// Perform any additional setup after loading the view, typically from a nib.
			this.btnDishWasherAndCornerSeal.TouchUpInside += (sender, e) => {
				string vidName = "Dish Washer and Corner Seal.flv_x264.mp4";
				PlayThatVideo (vidName);
			};

			// Perform any additional setup after loading the view, typically from a nib.
			this.btnDryAirFlowTrouble.TouchUpInside += (sender, e) => {
				string vidName = "Dryer Air Flow Troubleshooting_x264.mp4";
				PlayThatVideo (vidName);
			};

			// Perform any additional setup after loading the view, typically from a nib.
			this.btnRefrigTherm.TouchUpInside += (sender, e) => {
				string vidName = "Refridgerator Thermomemeter_x264.mp4";
				PlayThatVideo (vidName);
			};

			// Perform any additional setup after loading the view, typically from a nib.
			this.btnResetOvenTemp.TouchUpInside += (sender, e) => {
				string vidName = "Reset Oven Temp_x264.mp4";
				PlayThatVideo (vidName);
			};

		}

		void PlayThatVideo (string vidName)
		{
			Console.WriteLine ("About to play: " + vidName);
			string videoFileLocationPrefix = MainScreen.pathToVideoFiles;
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

