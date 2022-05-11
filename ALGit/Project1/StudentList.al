page 50141 StudentList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Student;

    layout
    {
        area(Content)
        {
            repeater(Students)
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
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
            action(Delete)
            {
                trigger OnAction()
                var
                    StudentLine: Record StudentLine;
                begin
                    StudentLine.SetFilter("StudentNo", '%1', Rec."StudentNo");

                    if StudentLine.FindSet() then begin
                        repeat
                            StudentLine.Delete();
                        until StudentLine.Next() = 0
                    end;

                    Rec.Delete();
                end;
            }
            action("Student query")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    studentQuery: Query 50150;
                begin
                    studentQuery.Open();
                    while studentQuery.Read do begin
                        Message('Student %1 name %2', studentQuery.StudentNo, studentQuery.Name);
                    end;
                    studentQuery.Close();
                end;
            }
            action("Export over grade 7")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    studentQuery: Query 50150;
                begin
                    studentQuery.SetFilter(studentQuery.AverageGrade, '>7');
                    studentQuery.Open();
                    // while studentQuery.Read do begin
                    //     Message('Student %1 name %2', studentQuery.StudentNo, studentQuery.Name);
                    // end;

                    studentQuery.SaveAsXml('C:/Users/nicol/OneDrive/Skrivebord/sssssssssss.xml');
                    studentQuery.Close();
                end;
            }
            action("Export DMU education")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    studentQuery: Query 50150;
                begin
                    studentQuery.SetFilter(studentQuery.Education, '=DMU');
                    studentQuery.Open();
                    while studentQuery.Read do begin
                        Message('Student %1 education %2', studentQuery.StudentNo, studentQuery.Education);
                    end;

                    studentQuery.Close();
                end;
            }
        }
    }

    var
        myInt: Integer;
}
