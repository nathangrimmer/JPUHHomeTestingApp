using HomeTesting;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HomeTesting.Models
{
    public class MainViewModel
    {

        public string Title { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Name { get; set; }
        public string EmployeeNumber { get; set; }
        public string Division { get; set; }
        public string Department { get; set; }
        public string AssignmentStatus { get; set; }
        public string StaffGroup { get; set; }
        public string Role { get; set; }
        public string AssignmentCategory { get; set; }
             
        public string Notes { get; set; }
        public string Comments { get; set; }
               
        public string Area { get; set; }
        public int KitCount { get; set; }

        public List<tblStaff> tblStaffs {get; set;}
        public List<tbl_HomeTesting> TestingKits { get; set; }

        public MainViewModel(string sur, string area)
        {
            using (FluJabEntities2 fluDB = new FluJabEntities2())
            {
                TestingKits = fluDB.tbl_HomeTesting.ToList();//gets testing list from db
                if(area !=null)
                {
                    Area = area;
                }
                if (sur == "All Records")//loads all esr records
                {
                    tblStaffs = (from s in fluDB.tblStaffs
                                 select s).AsQueryable().ToList();
                }
                if (sur != "All Records" && sur !=null)//loads from surname search
                {
                    tblStaffs = fluDB.tblStaffs.Where(x => x.LastName == sur).ToList();

                }
                else if(sur == null)//default esr load list(1250 records)
                {

                    tblStaffs = (from s in fluDB.tblStaffs
                                 select s).AsQueryable().Take(1250).ToList();
                }

                
            }
        }
        

    }


}