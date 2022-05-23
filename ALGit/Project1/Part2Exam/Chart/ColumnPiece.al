table 50110 "Column Piece"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ItemNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; OrderNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(key1; OrderNo, LineNo, ItemNo, Date)
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