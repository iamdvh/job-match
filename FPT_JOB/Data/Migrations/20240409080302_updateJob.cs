using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FPT_JOB.Data.Migrations
{
    /// <inheritdoc />
    public partial class updateJob : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Company",
                table: "Job",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "JobPictute",
                table: "Job",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Company",
                table: "Job");

            migrationBuilder.DropColumn(
                name: "JobPictute",
                table: "Job");
        }
    }
}
