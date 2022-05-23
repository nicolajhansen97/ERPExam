pageextension 50122 MyExtension extends "Sales Order"
{
    layout
    {
        addafter("Requested Delivery Date")
        {
            field("CustomDate"; Rec.CustomDate)
            {
                Caption = 'CustomDate';
                ApplicationArea = All;
                Editable = True;
            }
        }

    }

    var
        myInt: Integer;
}