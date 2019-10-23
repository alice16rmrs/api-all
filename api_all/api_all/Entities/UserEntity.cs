using System.ComponentModel.DataAnnotations;

namespace api_all.Entities
{
    public class UserEntity : BaseEntity
    {
        [Required]
        [StringLength(14, MinimumLength = 11)]
        public string Cpf { get; set; }

        [Required(ErrorMessage = "Informe o seu nome")]
        [Display(Name = "Nome")]
        [StringLength(50)]
        public string Nome { get; set; }

        [Required(ErrorMessage = "Informe o email.")]
        [StringLength(50)]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
       
        [Required(ErrorMessage = "Informe o seu telefone")]
        [StringLength(25)]
        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Telefone")]
        public string Telefone { get; set; }

        [Required]
        [StringLength(45)]
        public string Login { get; set; }

        [StringLength(8)]
        [DataType(DataType.Password)]
        public string Senha { get; set; }

        [Required(ErrorMessage = "Informe o seu CEP")]
        [Display(Name = "CEP")]
        [StringLength(8)]
        public string Cep { get; set; }

        [StringLength(100)]
        public string Cidade { get; set; }

        [StringLength(100)]
        public string Bairro { get; set; }

        [StringLength(100)]

        public string Rua { get; set; }

        [Required]
        public int Numero { get; set; }

        public string Role { get; set; }

    }
}
