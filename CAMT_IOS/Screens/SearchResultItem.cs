using System;

namespace CAMT_IOS
{
	public class SearchResultItem
	{
		public string Heading { get; set; }
		public string SubHeading { get; set; }
		public string actualLocation { get; set; }
		public string Preview { get; set; }


		public string temporaryHighlightedPage;
		public bool isHtml = true;
		public bool isVideo = false;
	}
}

