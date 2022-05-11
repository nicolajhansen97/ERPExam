page 50142 StudentCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Student;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(StudentNo; Rec.StudentNo)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(Lastname; Rec.LastName)
                {
                    ApplicationArea = All;
                    Caption = 'Last name';

                }

                field(Education; Rec.Education)
                {
                    ApplicationArea = All;

                }

                field(Birthdate; Rec.Birthdate)
                {
                    ApplicationArea = All;

                }

                field(PhoneNumber; Rec.PhoneNumber)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Create Entry")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Add;

                trigger OnAction()
                begin
                    Message('Create Student');
                end;
            }

            action("Open test")
            {
                ApplicationArea = All;
                Image = Absence;
                RunObject = page "Customer Card";
                ShortcutKey = 'Shift+Ctrl+R';

                trigger OnAction();
                var
                    customer: Record "Customer";
                begin
                    customer.FindFirst();
                    Page.Run(21, customer);
                end;
            }

            action("Filter students")
            {
                trigger OnAction();
                var
                    StudentRec: Record "Student";

                begin
                    StudentRec.Reset();
                    StudentRec.SetAscending("StudentNo", false);
                    StudentRec.SetFilter(StudentRec."PhoneNumber", '>10');

                    if StudentRec.FindFirst() then begin
                        StudentRec.Next();
                        Message(StudentRec.Name)
                    end else
                        Message('Couldnt find student');

                end;
            }

            action("Add student auto increment")
            {
                trigger OnAction();
                var
                    triggercodeUnit: CodeUnit 50149;

                begin
                    triggercodeUnit.Run();

                end;
            }
        }

        area(Processing)
        {
            action("Go to Document page")
            {
                ApplicationArea = All;
                RunObject = Page "Student Document";
                RunPageLink = "StudentNo" = FIELD(StudentNo);
            }



        }

    }


    var
        myInt: Integer;


}