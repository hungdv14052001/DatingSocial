using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace DatingSocialApi.Migrations
{
    public partial class v_02 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "posts",
                columns: new[] { "Id", "CreatedDate", "Image", "NumberLike", "Title", "UpdatedDate", "UserId" },
                values: new object[] { 1, new DateTime(2022, 12, 6, 4, 17, 4, 434, DateTimeKind.Utc).AddTicks(3003), "post/post-1-1.jpg", 0, "Cảnh đẹp :))", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), 1 });

            migrationBuilder.UpdateData(
                table: "users",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedDate",
                value: new DateTime(2022, 12, 6, 4, 17, 4, 430, DateTimeKind.Utc).AddTicks(3237));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "posts",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.UpdateData(
                table: "users",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedDate",
                value: new DateTime(2022, 12, 6, 3, 34, 46, 896, DateTimeKind.Utc).AddTicks(8636));
        }
    }
}
