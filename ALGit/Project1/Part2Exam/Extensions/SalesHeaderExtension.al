tableextension 50122 SalesHeaderExtension extends "Sales Header"
{
    fields
    {
        field(150; CustomDate; DateTime)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                dateTimeCustom: DateTime;
                dateCustom: Date;
                timeCustom: Time;
                FinalDateTimeCustom: DateTime;

            begin
                dateTimeCustom := CurrentDateTime;
                dateCustom := DT2DATE(dateTimeCustom) - 105;
                timeCustom := DT2Time(dateTimeCustom);
                FinalDateTimeCustom := CreateDateTime(dateCustom, timeCustom);
                Rec.CustomDate := FinalDateTimeCustom;
            end;
        }
    }

    trigger OnBeforeInsert()
    var
        dateTimeCustom: DateTime;
    begin
        Rec.Validate(CustomDate);
    end;






    var
        myInt: Integer;
}