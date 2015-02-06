using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVIntelligence.Indexer
{
    public static class Constants
    {
        public const int FIRSTNAME   = 1;
        public const int MIDDLENAME = 2;
        public const int LASTNAME = 3;
        public const int TITLE = 4;
        public const int SUMMARY = 5;
        public const int GENDER = 6;
    }

    public static class SearchKeys
    {
        
        public static List<string> FIRSTNAME = new string[]
        {
            "Name",
            "FirstName",
            "SureName", 
            "Sure Name",
            "First Name"
        }.ToList();

        public static List<string> MIDDLENAME = new string[]
        {
            "Name",
            "Middle Name",
            "MiddleName", 
            "Father's Name",
            "Middle Ininitial"
        }.ToList();

        public static List<string> LASTNAME = new string[]
        {
            "Name",
            "Last Name",
            "Family Name"
        }.ToList();

        public static List<string> TITLE = new string[]
        {
            "Header",
            "Title"
        }.ToList();

        public static List<string> SUMMARY = new string[]
        {
            "Summary",
        }.ToList();

        public static List<string> GENDER = new string[]
        {
            "Gender",
            "Sex",
            "Male", 
            "Female"
        }.ToList();
       
    }
}