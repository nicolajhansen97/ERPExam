pageextension 50121 ItemCardExt extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field(WooId; Rec.WooId)
            {
                Caption = 'Woo Id';
                ApplicationArea = All;
                Editable = false;
            }
        }

        addafter("WooId")
        {
            field(SoldOn; Rec.SoldOn)
            {
                Caption = 'Product sold on';
                ApplicationArea = All;
                Editable = true;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Page 42;
        a: Record "Sales Header";
        b: Record "Sales Line";
}