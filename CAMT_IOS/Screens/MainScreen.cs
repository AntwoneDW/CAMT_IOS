using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using System.IO;
using System.Threading.Tasks;
using System.Net;
using System.Text;
using System.IO.Compression;
using MiniZip.ZipArchive;

namespace CAMT_IOS
{
	public partial class MainScreen : UIViewController
	{
		
		UIButton showSimpleButton, showComplexButton;
		UIActionSheet actionSheet;

		BookScreen bookScreen;
		SearchResultsScreen searchResultsScreen;
		LoadingOverlay loadingOverlay;
		VideoListScreen vidListScreen;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public MainScreen ()
			: base (UserInterfaceIdiomIsPhone ? "MainScreen_iPhone" : "MainScreen_iPad", null)
		{
		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

//		CloggedWaterPump_x264.mp4
//			Dish Washer and Corner Seal.flv_x264.mp4
//				Dish Washer and Corner Seal_x264.mp4
//				Dryer Air Flow Troubleshooting_x264.mp4
//				Refridgerator Thermomemeter_x264.mp4
//				Reset Oven Temp_x264.mp4
		public static string[] vidFileNames = new string[]
 		{
			"CloggedWaterPump_x264.mp4",
			"Dish Washer and Corner Seal.flv_x264.mp4",
			"Dryer Air Flow Troubleshooting_x264.mp4",
			"Refridgerator Thermomemeter_x264.mp4",
			"Reset Oven Temp_x264.mp4",
		};
		public static string pathToVideoFiles = "";
		public void setupVideos2()
		{
			Console.WriteLine ("setupVideos() STARTING");
			foreach (string vidFileName in vidFileNames) {
				try
				{
					var webClient = new WebClient();
					string documentsPath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
					documentsPath = documentsPath + Path.DirectorySeparatorChar + "_CAMT_VIDEOS";
					pathToVideoFiles = documentsPath;
					Directory.CreateDirectory(pathToVideoFiles );
					string localPath = Path.Combine (pathToVideoFiles, vidFileName);
					webClient.DownloadDataCompleted += (s, e) => {
						try {
							Console.WriteLine("Download of videos file is complete");
							var bytes = e.Result; // get the downloaded data
							Console.WriteLine("Saving to : " + localPath );
							Console.WriteLine("writing bytes now to : " + localPath );
							File.WriteAllBytes (localPath, bytes); // writes to local storage   

							string[] files = Directory.GetFiles(  pathToVideoFiles );
							foreach(string tempFile in files )
							{
								Console.WriteLine( "files at dir of video files: " + Path.GetFileName( tempFile ) );
							}
						} catch (Exception ex) {
							Console.WriteLine(ex.Message);
							Console.WriteLine(ex.StackTrace); 
						}
					};
					var url = new Uri("http://dynatechonline.com/_temp/_camt_vids/" + vidFileName ); // Html home page
					Console.WriteLine("downloading from url: " + url);
					if( File.Exists( localPath ) == false )
					{
						Console.WriteLine("Video File Zip Not there so downloading");
						webClient.DownloadDataAsync(url);
					}else
					{
						Console.WriteLine("No need to download that video it exists");
					}
				}
				catch (Exception e)
				{
					Console.WriteLine(e);
					Console.WriteLine(e.Message);
					Console.WriteLine(e.StackTrace);
				}
			}
			Console.WriteLine ("setupVideos() ENDING");

		}

		public static string videoFileDirStr = "";
		public static string videoFileZipLoc = "";
		public void setupVideos()
		{
			Console.WriteLine ("setupVideos() STARTING");
			try
			{
				var webClient = new WebClient();
				string localFilename = "Videos.zip";
				string documentsPath = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
				string localPath = Path.Combine (documentsPath, localFilename);
				videoFileDirStr = documentsPath;
				videoFileZipLoc = localPath;
				webClient.DownloadDataCompleted += (s, e) => {
					try {
						Console.WriteLine("Download of videos file is complete");
						var bytes = e.Result; // get the downloaded data
						Console.WriteLine("Saving to : " + localPath );
						Console.WriteLine("writing bytes now to : " + localPath );
						File.WriteAllBytes (localPath, bytes); // writes to local storage   
						Console.WriteLine("extracting the zip file: " );
						var zip = new ZipArchive ();
						zip.EasyUnzip (videoFileZipLoc, videoFileDirStr, true, "");
						Console.WriteLine("Extraction done " );
						string[] files = Directory.GetFiles( videoFileDirStr );
						foreach(string tempFile in files )
						{
							Console.WriteLine( "files of extract location: " + Path.GetFileName( tempFile ) );
						}
						//Utility.unZipIt(videoFileZipLoc);
					} catch (Exception ex) {
						Console.WriteLine(ex.Message);
						Console.WriteLine(ex.StackTrace); 
					}
				};
				var url = new Uri("http://dynatechonline.com/_temp/_camt_vids/Videos.zip"); // Html home page
				Console.WriteLine("downloading from url: " + url);
				if( File.Exists( videoFileZipLoc ) == false )
				{
					Console.WriteLine("Video File Zip Not there so downloading");
					webClient.DownloadDataAsync(url);
				}else
				{
					Console.WriteLine("No need to download videos b/c they are there");
					string[] files = Directory.GetFiles( videoFileDirStr );
//					string testFilePath = videoFileDirStr + Path.DirectorySeparatorChar + "Videos";
//					Console.WriteLine("testFilePath: " +   testFilePath );
//					Console.WriteLine("File.Exists( testFilePath ): " +   File.Exists( testFilePath ) );
//					if( File.Exists( testFilePath ) == false)
//					{
						Console.WriteLine("EXTRACTING");
					var zip = new ZipArchive ();    
					if (zip.UnzipOpenFile (videoFileZipLoc, "")) {
						zip.UnzipFileTo (videoFileDirStr, true);           
						zip.UnzipCloseFile ();
					}						

					//var zip = new ZipArchive ( );
						//zip.UnzipFileTo( videoFileDirStr, true );
						//zip.EasyUnzip (videoFileZipLoc, videoFileDirStr, true, "");
					//}
					foreach(string tempFile in files )
					{
						Console.WriteLine( "files of extract location: " + Path.GetFileName( tempFile ) );
					}
					files = Directory.GetFiles( videoFileDirStr+Path.DirectorySeparatorChar+"Videos" );
					foreach(string tempFile in files )
					{
						Console.WriteLine( "files of VIDEOS extract location: " + Path.GetFileName( tempFile ) );
					}
				}
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                Console.WriteLine(e.Message);
                Console.WriteLine(e.StackTrace);
            }
			Console.WriteLine ("setupVideos() ENDING");
			           
        }

		public override UIInterfaceOrientationMask GetSupportedInterfaceOrientations ()
		{
			return UIInterfaceOrientationMask.Portrait;
		}

		WebPortalScreen naaWebPortal, aimeWebPortal, lmsWebPortal;

		public override void ViewDidLoad ()
		{
			try{
				base.ViewDidLoad ();
				///SETUP VIDEOS TASK
				// spin up a new thread to do some long running work using StartNew
				Task.Factory.StartNew (
					// tasks allow you to use the lambda syntax to pass work
					() => {

					Console.WriteLine ( "Hello from setting up the videos via a task." );
					try {
						setupVideos2 ();
					} catch (Exception ex) {
						Console.WriteLine(ex.Message);
						Console.WriteLine(ex.StackTrace);
					}
				}
				// ContinueWith allows you to specify an action that runs after the previous thread
				// completes
				// 
				// By using TaskScheduler.FromCurrentSyncrhonizationContext, we can make sure that 
				// this task now runs on the original calling thread, in this case the UI thread
				// so that any UI updates are safe. in this example, we want to hide our overlay, 
				// but we don't want to update the UI from a background thread.
				).ContinueWith ( 
				                t => {
					Console.WriteLine("Ssetup videos ContinueWith");
				}, TaskScheduler.FromCurrentSynchronizationContext()
				);

				////END SETUP VIDEOS TASK

				//			UIButton *_btnAimeLogo;
				//		    UIButton *_btnLowes;
				//			UIButton *_btnNaaLogo;



				btnLowes.TouchDown += (sender, e) => {
					Console.WriteLine("lowesLogoImg clicked");
					//---- instantiate a new hello world screen, if it's null
					// (it may not be null if they've navigated backwards
					if(this.naaWebPortal == null)
					{ this.naaWebPortal = new WebPortalScreen(); }
					//---- push our hello world screen onto the navigation
					//controller and pass a true so it navigates
					string url = "http://www.lowesforpros.com/";
					Console.WriteLine ("url:  " + url );
					this.NavigationController.PushViewController(this.naaWebPortal, true);
					naaWebPortal.loadThisUrl(url);
				};

				//			naaLogoImg.TouchesEnded += (sender, e) => {
				//				Console.WriteLine("naaLogoImg clicked");
				//				//---- instantiate a new hello world screen, if it's null
				//				// (it may not be null if they've navigated backwards
				//				if(this.naaWebPortal == null)
				//				{ this.naaWebPortal = new WebPortalScreen(); }
				//				//---- push our hello world screen onto the navigation
				//				//controller and pass a true so it navigates
				//				string url = "http://www.naahq.org";
				//				Console.WriteLine ("url:  " + url );
				//				this.NavigationController.PushViewController(this.naaWebPortal, true);
				//				naaWebPortal.loadThisUrl(url);
				//			};

				//			aimeLogoImg.TouchesEnded += (sender, e) => {
				//				Console.WriteLine("aimeLogoImg clicked");
				//				//---- instantiate a new hello world screen, if it's null
				//				// (it may not be null if they've navigated backwards
				//				if(this.aimeWebPortal == null)
				//				{ this.aimeWebPortal = new WebPortalScreen(); }
				//				//---- push our hello world screen onto the navigation
				//				//controller and pass a true so it navigates
				//				string url = "hhttp://www.naahq.org/learn/education/certificate-for-apartment-maintenance-technicians/apartment-institute-maintenance-excellence-aime";
				//				Console.WriteLine ("url:  " + url );
				//				this.NavigationController.PushViewController(this.aimeWebPortal, true);
				//				aimeWebPortal.loadThisUrl(url);
				//			};
				//
				// to validate after the user has entered text and moved away from that 
				// text field, use EditingDidEnd
				this.searchTextInput.ShouldReturn = (tf) => 
				{               
					tf.ResignFirstResponder();              
					// perform a simple "required" validation
					UITextField senderTextField = ((UITextField)searchTextInput);
					string searchText = senderTextField.Text;
					Console.WriteLine("Input put in to search for is: " + searchText );
					if ( searchText.Length <= 0 ) {
						// need to update on the main thread to change the border color
						InvokeOnMainThread ( () => {
							this.searchTextInput.BackgroundColor = UIColor.Yellow;
							this.searchTextInput.Layer.BorderColor = UIColor.Red.CGColor;
							this.searchTextInput.Layer.BorderWidth = 3;
							this.searchTextInput.Layer.CornerRadius = 5;
						} );
					}else
					{
						searchTextInput.ResignFirstResponder();

						Console.WriteLine("DISPLAYING LOADING OVERLAY");
						// show the loading overlay on the UI thread
						this.loadingOverlay = new LoadingOverlay (UIScreen.MainScreen.Bounds);
						this.View.Add ( this.loadingOverlay );

						System.Collections.Generic.Dictionary<string, string> searchResultsDict = new System.Collections.Generic.Dictionary<string, string>();


						// spin up a new thread to do some long running work using StartNew
						Task.Factory.StartNew (
							// tasks allow you to use the lambda syntax to pass work
							() => {
							Console.WriteLine ( "Hello from taskA." );
							try {
								searchResultsDict = 
									Utility.SearchForThis(NSBundle.MainBundle, "ALL", searchText);
							} catch (Exception ex) {
								Console.WriteLine(ex.Message);
								Console.WriteLine(ex.StackTrace);
							}
						}
						// ContinueWith allows you to specify an action that runs after the previous thread
						// completes
						// 
						// By using TaskScheduler.FromCurrentSyncrhonizationContext, we can make sure that 
						// this task now runs on the original calling thread, in this case the UI thread
						// so that any UI updates are safe. in this example, we want to hide our overlay, 
						// but we don't want to update the UI from a background thread.
						).ContinueWith ( 
						                t => {
							Console.WriteLine("HIDING LOADING OVERLAY");
							this.loadingOverlay.Hide ();
							loadingOverlay.Hide ();

							if(this.searchResultsScreen == null)
							{ this.searchResultsScreen = new SearchResultsScreen(); }

							TableSource.tableItems = searchResultsDict;
							TableSource.tableItemText.Clear();
							TableSource.tableItemPageLocation.Clear();
							TableSource.tableItemText.AddRange( searchResultsDict.Keys );
							TableSource.tableItemPageLocation.AddRange( searchResultsDict.Values );
							this.NavigationController.PushViewController (this.searchResultsScreen, true);

						}, TaskScheduler.FromCurrentSynchronizationContext()
						);
						/*string bookPageUrl = tableItems [indexPath.Row];

					Console.WriteLine ("localHtmlUrl:  " + bookPageUrl);
					//BookScreen.bookUrl = url;
					this.NavigationController.PushViewController (this.bookScreen, true);
					bookScreen.loadThisUrl (bookPageUrl);
					*/
					}				return true;
				};
				this.searchTextInput.ReturnKeyType = UIReturnKeyType.Done;
				this.searchTextInput.EditingDidEnd += (object sender, EventArgs e) => {

				};


				//			float rgb_r = 0.467f;
				//			float rgb_g = 0.608f;
				//			float rgb_b = 0.204f;
				//			btnCamtBook.BackgroundColor = UIColor.FromRGB (rgb_r,rgb_g,rgb_b);
				//this.btnCamtBook = UIButton.FromType(UIButtonType.RoundedRect);
				//---- when the hello world button is clicked
				this.btnCamtBook.TouchUpInside += (sender, e) => {
					//---- instantiate a new hello world screen, if it's null
					// (it may not be null if they've navigated backwards
					if(this.bookScreen == null)
					{ this.bookScreen = new BookScreen(); }
					//---- push our hello world screen onto the navigation
					//controller and pass a true so it navigates
					string fileName = "Content/CAMT_Participant_OneBook_Single/index.html"; // remember case-sensitive
					string localHtmlUrl = Path.Combine (NSBundle.MainBundle.BundlePath, fileName);
					Console.WriteLine ("fileName:  " + fileName );
					string url = localHtmlUrl;//"http://google.com";
					Console.WriteLine ("localHtmlUrl:  " + localHtmlUrl );
					//BookScreen.bookUrl = url;
					this.NavigationController.PushViewController(this.bookScreen, true);
					bookScreen.loadThisUrl(url);
				};

				//---- same thing, but for the hello universe screen
				this.btnTerminologyGuide.TouchUpInside += (sender, e) => {

					///ACTION SHEET LANGUAGE OPTION START
					actionSheet = new UIActionSheet ("ActionSheet with Buttons");
					actionSheet.AddButton ("ENGLISH");
					actionSheet.AddButton ("SPANISH");
					//actionSheet.DestructiveButtonIndex = 0;
					//actionSheet.DismissWithClickedButtonIndex = .CancelButtonIndex = 1;
					//actionSheet.FirstOtherButtonIndex = 2;
					actionSheet.Clicked += delegate(object a, UIButtonEventArgs b) {
						string buttonString = actionSheet.ButtonTitle( b.ButtonIndex ) ; 
						Console.WriteLine ("buttonString " + buttonString + " clicked");

						//---- instantiate a new hello world screen, if it's null
						// (it may not be null if they've navigated backwards
						string fileName = "Content/CAMT-Text-Spanish-HR_2011/index.html"; // remember case-sensitive
						if( buttonString == "ENGLISH" )
						{
							fileName = "Content/CAMT-English-HR_2011_2/index.html";
						}
						Console.WriteLine ("fileName:  " + fileName );
						//---- push our hello world screen onto the navigation
						//controller and pass a true so it navigates
						string localHtmlUrl = Path.Combine (NSBundle.MainBundle.BundlePath, fileName);
						string url = localHtmlUrl;//"http://google.com";
						//BookScreen.bookUrl = url;

						if(this.bookScreen == null)
						{ this.bookScreen = new BookScreen(); }
						this.NavigationController.PushViewController(this.bookScreen, true);
						bookScreen.loadThisUrl(url);

					};
					actionSheet.ShowInView (View);
					/// ACTION SHEET LANGUAGE OPTION END			
				};

				this.btnVideos.TouchUpInside += (sender, e) => {
					Console.WriteLine("btnVideos clicked");
					//---- instantiate a new hello world screen, if it's null
					// (it may not be null if they've navigated backwards
					if(this.vidListScreen == null)
					{ this.vidListScreen = new VideoListScreen(); }
					//---- push our hello world screen onto the navigation
					//controller and pass a true so it navigates
					this.NavigationController.PushViewController(this.vidListScreen, true);
				};

				btnLms.TouchUpInside += (sender, e) => {
					Console.WriteLine("lms clicked");
					//---- instantiate a new hello world screen, if it's null
					// (it may not be null if they've navigated backwards
					if(this.lmsWebPortal == null)
					{ this.lmsWebPortal = new WebPortalScreen(); }
					//---- push our hello world screen onto the navigation
					//controller and pass a true so it navigates
					string url = "http://www.naahq.org/learn/education/certification-for-apartment-maintenance-technicians/welcome-lms";
					Console.WriteLine ("url:  " + url );
					this.NavigationController.PushViewController(this.lmsWebPortal, true);
					lmsWebPortal.loadThisUrl(url);
				};
				/*
			  base.ViewDidLoad ();			
			// Perform any additional setup after loading the view, typically from a nib.
			*/
			}
			catch(Exception ex) {
				Console.WriteLine (ex.Message);
				Console.WriteLine (ex.StackTrace);
			}
		}
	}
}

