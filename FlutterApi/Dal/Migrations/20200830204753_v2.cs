using Microsoft.EntityFrameworkCore.Migrations;

namespace Dal.Migrations
{
    public partial class v2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "prdocutId",
                table: "Products");

            migrationBuilder.EnsureSchema(
                name: "dbo");

            migrationBuilder.RenameTable(
                name: "UserStars",
                newName: "UserStars",
                newSchema: "dbo");

            migrationBuilder.RenameTable(
                name: "Users",
                newName: "Users",
                newSchema: "dbo");

            migrationBuilder.RenameTable(
                name: "UserFavorites",
                newName: "UserFavorites",
                newSchema: "dbo");

            migrationBuilder.RenameTable(
                name: "SubCategories",
                newName: "SubCategories",
                newSchema: "dbo");

            migrationBuilder.RenameTable(
                name: "PurchaseHistory",
                newName: "PurchaseHistory",
                newSchema: "dbo");

            migrationBuilder.RenameTable(
                name: "Products",
                newName: "Products",
                newSchema: "dbo");

            migrationBuilder.RenameTable(
                name: "ProductPhotos",
                newName: "ProductPhotos",
                newSchema: "dbo");

            migrationBuilder.RenameTable(
                name: "Categories",
                newName: "Categories",
                newSchema: "dbo");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameTable(
                name: "UserStars",
                schema: "dbo",
                newName: "UserStars");

            migrationBuilder.RenameTable(
                name: "Users",
                schema: "dbo",
                newName: "Users");

            migrationBuilder.RenameTable(
                name: "UserFavorites",
                schema: "dbo",
                newName: "UserFavorites");

            migrationBuilder.RenameTable(
                name: "SubCategories",
                schema: "dbo",
                newName: "SubCategories");

            migrationBuilder.RenameTable(
                name: "PurchaseHistory",
                schema: "dbo",
                newName: "PurchaseHistory");

            migrationBuilder.RenameTable(
                name: "Products",
                schema: "dbo",
                newName: "Products");

            migrationBuilder.RenameTable(
                name: "ProductPhotos",
                schema: "dbo",
                newName: "ProductPhotos");

            migrationBuilder.RenameTable(
                name: "Categories",
                schema: "dbo",
                newName: "Categories");

            migrationBuilder.AddColumn<int>(
                name: "prdocutId",
                table: "Products",
                type: "int",
                nullable: true);
        }
    }
}
