table 50150 StudentSetupTable
{
    Caption = 'Student Setup';

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary key';
            TableRelation = "No. Series";
            DataClassification = AccountData;

        }

        field(20; "Student Nos."; Code[20])
        {
            Caption = 'Student Nos.';
            TableRelation = "No. Series";
            DataClassification = AccountData;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

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