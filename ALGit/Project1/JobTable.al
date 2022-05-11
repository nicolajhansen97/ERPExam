table 50151 JobTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(5; JobNumber; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        field(10; JobName; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(20; JobSucces; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(30; JobDate; DateTime)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(JobNO; JobNumber)
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