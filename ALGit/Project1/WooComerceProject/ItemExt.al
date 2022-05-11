tableextension 50120 ItemExt extends Item
{
    fields
    {
        // Add changes to table fields here
        field(150; WooId; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(160; SoldOn; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Webshop","Physical Store","Webshop and Physical Store";
        }
    }

    trigger OnAfterInsert()
    var
        ResJson: JsonObject;
        JsonTokenWooId: JsonToken;
    begin
        WooService.Run();

        ResJson := WooService.InsertItem(Rec);

        ResJson.Get('id', JsonTokenWooId);
        Rec.WooId := JsonTokenWooId.AsValue().AsInteger();
    end;


    trigger OnBeforeModify()
    var
        ResJson: JsonObject;
    begin
        If format(xRec) <> format(rec) then begin
            WooService.Run();
            ResJson := WooService.ModifyItem(Rec);
        end;

    end;

    var
        WooService: Codeunit WooService;
}