pageextension 50117 "Page Menu Extension" extends "Order Processor Role Center"
{
    actions
    {
        addfirst(Action76)
        {
            action("WooCommerce")
            {
                ApplicationArea = All;
                Promoted = true;
                RunObject = Page 50142;
            }
        }

        addafter("WooCommerce")
        {
            action("Top Amazon Electronic Products")
            {
                ApplicationArea = All;
                Promoted = true;
                RunObject = Page 50142;
            }
        }
    }
}