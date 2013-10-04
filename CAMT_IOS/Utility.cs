using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Console = System.Console;
using File = System.IO.File;
using IOException = System.IO.IOException;

namespace CAMT_IOS
{
	internal class Utility
	{
		/**
  * Unzip it
  * @param zipFile input zip file
  * @param output zip file output folder
  */

		/*public static void unZipIt(String zipFile, String outputFolder)
		{
			Console.WriteLine("unZipIt Starting! ");
			byte[] buffer = new byte[1024];

			try
			{
				//create output directory is not exists
				Java.IO.File folder = new Java.IO.File(outputFolder);
				if (!folder.Exists())
				{
					folder.Mkdirs();
				}

				//get the zip file content
				Java.Util.Zip.ZipInputStream zis = new Java.Util.Zip.ZipInputStream(
					new System.IO.FileStream(zipFile, System.IO.FileMode.Open)
					);
				//get the zipped file list entry
				Java.Util.Zip.ZipEntry ze = zis.NextEntry;

				while (ze != null)
				{
					String fileName = ze.Name;
					Java.IO.File newFile = new Java.IO.File(outputFolder + Path.DirectorySeparatorChar + fileName);

					Console.WriteLine("file unzip : " + newFile.AbsolutePath);

					//create all non exists folders
					//else you will hit FileNotFoundException for compressed folder
					new Java.IO.File(newFile.Parent).Mkdirs();

					FileOutputStream fos = new FileOutputStream(newFile);

					int len;
					while ((len = zis.Read(buffer)) > 0)
					{
						fos.Write(buffer, 0, len);
					}

					fos.Close();
					ze = zis.NextEntry;
				}

				zis.CloseEntry();
				zis.Close();

				Console.WriteLine("Done");
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex);
			}
		} */

		public static string[] allSearchLocations = new string[]{
			"CAMT_Participant_OneBook_Multi",
			"CAMT-English-HR_2011_multi",
			"CAMT-Text-Spanish-HR_2011_multi"
		};

		public static Dictionary<string, string> SearchForThis( MonoTouch.Foundation.NSBundle nsbundle, string location, string searchTerm )
		{
			Console.WriteLine("SearchForThis STarting");
			string[] searchLocations = new string[] { location };
			if(location == "ALL") 
			{
				searchLocations = allSearchLocations;
			}
			Dictionary<string, string> result = new Dictionary<string, string>();
			foreach (string tempLocation in searchLocations) 
			{
				///-----
				string pathPrefix = "Content" + Path.DirectorySeparatorChar  + tempLocation;
				Console.WriteLine("pathPrefix: " + pathPrefix);
				string pathPrefixUrl = Path.Combine (nsbundle.BundlePath, pathPrefix);
				Console.WriteLine("pathPrefixUrl: " + pathPrefixUrl);
				string[] bookPages = Directory.GetFiles (pathPrefixUrl);
				Console.WriteLine(tempLocation + " File Prefix lenght: " + bookPages.Length);
				foreach (string bookPage in bookPages)
				{
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
						//Console.WriteLine("---------- bookPage: " + bookPage);
						//string path = "android_asset/" + location + "/" + bookPage;
						string content;
						//Console.WriteLine("About to read it ");
						//string fullAssetPath = location + Path.DirectorySeparatorChar + bookPage;
						//using (StreamReader sr = new StreamReader(assets.Open(fullAssetPath)))
						//	content = sr.ReadToEnd();
						//string fileName = pathPrefix + Path.DirectorySeparatorChar + bookPage; // remember case-sensitive
						string localHtmlUrl = Path.Combine (pathPrefixUrl, bookPage);
						//Console.WriteLine("localHtmlUrl: \n" + localHtmlUrl);
						string fileText =  File.ReadAllText(localHtmlUrl);
						//Console.WriteLine("fileText's length: " + fileText.Length);
						if (fileText.Contains(searchTerm))
						{
							Console.WriteLine("FOUND SEARCH TERM");
							string displayBookTitle = tempLocation;//localHtmlUrl.Substring( 

							                            //                     localHtmlUrl.LastIndexOf( Path.DirectorySeparatorChar ),
							                              //                   localHtmlUrl.Length - localHtmlUrl.LastIndexOf( Path.DirectorySeparatorChar ) );

							displayBookTitle = displayBookTitle.Replace("_Multi", "" );
							displayBookTitle = displayBookTitle.Replace("_multi", "" );
							displayBookTitle = displayBookTitle.Replace("_", " " );
							Console.WriteLine("displayBookTitle: " + displayBookTitle);
							string displayBookPage = Path.GetFileName(bookPage);
							displayBookPage = displayBookPage.Replace("_", " " );
							displayBookPage = displayBookPage.Replace(".html", "" );
							displayBookPage = displayBookPage.Replace(".htm", "" );
							Console.WriteLine("displayBookPage: " + displayBookPage);
							int indexStart = fileText.IndexOf(searchTerm) - 10;
							if(indexStart<0){indexStart=0;}
							int indexEnd = searchTerm.Length + 20;
							if( (indexStart+indexEnd) > fileText.Length-1 ){ indexEnd=fileText.Length-indexStart ; };
							string targetSnip = fileText.Substring( indexStart, indexEnd );
							Console.WriteLine("targetSnip: " + targetSnip);
							string displayText = displayBookTitle+": " + displayBookPage +
								"\n"+ targetSnip;
							Console.WriteLine("displayText: " + displayText);
							result.Add(displayText, localHtmlUrl);
						}
						Console.WriteLine("------------------------------");
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
					//Stream fileStream = assets.Open(s);
				}
				///-----
			}


			return result;
		}
	}
}