table 50140 Student
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(20; LastName; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(30; Education; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(40; Birthdate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50; StudentNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(60; PhoneNumber; Text[30])
        {
            DataClassification = ToBeClassified;
        }

        field(70; "AverageGrade"; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Average Grade';

            CalcFormula = average("StudentLine".Grade WHERE(StudentNo = FIELD("StudentNo")));
        }

        field(100; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(PKno; StudentNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        CustRecTmp: Record Customer temporary;
        StudentSetup: Record StudentSetupTable;
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "StudentNo" = '' then begin
            StudentSetup.get;
            StudentSetup.TestField("Student Nos.");
            NoSeriesMgt.InitSeries(StudentSetup."Student Nos.", xRec."No. Series", 0D, "StudentNo", "No. Series");

        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;
}



