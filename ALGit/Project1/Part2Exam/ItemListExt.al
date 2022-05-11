pageextension 50118 ItemListExt extends "Item List"
{
    layout
    {
        addafter(InventoryField)
        {
            field(SoldOn; SoldOn)
            {
                Caption = 'Product is sold on';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}