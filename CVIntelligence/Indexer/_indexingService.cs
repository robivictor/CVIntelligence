using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HtmlAgilityPack;

namespace CVIntelligence.Indexer
{
    public interface IIndexingService
    {
        string Search(string searchable, int key);

    }
}
