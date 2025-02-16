using System.ComponentModel.DataAnnotations;

namespace AspNetMvcMachineTest.Models
{
    public class Category_model
    {
        [Key]
        public int CategoryId { get; set; }

        [Required(ErrorMessage = "please enter category")]
        public string CategoryName { get; set; }

        
    }
}
