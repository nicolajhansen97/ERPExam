page 50124 ActionTester
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {

            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Show Location Codes")
            {
                trigger OnAction();
                var
                    customer: Record "Customer";
                    CustRecTmp: Record Customer temporary;

                begin

                    if customer.Find('-') then
                        repeat

                            custRecTmp.SetFilter("Location Code", customer."Location Code");
                            if not CustRecTmp.FindFirst() then begin
                                CustRecTmp := customer;
                                CustRecTmp.Insert(false)

                            end;
                        until customer.Next() = 0;

                    Message(Format(CustRecTmp.Count))

                end;




            }
        }
        area(Processing)
        {
            action("Test mail")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    MailUnit: Codeunit 50154;
                begin
                    MailUnit.MailStudentUpdate();

                end;
            }

            action(WordPressCall)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    WordPressService: CodeUnit Wordpress;
                begin
                    WordPressService.test();
                end;
            }
        }
    }

    var
        myInt: Integer;
}