table 50130 Music
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; No; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

        field(20; Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(30; Country; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(40; Genre; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Pop,Rock,Classic';
            OptionMembers = Pop,Rock,Classic;
        }
    }

    keys
    {
        key(PKno; No)
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