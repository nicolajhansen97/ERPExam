page 50143 "Student Line List"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "StudentLine";
    Caption = 'Student Line List';
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Student No."; Rec.StudentNo)
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec.LineNo)
                {
                    ApplicationArea = All;
                }
                field("Course Name"; Rec.CourseName)
                {
                    ApplicationArea = All;
                }
                field("Grade"; Rec.Grade)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}