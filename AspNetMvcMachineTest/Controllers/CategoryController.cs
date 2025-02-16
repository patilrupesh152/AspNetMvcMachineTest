using AspNetMvcMachineTest.Connection;
using AspNetMvcMachineTest.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace AspNetMvcMachineTest.Controllers
{
    public class CategoryController : Controller
    {
        private readonly Context db;

        public CategoryController(Context _db)
        {
            db = _db;
        }

        public IActionResult Index()
        {
            try
            {
                var list = db.Categories.ToList();
                return View(list);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IActionResult Post(Category_model model)
        {
            return View();
        }

        public IActionResult Postdata(Category_model model)
        {
            try
            {
                if (model.CategoryId == 0)
                {
                    db.Categories.Add(model);
                    TempData["SuccessMessage"] = "Category has been saved successfully!";
                }
                else
                {
                    db.Entry(model).State = EntityState.Modified;
                    TempData["SuccessMessage"] = "Category has been update successfully!";
                }

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IActionResult Delete(int id)
        {
            try
            {
                var model = new Category_model { CategoryId = id };
                db.Entry(model).State = EntityState.Deleted;
                db.SaveChanges();
                TempData["SuccessMessage"] = "Category deleted successfully!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IActionResult Edit(int id)
        {
            try
            {
                var data = db.Categories.FirstOrDefault(x => x.CategoryId == id);
                if (data == null)
                {
                    return NotFound();
                }

                Category_model model = new Category_model
                {
                    CategoryId = id,
                    CategoryName = data.CategoryName
                };
                return RedirectToAction("Post", model);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
