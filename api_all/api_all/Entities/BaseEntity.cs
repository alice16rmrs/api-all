using Microsoft.AspNetCore.Identity;
using System;
using System.ComponentModel.DataAnnotations;

namespace api_all.Entities
{
    public abstract class BaseEntity
    {
        [Key]
        public Guid Id { get; set; }
        private DateTime? _creatAt;

        public DateTime? CreateAt
        {
            get { return _creatAt; }
            set { _creatAt = (value == null ? DateTime.UtcNow: value); }
        }

        public DateTime? UpdateAt { get; set; }
    }
}
