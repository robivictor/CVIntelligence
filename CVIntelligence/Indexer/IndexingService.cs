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
        private List<KeyWordSearchResult> ContainsAnyOfThese(string source, IEnumerable<string> keywords)
        {
            var result = new List<KeyWordSearchResult>();
            var tst = source.ToLower();
            foreach (var keyword in keywords)
            {
                var r = new KeyWordSearchResult();
                r.Found = tst.Contains(keyword.ToLower());
                r.KeyWord = keyword.ToLower();
                result.Add(r);
            }
            return result;
        }

        private List<HtmlNode> LocateNodes(List<KeyWordSearchResult> searchResults, HtmlDocument searchable)
        {
            var nodes = new List<HtmlNode>();

            if (searchResults.Exists(t => t.Found == true))
            {
                foreach (var searchResult in searchResults.Where(t => t.Found))
                {
                    //var r = searchable.DocumentNode.SelectNodes("//*[contains(text()[1],'" + searchResult.KeyWord + "')]");
                    //var r = searchable.DocumentNode.SelectNodes("//text()[contains(.,'" + searchResult.KeyWord + "')]/..");
                    var r = searchable.DocumentNode.SelectNodes("//text()[contains(.,'" + searchResult.KeyWord + "')]/..");
                    //var r =searchable.DocumentNode.Descendants()
                    //        .Where(d => d.InnerText.ToLower().Contains(searchResult.KeyWord.ToLower()));
                    if (r != null)
                    {
                        nodes.Add(r.First().ParentNode);
                    }
                }
            }
            return nodes;
        }


        public string Search(string html, int key)
        {
            var result = "";
            var searchable = new HtmlDocument();
            searchable.LoadHtml(html.ToLower());

            var htmlnodes = searchable.DocumentNode.Descendants().Where(n =>
                n.NodeType == HtmlNodeType.Text &&
                n.ParentNode.Name != "script" &&
                n.ParentNode.Name != "style");

            var innerttext = htmlnodes.Aggregate("", (current, node) => current + node.InnerText);
            innerttext = innerttext.Replace("\n", "");


            List<KeyWordSearchResult> content;
            List<HtmlNode> nds;

            switch (key)
            {
                case Constants.FIRSTNAME:
                    {
                        content = this.ContainsAnyOfThese(innerttext, SearchKeys.FIRSTNAME);
                        nds = LocateNodes(content, searchable);
                        if (nds.Any())
                        {
                            result = nds.First().NextSibling.NextSibling.InnerText;
                        }
                        break;
                    }
                case Constants.MIDDLENAME:
                    {
                        content = this.ContainsAnyOfThese(innerttext, SearchKeys.MIDDLENAME);
                        nds = LocateNodes(content, searchable);
                        if (nds.Any())
                        {
                            result = nds.First().NextSibling.NextSibling.InnerText;
                        }
                        break;
                    }
                case Constants.LASTNAME:
                    {
                        content = this.ContainsAnyOfThese(innerttext, SearchKeys.LASTNAME);

                        nds = LocateNodes(content, searchable);
                        if (nds.Any())
                        {
                            result = nds.First().NextSibling.NextSibling.InnerText;
                        }
                        break;
                    }
                case Constants.TITLE:
                    {
                        content = this.ContainsAnyOfThese(innerttext, SearchKeys.TITLE);
                        nds = LocateNodes(content, searchable);
                        if (nds.Any())
                        {
                            result = nds.First().NextSibling.NextSibling.InnerText;
                        }
                        break;
                    }
                case Constants.SUMMARY:
                    {
                        content = this.ContainsAnyOfThese(innerttext, SearchKeys.SUMMARY);
                        nds = LocateNodes(content, searchable);
                        if (nds.Any())
                        {
                            result = nds.First().NextSibling.NextSibling.InnerText;
                        }
                        break;
                    }
            }
            return result;
        }
    }
}