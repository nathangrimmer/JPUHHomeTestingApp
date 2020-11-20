using HomeTesting.Models;
using HomeTesting;
using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Net.Mail;
using System.Web.Mvc;
using System.Web.Security;

namespace HomeTesting.Controllers
{
    public class HomeController : Controller
    {
        private FluJabEntities2 flu = new FluJabEntities2();

        public ActionResult Login()
        {
            return this.View();
        }
        [HttpPost]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            if (!this.ModelState.IsValid)
            {
                return this.View(model);
            }

            if (Membership.ValidateUser(model.UserName, model.Password))
            {
                var user = model.UserName;
                FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                PrincipalContext ctx = new PrincipalContext(ContextType.Domain, "JPAGET.NHS.UK");
                UserPrincipal currentuser = UserPrincipal.FindByIdentity(ctx, user);
                GroupPrincipal fluMember = GroupPrincipal.FindByIdentity(ctx, "FluDatabase");
                GroupPrincipal fluMemberAdm = GroupPrincipal.FindByIdentity(ctx, "FluDatabaseAdmin");
                GroupPrincipal mainGroup = GroupPrincipal.FindByIdentity(ctx, "WardboardUsers");//ad groups
                GroupPrincipal homeTesting = GroupPrincipal.FindByIdentity(ctx, "HomeTestingUsers");

                if (this.Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                    && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                {
                    return this.Redirect(returnUrl);
                }
                if (currentuser.IsMemberOf(mainGroup))
                {
                    
                    return this.RedirectToAction("Index", "Home");
                }
                if (currentuser.IsMemberOf(homeTesting))
                {
                    
                    return this.RedirectToAction("Index", "Home");
                }
                
                return RedirectToAction("Login", TempData["NoPermissions"] = "You do not have permissions to use this application!");
            }
        
            TempData["NoPermissions"] = "The user name or password provided is incorrect";

            return this.View(model);
        }

      

        [Authorize]
        public ActionResult Index(string sur,string area)
        {           
            ViewBag.Flu = "Home Testing";
            ViewBag.AutoOpenTrue = "True";
            ViewBag.Area = "Home Testing";
            ViewBag.VaccCount = flu.tblStaffs.Where(x => x.VaccinationStatus == "Vaccinated").Count();
            ViewBag.DecCount = flu.tblStaffs.Where(x => x.VaccinationStatus == "Declined").Count();
            if(sur == "All Records")
            {
                ViewBag.AllRecord = "true";
                ViewBag.ShowData = "true";
            }
            if(sur !=null)
            {
                ViewBag.ShowData = "true";
            }
            area = "Home Testing";
            MainViewModel mainView = new MainViewModel(sur,area);               
            return View(mainView);
        }


        [OutputCache(NoStore = true, Duration = 0)]
        public ActionResult Feedback()
        {
            return PartialView("~/Views/Home/_Feedback.cshtml");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]//just for out feedback popup
        public ActionResult Feedback(FeedbackModel feedbackModel, string feedback)
        {
            feedbackModel.UserID = User.Identity.Name;

            if (feedbackModel != null)
            {
                MailMessage mail = new MailMessage();//email sender
                mail.IsBodyHtml = true;
                SmtpClient smtpServer = new SmtpClient("JP-MAIL-RELAY.jpaget.nhs.uk");
                smtpServer.Credentials = new System.Net.NetworkCredential();
                try
                {
                    mail.From = new MailAddress("HomeTestingFeedback@jpaget.nhs.uk");
                    mail.To.Add("ITSystemsDevTeam@jpaget.nhs.uk");
                    mail.Subject = "Feedback From Home Testing";
                    mail.Body = "Feedback Received:-" + " "
                        + feedbackModel.Feedback + "<br/>" + "<b>From:- </b>" + feedbackModel.Name + "<br/>" + "<b> UserID:- </b>" + "<br/>" + feedbackModel.UserID;

                    smtpServer.Send(mail);
                    TempData["Feedback"] = "Thank You for your feedback! " + feedbackModel.Name;

                }
                catch { }
            }
            return Redirect(ControllerContext.HttpContext.Request.UrlReferrer.ToString());
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
               
                
            }
            base.Dispose(disposing);
        }

        public ActionResult Logout(string id)
        {
            Session["User"] = id;
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");

        }
    }
}