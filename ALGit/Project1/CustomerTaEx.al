tableextension 50101 CustomerExtension extends "Customer"
{
    fields
    {
        field(50; Nickname; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Nickname';

            trigger OnValidate()
            begin

                if (rec.Nickname.ToLower() = rec.Name.ToLower()) then begin
                    Rec.Nickname := xRec.Nickname;
                    Message('HALLO, DU KAN IKKE HAVE DET SAMME, FORSTÅ DET DOG!');

                end

            end;

        }
    }

    var
        myInt: Integer;
}