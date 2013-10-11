using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Text.RegularExpressions;
using CAMT;
using MonoTouch.Foundation;
using MonoTouch.MediaPlayer;
using MonoTouch.UIKit;

namespace CAMT_IOS
{
	public partial class SearchResultsScreen : UIViewController
	{
		BookScreen bookScreen;
	    public static string searchTerm = null;
	    public static bool stopSearching = false;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public SearchResultsScreen ()
			: base (UserInterfaceIdiomIsPhone ? "SearchResultsScreen_iPhone" : "SearchResultsScreen_iPad", null)
		{
		}

		public void gotoSearchResultPage(SearchResultItem sri)
		{
            String tempPathToLoad = createTemporaryHighlightedPage(sri);
            Console.WriteLine("pathUrl:  " + tempPathToLoad);            
            if (sri.isHtml == true)
            {
                if (this.bookScreen == null)
                { this.bookScreen = new BookScreen(); }
                //BookScreen.bookUrl = url;
                this.NavigationController.PushViewController(this.bookScreen, true);
                bookScreen.loadThisUrl(tempPathToLoad);
            }
            if (sri.isVideo == true)
            {
                string vidFileName = Path.GetFileName(sri.actualLocation);
                Console.WriteLine("videFileName 1: " + vidFileName);
                string vidNameOnly = Path.GetFileName(vidFileName);
                PlayThatVideo(vidNameOnly);
            }
        }

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

	    private TableSource searchTblSrc;
		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();

			tableSearchResults.AutoresizingMask = UIViewAutoresizing.All;
			//string[] tableItems = new string[] {"Vegetables","Fruits","Flower Buds","Legumes","Bulbs","Tubers"};
            searchTblSrc = new TableSource(this);
		    tableSearchResults.Source = searchTblSrc;
		    // Perform any additional setup after loading the view, typically from a nib.
		}

        public void SearchForThis(List<string> locationsToSearch, string searchTerm,
                                                        TableSource tableSource)
        {
            searchTblSrc.tableItems.Clear();
            foreach (string searchLocation in locationsToSearch)
            {
                if (stopSearching == true)
                {
                    break;
                }
                List<SearchResultItem> searchResults = SearchForThis(searchLocation, searchTerm);
                searchTblSrc.tableItems.AddRange(searchResults);
            }
        }

        public static string noResultsMessage = "NO RESULTS FOUND";
        public static string searchingSoWaitMessage = "Searching...";
        public static string tempSearchPageFileName = "__TempSearchPageWitHighlights.html";

        public static bool clickedHandled = false;
        public string createTemporaryHighlightedPage(SearchResultItem sri)
        {
            string result = "";
            string fileText = File.ReadAllText(sri.actualLocation);
            fileText = fileText.Replace(searchTerm,
                                        "<span style='background-color: #FFFF00'><B>" + searchTerm + "</B></span>");
            string parentDirPath = Directory.GetParent(sri.actualLocation).FullName;
            string tempSearchPagePath = Path.Combine(parentDirPath, tempSearchPageFileName);
            if (File.Exists(tempSearchPagePath))
            {
                File.Delete(tempSearchPagePath);
            }
            File.WriteAllText(tempSearchPagePath, fileText);
            result = tempSearchPagePath;
            return result;
        }

