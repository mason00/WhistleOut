namespace WhistleOut.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class OrderProduct : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        OrderNo = c.String(),
                        Customer_id = c.Int(),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Customers", t => t.Customer_id)
                .Index(t => t.Customer_id);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        Quantity = c.Int(nullable: false),
                        Order_id = c.Int(),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Orders", t => t.Order_id)
                .Index(t => t.Order_id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Orders", "Customer_id", "dbo.Customers");
            DropForeignKey("dbo.Products", "Order_id", "dbo.Orders");
            DropIndex("dbo.Products", new[] { "Order_id" });
            DropIndex("dbo.Orders", new[] { "Customer_id" });
            DropTable("dbo.Products");
            DropTable("dbo.Orders");
        }
    }
}
