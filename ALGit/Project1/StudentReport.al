report 50151 StudentReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = './SaleOrderReport.docx';


    dataset
    {

        dataitem(student; Student)
        {
            DataItemTableView = sorting("StudentNo") ORDER(descending);
            PrintOnlyIfDetail = true;
            column(No; "StudentNo")
            {
                IncludeCaption = true;
            }
            column(Name; "Name")
            {
                IncludeCaption = true;
            }
            column(LastName; "LastName")
            {
            }

            dataitem(Line; "StudentLine")
            {
                DataItemLink = "StudentNo" = field("StudentNo");

                column(LineNo; "LineNo")
                {
                    IncludeCaption = true;
                }

                column(education; "CourseName")
                {
                    IncludeCaption = true;
                }
            }

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Report)
                {
                    field(Name; Student.Name)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        //Student_Line.SetFilter(Grade, '>%1', GradeReq);
        //Student_Line.SetAscending(Student_Line.Grade, true);
        //Sales_Header.SetCurrentKey("No.");
        //Sales_Header.SetAscending(Sales_Header."No.", true);
    end;


    var
        myInt: Integer;
}