page 50114 "Product Chart Setup Page"
{
    Caption = 'Product Chart Setup Page';
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Product Chart Setup Table";
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Chart type"; "Chart type")
                {
                    ApplicationArea = All;

                }

                field(Amount; Amount)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnOpenPage()
    begin

        if not Get(UserId) then begin
            "User ID" := UserId;
            Insert();
        end;
        FilterGroup(2);
        SetRange("User ID", UserId);
        FilterGroup(0);
    end;



    var
        myInt: Integer;
}