        public static List<SearchResultItem> SearchForThis(string location, string searchTerm)
        {
            Console.WriteLine("SearchForThis STarting");
            List<SearchResultItem> result = new List<SearchResultItem>();
                ///-----
                Console.WriteLine("location: " + location);
                string[] bookPages = Directory.GetFiles(location);
                Console.WriteLine(location + " File Prefix lenght: " + bookPages.Length);
                foreach (string bookPage in bookPages)
                {
                    if (stopSearching == true || clickedHandled == true)
                    {
                        Console.WriteLine("STOPPING THE SEARCHING");
                        break;
                    }
                    try
                    {
                        if (
                            ((bookPage.EndsWith(".html") || bookPage.EndsWith(".htm")) == false)
                            &&
                            (bookPage.StartsWith("page_") == true)
                            )
                        {
                            continue;
                        }
                        FileInfo fInfo = new FileInfo(bookPage);
                        string dirName = fInfo.Directory.Name;
                        bool isHtml = (bookPage.EndsWith(".html") || bookPage.EndsWith(".htm"));
                        bool isBookPage = (fInfo.Name.StartsWith("page_") == true);
                        bool isNotBookTempPage = !(fInfo.Name == tempSearchPageFileName);
                        bool isVideoDir = (dirName.IndexOf("VIDEO") > -1);
                        Console.WriteLine("isHtml: " + isHtml + "  isBookPage:" + isBookPage + "  isNotBookTempPage: " + isNotBookTempPage);
                        bool shouldSearch = isHtml && isBookPage && isNotBookTempPage;
                        shouldSearch |= (isHtml && isVideoDir);

                        Console.WriteLine("shouldSearch: " + shouldSearch + " : " + bookPage);
                        if (shouldSearch == false)
                        {
                            continue;
                        }
                        //string path = "android_asset/" + location + "/" + bookPage;
                        //Console.WriteLine("About to read it ");
                        string fullAssetPath = bookPage;
                        string fileText = File.ReadAllText(fullAssetPath); // sr.ReadToEnd();// File.ReadAllText(path);
                        //Console.WriteLine("fileText's length: " + fileText.Length);
                        if (fileText.ToUpper().Contains(searchTerm.ToUpper()))
                        {

                            SearchResultItem sri = new SearchResultItem();
                            //Console.Write(".");
                            //string displaySubHeading = new DirectoryInfo(theSearchResult.Value).Name; ;
                            string displaySubHeading = fInfo.Directory.Name;
                            int lastPathSep = displaySubHeading.IndexOf(Path.DirectorySeparatorChar);
                            if (lastPathSep > 0)
                            {
                                displaySubHeading = displaySubHeading.Substring(lastPathSep);
                            }
                            //displaySubHeading = Path.GetDirectoryName(theSearchResult.Value).Substring(
                            //    );
                            string fileName = Path.GetFileName(fullAssetPath);
                            Console.WriteLine("filename = tempSearchPageFileName ?");
                            Console.WriteLine("\t " + fileName);
                            Console.WriteLine("\t " + tempSearchPageFileName);
                            if (fileName == tempSearchPageFileName)
                            {
                                Console.WriteLine("skipping that one");
                                continue;
                            }
                            if (fInfo.Directory.Name.IndexOf("VIDEO") < 0)
                            {
                                sri.Heading = Path.GetFileName(fullAssetPath);
                                Console.WriteLine("1 HTML displaySubHeading: " + displaySubHeading);
                                displaySubHeading = displaySubHeading.Replace("_Multi", "");
                                displaySubHeading = displaySubHeading.Replace("_multi", "");
                                displaySubHeading = displaySubHeading.Replace("_", " ");
                                displaySubHeading = displaySubHeading.Replace("-", " ");
                                Console.WriteLine("2 HTML displaySubHeading: " + displaySubHeading);
                                sri.SubHeading = displaySubHeading;
                                sri.actualLocation = fullAssetPath;
                                sri.Preview = getSearchHitPreview(fullAssetPath);
                                sri.isHtml = true;
                                sri.isVideo = false;
                            }
                            else
                            {
                                Console.WriteLine("VIDEO SEARCH HIT FOUND");
                                sri.actualLocation = fullAssetPath;
                                sri.actualLocation = sri.actualLocation.Replace(".html", "");
                                Console.WriteLine("sri.actualLocation: " + sri.actualLocation);
                                sri.Heading = "VIDEO";
                                int index = fInfo.Name.IndexOf(".");
                                string displayFileName = fileName;
                                displayFileName = displayFileName.Replace("_x264.mp4.html", "");
                                sri.SubHeading = displayFileName;
                                sri.Preview = "Multimedia Video";
                                sri.isHtml = false;
                                sri.isVideo = true;
                            }
                            result.Add(sri);                        
                        }
                        //Console.WriteLine("------------------------------");
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
            return result;
        }


        private static string getSearchHitPreview(string value)
        {
            string result = "";
            string searchHitText = File.ReadAllText(value);
            string searchHitTextTemp = searchHitText.ToUpper();
            string searchHitTextUpperNoHtml = getHtmlPageTextOnly(searchHitTextTemp);
            int hitIndex = searchHitTextUpperNoHtml.IndexOf(searchTerm.ToUpper());
            Console.WriteLine("hitIndex: " + hitIndex);
            int preAndPostCharLength = 100;
            int startIndex = (hitIndex - preAndPostCharLength > 0 ? hitIndex - preAndPostCharLength : 0);
            int stopIndex = (hitIndex + preAndPostCharLength < searchHitTextUpperNoHtml.Length
                                 ? hitIndex + preAndPostCharLength
                                 : searchHitTextUpperNoHtml.Length - 1);
            Console.WriteLine("startIndex: " + startIndex);
            Console.WriteLine("stopIndex : " + stopIndex);
            try
            {
                result = searchHitTextUpperNoHtml.Substring(startIndex, stopIndex - startIndex);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
            }
            return result;
        }

        public static string getHtmlPageTextOnly(string htmlString)
        {
            string result = htmlString;
            Console.WriteLine("==========================");
            Console.WriteLine("htmlString:" + htmlString);
            result = Regex.Replace(result, "<[^>]*(>|$)", " " );
            result = Regex.Replace(result, "[\\s\\r\\n]+", " " );
            result = result.Trim();
            Console.WriteLine("--------------------------");
            Console.WriteLine("result: " + result);
            Console.WriteLine("==========================");

            /*
            HtmlAgilityPack.HtmlDocument htmlDoc = new HtmlAgilityPack.HtmlDocument();

            // There are various options, set as needed
            //htmlDoc.OptionFixNestedTags = true;

            // filePath is a path to a file containing the html
            htmlDoc.LoadHtml(htmlString);
            try
            {
                result = htmlDoc.DocumentNode.;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.WriteLine(e.StackTrace);
            }
*/
            return result;
        }


        MPMoviePlayerController moviePlayer;
        void PlayThatVideo(string vidName)
        {
            Console.WriteLine("About to play: " + vidName);
            string videoFileLocationPrefix = MainScreen.videoFileDirStr;
            Console.WriteLine("videoFileLocationPrefix: " + videoFileLocationPrefix);
            string finalVidPath = Path.Combine(videoFileLocationPrefix, vidName);
            Console.WriteLine("finalVidPath: " + finalVidPath);
            bool vidFileExists = File.Exists(finalVidPath);
            Console.WriteLine("vidFileExists: " + vidFileExists);
            if (vidFileExists == true)
            {
                moviePlayer = new MPMoviePlayerController(NSUrl.FromFilename(finalVidPath));
                View.AddSubview(moviePlayer.View);
                moviePlayer.SetFullscreen(true, true);
                moviePlayer.Play();
            }
            else
            {
                new UIAlertView("Not Ready Yet", "That video has not downloaded yet, try to click in a few minutes", null, "OK", null).Show();
            }
        }

	}
}

