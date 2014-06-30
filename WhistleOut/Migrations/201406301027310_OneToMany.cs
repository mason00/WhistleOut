namespace WhistleOut.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class OneToMany : DbMigration
    {
        public override void Up()
        {
            RenameColumn(table: "dbo.Products", name: "Order_id", newName: "MasterOrder_id");
            RenameIndex(table: "dbo.Products", name: "IX_Order_id", newName: "IX_MasterOrder_id");
        }
        
        public override void Down()
        {
            RenameIndex(table: "dbo.Products", name: "IX_MasterOrder_id", newName: "IX_Order_id");
            RenameColumn(table: "dbo.Products", name: "MasterOrder_id", newName: "Order_id");
        }
    }
}
