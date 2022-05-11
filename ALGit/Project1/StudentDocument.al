page 50144 "Student Document"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Student;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec.StudentNo)
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Lastname"; Rec.LastName)
                {
                    ApplicationArea = All;
                }
                field("Birthdate"; Rec.Birthdate)
                {
                    ApplicationArea = All;
                }
                field("Phone Number"; Rec.PhoneNumber)
                {
                    ApplicationArea = All;
                }
                field("Average Grade"; Rec.AverageGrade)
                {
                    ApplicationArea = All;
                }
            }

            part(Studentlines; "Student Line List")
            {
                ApplicationArea = all;
                SubPageLink = "StudentNo" = FIELD("StudentNo");
                UpdatePropagation = Both;
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