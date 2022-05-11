codeunit 50156 NewOrderMail
{
    trigger OnRun()
    var
    begin
    end;

    procedure SendNewOrderMail(LineItems: JsonToken; Billing: JsonToken; OrderID: JsonToken)
    var


        FileManage: Codeunit "File Management";
        SmtpMailSetup: Record "SMTP Mail Setup";
        Mail: Codeunit "SMTP Mail";
        Recipients: List of [Text];
        Subject: Text;
        Body: Text;
        CRLF: Text[2];
        HTMLFormatted: Boolean;
        inStreamer: InStream;
        tempD: Codeunit "Temp Blob";

        LineItem: JsonToken;
        ItemName: JsonToken;
        ItemQuantity: JsonToken;
        FirstName: JsonToken;
        LastName: JsonToken;
        Adress: JsonToken;
        PostCode: JsonToken;
        City: JsonToken;
        Country: JsonToken;
        Phone: JsonToken;



    begin
        if not SmtpMailSetup.Get() then
            exit;

        HTMLFormatted := true;

        Billing.AsObject().Get('first_name', FirstName);
        Billing.AsObject().Get('last_name', LastName);
        Billing.AsObject().Get('address_1', Adress);
        Billing.AsObject().Get('postcode', PostCode);
        Billing.AsObject().Get('city', City);
        Billing.AsObject().Get('country', Country);
        Billing.AsObject().Get('phone', Phone);





        Recipients.Add('nicolajhansen97@live.dk');
        Subject := 'Thanks, ' + FirstName.AsValue().AsText();
        Body := '<b>Hi, ' + FirstName.AsValue().AsText() + ' </b> <br> This is your order conformation. We recieved following from you: <br><br> Name: '
        + firstName.AsValue().AsText() + ' ' + lastName.AsValue().AsText() + '<br> Adress: ' + Adress.AsValue().AsText() + ', ' + PostCode.AsValue().AsText() + ' ' + City.AsValue().AsText() + ', ' + Country.AsValue().AsText() + '<br> Phone: ' + Phone.AsValue().AsText() +
        '<br><br> You ordered the following items:';

        foreach LineItem in LineItems.AsArray() do begin
            LineItem.AsObject().Get('name', ItemName);
            LineItem.AsObject().Get('quantity', ItemQuantity);

            Body := Body + '<br> Item name: ' + ItemName.AsValue().AsText() + ' - ' + ItemQuantity.AsValue.AsText() + ' Piece(s)'
        end;

        Body := Body + '<br><br> Best regards, <br> Hardware.dk';

        Mail.CreateMessage('Hardware.dk - Orderconformation (Ordernumber: ' + OrderID.AsValue().AsText() + ') ', SmtpMailSetup."User ID", Recipients, Subject, Body, HTMLFormatted);

        if not Mail.Send() then
            Message(Mail.GetLastSendMailErrorText());
    end;



    var
        myInt: Integer;

}