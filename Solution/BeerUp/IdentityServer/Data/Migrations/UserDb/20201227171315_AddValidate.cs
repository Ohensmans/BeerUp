using Microsoft.EntityFrameworkCore.Migrations;

namespace IdentityServer.Data.Migrations.UserDb
{
    public partial class AddValidate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Valide",
                table: "AspNetUsers",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Valide",
                table: "AspNetUsers");
        }
    }
}
