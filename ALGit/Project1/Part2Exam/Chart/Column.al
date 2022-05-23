table 50111 "Column"
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
    }

    keys
    {
        key(Key1; ItemNo)
        {
            Clustered = true;
        }
    }

    var
        ColumnPieces: Record "Column Piece" temporary;


    procedure GetColumnPieces(var Pieces: Record "Column Piece" temporary)
    begin
        ColumnPieces.Reset();
        Pieces.Copy(ColumnPieces, true);
    end;

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