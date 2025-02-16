using AspNetMvcMachineTest.Models;

using Microsoft.EntityFrameworkCore;

namespace AspNetMvcMachineTest.Connection
{
    public class Context : DbContext
    {
        public Context(DbContextOptions options) : base(options)
        {
        }
        public DbSet<Category_model> Categories { get; set; }
        public DbSet<Product_model> Products { get; set; }
    }
}
