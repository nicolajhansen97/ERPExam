page 50113 "Product Chart Page"
{
    Caption = 'Product Chart';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Business Chart Buffer";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                usercontrol(BusinessChart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
                {
                    ApplicationArea = All;
                    trigger AddInReady()
                    begin
                        updateChart();
                    end;

                    trigger Refresh()
                    begin
                        updateChart();
                    end;

                    //Not done
                    trigger DataPointClicked(point: JsonObject)
                    var
                        JsonTokenXCalueString: JsonToken;
                        xValueString: Text;
                        SoldItems: Record Item;
                    //student: Record "StudentTable";
                    begin
                        if point.Get('XValueString', JsonTokenXCalueString) then begin
                            xValueString := Format(JsonTokenXCalueString);
                            xValueString := DelChr(xValueString, '=', '"');
                            Message(xValueString);
                            SoldItems.SetRange("No.", xValueString);
                            Page.RunModal(30, SoldItems)
                            //student.SetRange(StudentNo, xValueString);
                            //page.RunModal(50136, student);
                        end;
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Chart Setup")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Chart Setup';
                Image = Setup;

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Product Chart Setup Page");
                    UpdateChart();
                end;
            }
        }
    }

    var
        //StudentChartMgt: Codeunit "Student Chart Management";
        ProductChartMgt: Codeunit "Product Chart Management";
    //Items: Page "Item Card";

    local procedure UpdateChart()
    begin
        //StudentChartMgt.GenerateData(Rec);
        ProductChartMgt.GenerateData(Rec);
        Update(CurrPage.BusinessChart);
    end;
}