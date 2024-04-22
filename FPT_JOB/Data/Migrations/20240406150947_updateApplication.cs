using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FPT_JOB.Data.Migrations
{
    /// <inheritdoc />
    public partial class updateApplication : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Application_AspNetUsers_UserId",
                table: "Application");

            migrationBuilder.DropForeignKey(
                name: "FK_Application_Job_JobId",
                table: "Application");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "Application",
                newName: "UserID");

            migrationBuilder.RenameIndex(
                name: "IX_Application_UserId",
                table: "Application",
                newName: "IX_Application_UserID");

            migrationBuilder.AlterColumn<string>(
                name: "UserID",
                table: "Application",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "JobId",
                table: "Application",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Application_AspNetUsers_UserID",
                table: "Application",
                column: "UserID",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Application_Job_JobId",
                table: "Application",
                column: "JobId",
                principalTable: "Job",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Application_AspNetUsers_UserID",
                table: "Application");

            migrationBuilder.DropForeignKey(
                name: "FK_Application_Job_JobId",
                table: "Application");

            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "Application",
                newName: "UserId");

            migrationBuilder.RenameIndex(
                name: "IX_Application_UserID",
                table: "Application",
                newName: "IX_Application_UserId");

            migrationBuilder.AlterColumn<string>(
                name: "UserId",
                table: "Application",
                type: "nvarchar(450)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AlterColumn<int>(
                name: "JobId",
                table: "Application",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Application_AspNetUsers_UserId",
                table: "Application",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Application_Job_JobId",
                table: "Application",
                column: "JobId",
                principalTable: "Job",
                principalColumn: "Id");
        }
    }
}
