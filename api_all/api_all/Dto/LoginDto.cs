using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace api_all.Dto
{
    public class LoginDto
    {
        [Required]
        [StringLength(45)]
        public string Login { get; set; }

        [Required]
        [StringLength(8, MinimumLength = 4)]
        [DataType(DataType.Password)]
        public string Senha { get; set; }
    }
}
