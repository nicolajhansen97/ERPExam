page 50119 AmazonPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            usercontrol("AmazonControl"; "AmazonControl")
            {
                ApplicationArea = All;

                trigger Ready()
                begin
                    CurrPage."AmazonControl".embedHomepage();

                end;
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}