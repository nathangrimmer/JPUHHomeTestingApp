using HomeTesting;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeTesting.Controllers
{
    public class StaffController : Controller
    {
        private FluJabEntities2 flu = new FluJabEntities2();
        // GET: Staff
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddStaff()//load popup
        {
            GetViewBags();
            return PartialView("~/Views/Staff/_AddStaffMember.cshtml");
        }

               
        [HttpPost]//posts to db
        [ValidateAntiForgeryToken]
        public ActionResult AddHomeTestStaff(tbl_HomeTesting tbl_HomeTestingR)
        {
            if (ModelState.IsValid)
            {
                tbl_HomeTestingR.IssuedBy = User.Identity.Name;
                flu.tbl_HomeTesting.Add(tbl_HomeTestingR);              
                flu.SaveChanges();
                TempData["Added"] = "Home Testing Kit Added For Staff " + tbl_HomeTestingR.FirstName + " " + tbl_HomeTestingR.Surname;//for added message
                return Redirect(ControllerContext.HttpContext.Request.UrlReferrer.ToString());
            }
            return Redirect(ControllerContext.HttpContext.Request.UrlReferrer.ToString());
        }
      

        [OutputCache(NoStore = true, Duration = 0)]//loads testing kit popup if exists in ESR list
        [NoCache]
        public ActionResult EditRecordHT(string id)
        {
            tbl_HomeTesting testing = new tbl_HomeTesting();
            GetViewBags();
            tblStaff tblStaff = flu.tblStaffs.Find(id);
            if(tblStaff !=null)
            {
                testing.FirstName = tblStaff.FirstName;
                testing.Surname = tblStaff.LastName;
            }
            testing.EmployeeNumber = id;
            return PartialView("~/Views/Staff/_AddStaffTestingKit.cshtml", testing);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]//db post
        public ActionResult EditRecordHT(tbl_HomeTesting tbl_HomeTesting)
        {
            if(ModelState.IsValid)
            {
                //tbl_HomeTesting.IssueDate = DateTime.Now;
                tbl_HomeTesting.IssuedBy = User.Identity.Name;
                tbl_HomeTesting.TestingKitIssued = true;
                TempData["Added"] = "Home Testing Kit Added For Staff " + tbl_HomeTesting.FirstName + " " + tbl_HomeTesting.Surname;
                flu.tbl_HomeTesting.Add(tbl_HomeTesting);
                flu.SaveChanges();             
            }
            return Redirect(ControllerContext.HttpContext.Request.UrlReferrer.ToString());

        }


        public void GetViewBags()//populates the from lists
        {
            ViewBag.AssStatus = new SelectList(flu.tbl_AssignmentStatus.Where(x => x.Active == true), "AssignmentStatus", "AssignmentStatus");
            ViewBag.Divisions = new SelectList(flu.tbl_Divisions.Where(x => x.Active == true), "Division", "Division");
            ViewBag.Depts = new SelectList(flu.tbl_Departments.Where(x => x.Active == true), "Department", "Department");          
            ViewBag.StaffGroups = new SelectList(flu.tbl_StaffGroups.Where(x => x.Active == true), "StaffGroup", "StaffGroup");
            ViewBag.RiskAreas = new SelectList(flu.tbl_HighRiskAreas.Where(x => x.Active == true), "RiskArea", "RiskArea");          
            ViewBag.AssCat = new SelectList(flu.tbl_AssignmentCats.Where(x => x.Active == true), "Catergory", "Catergory");
            
           
        }

       


        [HttpPost]//not used, this is checking if emp no already exists, ajax
        public JsonResult CheckEmpNo(string empNo)
        {

            var checkNumber = flu.tblStaffs.FirstOrDefault(x => x.EmployeeNumber == empNo);
            string exists = null;
            if (checkNumber != null)
            {
                exists = "This number is already stored in the database";
                return Json(exists);
            }
            if (checkNumber == null)
            {
                exists = "Not found";
            }


            return Json(exists);

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                flu.Dispose();     
            }
            base.Dispose(disposing);
        }

    }


}