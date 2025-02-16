using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace AspNetMvcMachineTest.Models
{
    public class Product_model
    {

        [Key]
        public int ProductId { get; set; }

        [Required(ErrorMessage = "please select category name")]
        public int CategoryId { get; set; }

        [Required(ErrorMessage = "please enter product name")]
        public string ProductName { get; set; }

        public Category_model Category { get; set; }

       


     }
}
