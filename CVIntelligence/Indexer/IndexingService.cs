using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using HtmlAgilityPack;

namespace CVIntelligence.Indexer
{
    public class IndexingService : IIndexingService
    {
        private List<KeyWordSearchResult> ContainsAnyOfThese(string source, IEnumerable<string> keywords  )
        {
            var result = new List<KeyWordSearchResult>();

            foreach (var keyword in keywords)
            {
                var r = new KeyWordSearchResult();
                r.Found  = source.ToLower().Split().Contains(keyword.ToLower());
                r.KeyWord = keyword;
                result.Add(r);
            }
            return result;
        }

        public string Search(HtmlDocument searchable, int key)
        {
            var result = "";

            switch (key)
            {
                case Constants.FIRSTNAME:

                    if (this.ContainsAnyOfThese(searchable.ToString(), SearchKeys.FIRSTNAME).Exists(t => t.Found == true))
                    {
                        var content = this.ContainsAnyOfThese(searchable.ToString(), SearchKeys.FIRSTNAME);
                        
                        foreach (var searchResult in content)
                        {
                            //searchable.DocumentNode.All("a").Where(t => t.InnerText.Contains(searchResult.KeyWord));
                            var r =
                                searchable.DocumentNode.Descendants()
                                    .First(t => t.InnerText.ToLower().Split().Contains(searchResult.KeyWord))
                                    .ChildNodes;
                        }
                        result = "Robel";
                    }
                    break;
                case Constants.MIDDLENAME:

                    if (this.ContainsAnyOfThese(searchable.ToString(), SearchKeys.MIDDLENAME).Exists(t => t.Found == true))
                    {
                        result = "Tessema";
                    }
                    break;
                case Constants.LASTNAME:

                    if (this.ContainsAnyOfThese(searchable.ToString(), SearchKeys.LASTNAME).Exists(t=>t.Found==true))
                    {
                        result = "Herarso";
                    }
                    break;
                case Constants.TITLE:

                    if (this.ContainsAnyOfThese(searchable.ToString(), SearchKeys.TITLE).Exists(t => t.Found == true))
                    {
                        result = "Computer Engineer";
                    }
                    break;
                case Constants.SUMMARY:

                    if (this.ContainsAnyOfThese(searchable.ToString(), SearchKeys.SUMMARY).Exists(t => t.Found == true))
                    {
                        result = "An enthusiasit computer engineer";
                    }
                    break;
            }
            return result;
        }
    }
}