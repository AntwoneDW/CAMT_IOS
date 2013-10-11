using System;
using System.Drawing;
using System.Globalization;
using System.Threading;
using System.Xml;
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
		
		UIActionSheet actionSheet;
		BookScreen bookScreen;
		SearchResultsScreen searchResultsScreen;
		LoadingOverlay loadingOverlay;
		VideoListScreen vidListScreen;
        WebPortalScreen naaWebPortal, aimeWebPortal, lmsWebPortal;

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

		public override UIInterfaceOrientationMask GetSupportedInterfaceOrientations ()
		{
			return UIInterfaceOrientationMask.Portrait;
		}

		public static string documentsPath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
		///documentsPath = documentsPath + Path.DirectorySeparatorChar + "_CAMT_VIDEOS";
        private int count = 1;
        public static string mediaUrlPrefix = "http://dynatechonline.com/_temp/CAMT_WEB_UPLOADS/";
        public static string[] bookZipFileNames = new string[] { "ALL_BOOKS.zip" };
		public static string[] videoZipFileNames = new string[] { "CAMT_VIDEOS_MEDIUM.zip" };
		//	"CAMT_VIDEOS_MED_1.zip", "CAMT_VIDEOS_MED_2.zip", "CAMT_VIDEOS_MED_3.zip", "CAMT_VIDEOS_MED_4.zip"
		//	,"CAMT_VIDEOS_MED_5.zip", "CAMT_VIDEOS_MED_6.zip" };
        public static string camtMediaLocalMediaPath = documentsPath + Path.DirectorySeparatorChar + "CAMT_MEDIA";
        public static string videoFileDirStr = camtMediaLocalMediaPath + Path.DirectorySeparatorChar + "CAMT_VIDEOS";
        public static string bookFileDirStr = camtMediaLocalMediaPath + Path.DirectorySeparatorChar + "CAMT_BOOKS";
        //ONE WHOLE BOOKS IN ONE HTML FILE FOR VIEWING
        public static string CAMT_Participant_OneBook_DIRPATH = bookFileDirStr + Path.DirectorySeparatorChar + "CAMT_Participant_OneBook" + Path.DirectorySeparatorChar;
        public static string CAMT_English_HR_2011_DIRPATH = bookFileDirStr + Path.DirectorySeparatorChar + "CAMT-English-HR_2011" + Path.DirectorySeparatorChar;
        public static string CAMT_Text_Spanish_HR_2011_DIRPATH = bookFileDirStr + Path.DirectorySeparatorChar + "CAMT-Text-Spanish-HR_2011" + Path.DirectorySeparatorChar;
        //SPLIT UP BOOKS IN MULTI HTML FILES FOR SEARCHING
        public static string CAMT_Participant_OneBook_MULTI_DIRPATH = bookFileDirStr + Path.DirectorySeparatorChar + "CAMT_Participant_OneBook_Multi" + Path.DirectorySeparatorChar;
        public static string CAMT_English_HR_2011_MULTI_DIRPATH = bookFileDirStr + Path.DirectorySeparatorChar + "CAMT-English-HR_2011_multi" + Path.DirectorySeparatorChar;
        public static string CAMT_Text_Spanish_HR_MULTI_2011_DIRPATH = bookFileDirStr + Path.DirectorySeparatorChar + "CAMT-Text-Spanish-HR_2011_multi" + Path.DirectorySeparatorChar;
        public static string[] searchLocationPathArr = new string[] {  
            videoFileDirStr, 
            CAMT_English_HR_2011_MULTI_DIRPATH, 
            CAMT_Text_Spanish_HR_MULTI_2011_DIRPATH
            ,CAMT_Participant_OneBook_MULTI_DIRPATH
        };
        public static bool downloadingVideos = false;
        public static bool downloadingBooks = false;
        public static string downloadMediaXmlUrl = "http://thecrossfitbuddy.com/CAMTServerSide/CurrentMedia.xml";

		public override void ViewDidLoad ()
		{
			try{
				base.ViewDidLoad ();
				///SETUP VIDEOS TASK
				// spin up a new thread to do some long running work using StartNew
				Task.Factory.StartNew (
				// tasks allow you to use the lambda syntax to pass work
				() => {
					    try {
                            NetworkStatus internetStatus = Reachability.InternetConnectionStatus();
                            if (internetStatus != NetworkStatus.NotReachable)
                            {
								setupCamtMedia(internetStatus);
                            }
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
					string fileName = CAMT_Participant_OneBook_DIRPATH; // remember case-sensitive
					//string localHtmlUrl = Path.Combine (NSBundle.MainBundle.BundlePath, fileName);
					Console.WriteLine ("fileName:  " + fileName );
					//string url = localHtmlUrl;//"http://google.com";
					//Console.WriteLine ("localHtmlUrl:  " + localHtmlUrl );
					//BookScreen.bookUrl = url;
					BookScreen.menuToShow = "CAMT_Participant";
					this.NavigationController.PushViewController(this.bookScreen, true);
					bookScreen.loadThisUrl(fileName +"index.html");
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
						string fileName = CAMT_Text_Spanish_HR_2011_DIRPATH;//"Content/CAMT-Text-Spanish-HR_2011/index.html"; // remember case-sensitive
						BookScreen.menuToShow = "CAMT_Text_Spanish_HR_2011";
						if( buttonString == "ENGLISH" )
						{
							BookScreen.menuToShow = "CAMT_English_HR_2011";
							fileName = CAMT_English_HR_2011_DIRPATH;//"Content/CAMT-English-HR_2011_2/index.html";
						}
						Console.WriteLine ("fileName:  " + fileName );
						//---- push our hello world screen onto the navigation
						//controller and pass a true so it navigates
						//string localHtmlUrl = Path.Combine (NSBundle.MainBundle.BundlePath, fileName);
						//string url = localHtmlUrl;//"http://google.com";
						//BookScreen.bookUrl = url;

						if(this.bookScreen == null)
						{ this.bookScreen = new BookScreen(); }
						this.NavigationController.PushViewController(this.bookScreen, true);
						bookScreen.loadThisUrl(fileName +"index.html");

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
				this.btnLms.AutoresizingMask = UIViewAutoresizing.All;
				this.btnCamtBook.AutoresizingMask = UIViewAutoresizing.All;
				this.btnTerminologyGuide.AutoresizingMask = UIViewAutoresizing.All;
				this.btnVideos.AutoresizingMask = UIViewAutoresizing.All;
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

		public override bool ShouldAutorotateToInterfaceOrientation (UIInterfaceOrientation toInterfaceOrientation)
		{
			return true;
		}

/****
 *   SUPPORTING CAST FUNCTIONS
 */

        public DateTime getLastVideoUpdate()
        {
            Console.WriteLine("getLastBookUpdate Starting");
            DateTime result = DateTime.MinValue;
            var webClient = new WebClient();
            /*<?xml version="1.0" encoding="utf-8" ?>
            <last_updates>
              <!--   yyyy-MM-dd hh:mm tt -->
              <last_books_update>2013-09-18 07:06 PM</last_books_update>
              <last_movies_update>2013-09-18 07:06 PM</last_movies_update>
            </last_updates>*/
            try
            {
                string dateTimeFormatStr = "yyyy-MM-dd hh:mm tt";
                string downloadedString = webClient.DownloadString(downloadMediaXmlUrl);
                //Console.WriteLine("downloadedString: \n" + downloadedString);
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(downloadedString);
                string lastUpdateDateString = doc.GetElementsByTagName("last_movies_update")[0].InnerText;
                Console.WriteLine("lastUpdateDateString: " + lastUpdateDateString);
                DateTime lastUpdateDate;
                lastUpdateDate = new DateTime();
                lastUpdateDate = DateTime.ParseExact(lastUpdateDateString, dateTimeFormatStr, CultureInfo.InvariantCulture);
                Console.WriteLine("getLastBookUpdate \n\t lastUpdateDate: " + lastUpdateDate.ToShortDateString() + " " + lastUpdateDate.ToShortTimeString());
                result = lastUpdateDate;
            }
            catch (Exception ex)
            {
                result = DateTime.MinValue;
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
            }
            Console.WriteLine("getLastBookUpdate ENding");
            return result;
        }

        public DateTime getLastBookUpdate()
        {
            Console.WriteLine("getLastBookUpdate Starting");
            DateTime result = DateTime.MinValue;
            var webClient = new WebClient();
            /*<?xml version="1.0" encoding="utf-8" ?>
            <last_updates>
              <!--   yyyy-MM-dd hh:mm tt -->
              <last_books_update>2013-09-18 07:06 PM</last_books_update>
              <last_movies_update>2013-09-18 07:06 PM</last_movies_update>
            </last_updates>*/
            try
            {
                string dateTimeFormatStr = "yyyy-MM-dd hh:mm tt";
                string downloadedString = webClient.DownloadString(downloadMediaXmlUrl);
                //Console.WriteLine("downloadedString: \n" + downloadedString );
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(downloadedString);
                string lastUpdateDateString = doc.GetElementsByTagName("last_books_update")[0].InnerText;
                Console.WriteLine("lastUpdateDateString: " + lastUpdateDateString);
                DateTime lastUpdateDate;
                lastUpdateDate = new DateTime();
                lastUpdateDate = DateTime.ParseExact(lastUpdateDateString, dateTimeFormatStr, CultureInfo.InvariantCulture);
                Console.WriteLine("getLastBookUpdate \n\t lastUpdateDate: " + lastUpdateDate.ToShortDateString() + " " + lastUpdateDate.ToShortTimeString());
                result = lastUpdateDate;
            }
            catch (Exception ex)
            {
                result = DateTime.MinValue;
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
            }
            Console.WriteLine("getLastBookUpdate ENding");
            return result;
        }


        public bool isBookOld()
        {
            bool result = false;
            try
            {
                DateTime lastServerUpdate = getLastBookUpdate();
                string lastServerUpdateStr = lastServerUpdate.ToShortDateString() + "-" + lastServerUpdate.ToLongTimeString();
                DirectoryInfo dirInfo = new DirectoryInfo(bookFileDirStr);
                DateTime dirCreated = dirInfo.CreationTime;
                string dirCreateDateStr = dirInfo.CreationTime.ToShortDateString() + "-" +
                                       dirInfo.CreationTime.ToLongTimeString();
                Console.WriteLine("isBook Old lastServerUpdateStr @ " + lastServerUpdateStr);
                Console.WriteLine("isBook Old dirCreateDateStr   @ " + dirCreateDateStr);
                if (lastServerUpdate > dirCreated)
                {
                    Console.WriteLine("Book is old");
                    result = true;
                }
            }
            catch (Exception exInstall)
            {
                Console.WriteLine(exInstall.Message);
                Console.WriteLine(exInstall.StackTrace);
                Console.WriteLine();
            }
            return result;
        }

        public bool isVideosOld()
        {
            bool result = false;
            try
            {
                DateTime lastServerUpdate = getLastVideoUpdate();
                string lastServerUpdateStr = lastServerUpdate.ToShortDateString() + "-" + lastServerUpdate.ToLongTimeString();
                DirectoryInfo dirInfo = new DirectoryInfo(videoFileDirStr);
                DateTime dirCreated = dirInfo.CreationTime;
                string dirCreateDateStr = dirInfo.CreationTime.ToShortDateString() + "-" +
                                       dirInfo.CreationTime.ToLongTimeString();
                Console.WriteLine("isVid Old lastServerUpdateStr @ " + lastServerUpdateStr);
                Console.WriteLine("isVid Old dirCreateDateStr   @ " + dirCreateDateStr);
                if (lastServerUpdate > dirCreated)
                {
                    Console.WriteLine("Book is old");
                    result = true;
                }
            }
            catch (Exception exInstall)
            {
                Console.WriteLine(exInstall.Message);
                Console.WriteLine(exInstall.StackTrace);
                Console.WriteLine();
            }
            return result;
        }

        public bool bookFilesExist()
        {
            bool result = true;
            try
            {
                result &= (System.IO.Directory.Exists(CAMT_Participant_OneBook_DIRPATH) == true &&
                           System.IO.Directory.GetFiles(CAMT_Participant_OneBook_DIRPATH).Length > 0);
                result &= (System.IO.Directory.Exists(CAMT_English_HR_2011_DIRPATH) == true &&
                           System.IO.Directory.GetFiles(CAMT_English_HR_2011_DIRPATH).Length > 0);
                result &= (System.IO.Directory.Exists(CAMT_Text_Spanish_HR_2011_DIRPATH) == true &&
                           System.IO.Directory.GetFiles(CAMT_Text_Spanish_HR_2011_DIRPATH).Length > 0);
                result &= (System.IO.Directory.Exists(CAMT_Participant_OneBook_MULTI_DIRPATH) == true &&
                           System.IO.Directory.GetFiles(CAMT_Participant_OneBook_MULTI_DIRPATH).Length > 0);
                result &= (System.IO.Directory.Exists(CAMT_English_HR_2011_MULTI_DIRPATH) == true &&
                           System.IO.Directory.GetFiles(CAMT_English_HR_2011_MULTI_DIRPATH).Length > 0);
                result &= (System.IO.Directory.Exists(CAMT_Text_Spanish_HR_MULTI_2011_DIRPATH) == true &&
                           System.IO.Directory.GetFiles(CAMT_Text_Spanish_HR_MULTI_2011_DIRPATH).Length > 0);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Console.WriteLine(ex.StackTrace);
            }
            return result;
        }

        public bool videoFilesExist()
        {
            bool result = false;
            try
            {
                if (System.IO.Directory.Exists(videoFileDirStr) == true && System.IO.Directory.GetFiles(videoFileDirStr).Length > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Console.WriteLine(ex.StackTrace);
            }
            return result;
        }

        private long lastUpdateMsg = 0;
        private void DownloadProgressCallback(object sender, DownloadProgressChangedEventArgs e)
        {
            // Displays the operation identifier, and the transfer progress.   
            //Console.WriteLine("(DateTime.Now.Ticks - lastUpdateMsg) = " + (DateTime.Now.Ticks - lastUpdateMsg) );
            var seconds = (DateTime.Now.Ticks - lastUpdateMsg) / TimeSpan.TicksPerSecond;
            if (seconds > 10)
            {
                lastUpdateMsg = DateTime.Now.Ticks;
                Console.WriteLine("{0}    downloaded {1} of {2} bytes. {3} % complete...",
                    (string)e.UserState,
                    e.BytesReceived,
                    e.TotalBytesToReceive,
                    e.ProgressPercentage);
            }
        }

        public void setupVideos()
        {
            foreach (string videoZipFileName in videoZipFileNames)
            {
                try
                {
                    string urlString = mediaUrlPrefix + videoZipFileName;
                    bool shouldDownload = (videoFilesExist() == false) || isVideosOld();
                    if (shouldDownload == true)
                    {
                        try {
                        	Directory.Delete(videoFileDirStr, true);
                        	GC.Collect();
                        } catch (Exception ex) {
                        	
                        }
                        while (downloadingBooks)
                        {
                            Thread.Sleep(5 * 1000);
                        }
						var url = new Uri(urlString); // Html home page
						Console.WriteLine("urlString to download video file: " + urlString);
                        downloadingVideos = true;
                        Console.WriteLine("VID DIR didn't exist so creating it");
                        System.IO.Directory.CreateDirectory(videoFileDirStr);
                        Console.WriteLine("Created the DIR, now downloading the videos from the server");
                        var webClient = new WebClient();
                        webClient.DownloadProgressChanged +=
                            new DownloadProgressChangedEventHandler(DownloadProgressCallback);
						//Console.WriteLine("Download completed so now saving it to it's location @ \n" + videoFileDirStr);
						Console.WriteLine("1v");
						Console.WriteLine("2v");
						string localFilename = videoZipFileName;
						Console.WriteLine("3v");
						string localPath = System.IO.Path.Combine(videoFileDirStr, localFilename);
						Console.WriteLine("Downloading now Video File ");
						webClient.DownloadFile( url, localPath );
						Console.WriteLine("5v");
						Console.WriteLine("extracting the zip file: ");
						var zip = new ZipArchive();
						zip.EasyUnzip(localPath, videoFileDirStr, true, "");
						Console.WriteLine("Extraction done ");
						string[] files = Directory.GetFiles(videoFileDirStr);
						foreach (string tempFile in files)
						{
							Console.WriteLine("files of extract location: " + Path.GetFileName(tempFile));
						}  
						System.IO.File.Delete(localPath);
						Console.WriteLine("6v");
						Console.WriteLine("VIDEO FILE Totally Unzipped");

						GC.Collect();

                        //webClient.DownloadData(url);
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("THERE WAS AN ERROR IN setupVideos");
                    Console.WriteLine(e);
                    Console.WriteLine(e.Message);
                    Console.WriteLine(e.StackTrace);
                    Console.WriteLine("=================================");
                    downloadingVideos = false;
                }

            }
			downloadingVideos = false;
        }


        public void setupBooks()
        {
            try
            {
                bool shouldDownload = (bookFilesExist() == false) || isBookOld();
                if (shouldDownload == true)
                {
                    GC.Collect();
                    try
                    {
                        Directory.Delete(CAMT_English_HR_2011_DIRPATH, true);
                        Directory.Delete(CAMT_English_HR_2011_MULTI_DIRPATH, true);
                        Directory.Delete(CAMT_Text_Spanish_HR_2011_DIRPATH, true);
                        Directory.Delete(CAMT_Text_Spanish_HR_MULTI_2011_DIRPATH, true);
                        Directory.Delete(CAMT_Participant_OneBook_DIRPATH, true);
                        Directory.Delete(CAMT_Participant_OneBook_MULTI_DIRPATH, true);
                    }
                    catch (Exception)
                    {
                    }
                    while (downloadingVideos)
                    {
                        Console.WriteLine("book download waiting until videos download is done");
                        Thread.Sleep(10 * 1000);
                    }
                    downloadingBooks = true;
                    foreach (string bookZipFileName in bookZipFileNames)
                    {
                        string urlString = mediaUrlPrefix + bookZipFileName;
                        Console.WriteLine("Book Dir Being Created");
                        System.IO.Directory.CreateDirectory(bookFileDirStr);
                        Console.WriteLine("Created the DIR, now downloading the books from the server");
                        var webClient = new WebClient();
                        webClient.DownloadProgressChanged +=
                            new DownloadProgressChangedEventHandler(DownloadProgressCallback);
                        webClient.DownloadDataCompleted += (s, e) =>
                        {
                            try
                            {
                                Console.WriteLine("Download Book Completed so now saving it to it's location @ \n" + bookFileDirStr);
                                Console.WriteLine("1b");
                                byte[] zipBytes = e.Result; // get the downloaded text
                                Console.WriteLine("2b");
                                string localFilename = bookZipFileName;
                                Console.WriteLine("3b");
                                string localPath = System.IO.Path.Combine(bookFileDirStr, localFilename);
                                Console.WriteLine("4b");
                                System.IO.File.WriteAllBytes(localPath, zipBytes);//  .WriteAllText(localpath, text); // writes to local storage   
                                Console.WriteLine("5b");
                                var zip = new ZipArchive();
                                zip.EasyUnzip(localPath, bookFileDirStr, true, "");
                                Console.WriteLine("Extraction done ");
								string[] files = Directory.GetFiles(bookFileDirStr);
                                foreach (string tempFile in files)
                                {
                                    Console.WriteLine("files of extract location: " + Path.GetFileName(tempFile));
                                }                                
                                System.IO.File.Delete(localPath);
                                Console.WriteLine("6b");
                                GC.Collect();
                                downloadingBooks = false;
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.Message);
                                Console.WriteLine(ex.StackTrace);
                            }
                        };
                        Console.WriteLine("urlString: " + urlString);
                        var url = new Uri(urlString); // Html home page
                        webClient.DownloadDataAsync(url);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                Console.WriteLine(e.Message);
                Console.WriteLine(e.StackTrace);
                downloadingBooks = false;
            }
        }

        private void setupCamtMedia(NetworkStatus internetStatus)
        {
            try
            {
                if (internetStatus != NetworkStatus.NotReachable)
                {
					//System.IO.Directory.Delete(camtMediaLocalMediaPath, true);
                    setupVideos();
                    setupBooks();
                }
                else
                {
                    if (bookFilesExist() == false || videoFilesExist() == false)
                    {
                        Console.WriteLine("NO Networking connection and media not present. No bueno.");
                    }
                }
            }
            catch (Exception ex)
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
    }
}

