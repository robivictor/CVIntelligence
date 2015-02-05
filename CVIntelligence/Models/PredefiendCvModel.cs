using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVIntelligence.Models
{
    public class PredefinedCvModel
    {
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public List<string> Email { get; set; }
        public List<string> Phone { get; set; }
        public string Headline { get; set; }
        public string Summary { get; set; }
        public List<string> Languages { get; set; }
        public List<string> SocialProfiles { get; set; }
        public List<Project> Projects { get; set; }
        public List<string> Education { get; set; }
        public List<WorkExperience> Experience { get; set; }
    }

    public class Project
    {
        public string Title { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string Company { get; set; }
    }

    public class Education
    {
        public string College { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string Company { get; set; }
    }

    public class WorkExperience
    {
        public string Company { get; set; }
        public string Position { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string Location { get; set; }
    }


}