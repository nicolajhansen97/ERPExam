table 50144 StudentLine
{
    DataClassification = ToBeClassified;

    fields
    {

        field(5; StudentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student number';
        }

        field(7; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(10; CourseName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course';
        }

        field(20; Grade; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        //   key(PK; "Student No.", "Line No.")

        key(PkNO; StudentNo, LineNo)
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