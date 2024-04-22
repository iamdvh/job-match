﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FPT_JOB.Data.Migrations
{
    /// <inheritdoc />
    public partial class updateApplicationStatus : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "Application",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "Application");
        }
    }
}
