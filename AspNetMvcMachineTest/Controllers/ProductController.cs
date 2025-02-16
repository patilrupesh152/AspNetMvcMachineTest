
using Microsoft.AspNetCore.Mvc;
using AspNetMvcMachineTest.Models;
using Microsoft.EntityFrameworkCore;
using AspNetMvcMachineTest.Connection;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;

namespace AspNetMvcMachineTest.Controllers
{
    public class ProductController : Controller
    {
        private readonly Context db;

        public ProductController(Context _db)
        {
            db = _db;
        }

        public IActionResult Index(int page = 1, int pageSize = 10)
        {
            try
            {
                var totalProducts = db.Products.Count();
                var products = db.Products
                    .Include(p => p.Category)
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .ToList();

                ViewBag.TotalPages = Math.Ceiling(totalProducts / (double)pageSize);
                ViewBag.CurrentPage = page;

                return View(products);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public IActionResult Postproduct(Product_model model)
        {
            try
            {
                var categories = db.Categories.ToList();
                ViewBag.Categories = new SelectList(categories, "CategoryId", "CategoryName");
                return View();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [HttpPost]
        public IActionResult Post(Product_model model)
        {
            try
            {
                //if (ModelState.IsValid)
                //{
                    if (model.ProductId == 0)
                    {
                        db.Products.Add(model);
                        TempData["SuccessMessage"] = "Product has been saved successfully!";
                    }
                    else
                    {
                        db.Entry(model).State = EntityState.Modified;
                        TempData["SuccessMessage"] = "Product has been update successfully!";
                    }

                    db.SaveChanges();
                    return RedirectToAction("Index");
                //}
                //return View("Postproduct", model);
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
                var product = db.Products.Find(id);
                if (product == null)
                {
                    return NotFound();
                }

                db.Products.Remove(product);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Product deleted successfully!";
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
                var data = db.Products.FirstOrDefault(x => x.ProductId == id);
                if (data == null)
                {
                    return NotFound();
                }

                Product_model model = new Product_model()
                {
                    ProductId = id,
                    ProductName = data.ProductName,
                    CategoryId = data.CategoryId,
                };

                var categories = db.Categories.ToList();
                ViewBag.Categories = new SelectList(categories, "CategoryId", "CategoryName");

                return RedirectToAction("Postproduct", model);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}


