using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace api_all.Migrations
{
    public partial class ajustecarrinho : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_CarrinhoCompraItens",
                table: "CarrinhoCompraItens");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "CarrinhoCompraItens");

            migrationBuilder.DropColumn(
                name: "CreateAt",
                table: "CarrinhoCompraItens");

            migrationBuilder.DropColumn(
                name: "UpdateAt",
                table: "CarrinhoCompraItens");

            migrationBuilder.AlterColumn<string>(
                name: "CarrinhoCompraId",
                table: "CarrinhoCompraItens",
                maxLength: 100,
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 200,
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CarrinhoCompraItemId",
                table: "CarrinhoCompraItens",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            migrationBuilder.AddPrimaryKey(
                name: "PK_CarrinhoCompraItens",
                table: "CarrinhoCompraItens",
                column: "CarrinhoCompraItemId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_CarrinhoCompraItens",
                table: "CarrinhoCompraItens");

            migrationBuilder.DropColumn(
                name: "CarrinhoCompraItemId",
                table: "CarrinhoCompraItens");

            migrationBuilder.AlterColumn<string>(
                name: "CarrinhoCompraId",
                table: "CarrinhoCompraItens",
                maxLength: 200,
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 100,
                oldNullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "Id",
                table: "CarrinhoCompraItens",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<DateTime>(
                name: "CreateAt",
                table: "CarrinhoCompraItens",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdateAt",
                table: "CarrinhoCompraItens",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_CarrinhoCompraItens",
                table: "CarrinhoCompraItens",
                column: "Id");
        }
    }
}
