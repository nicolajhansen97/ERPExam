codeunit 50116 WsCreateOrder
{
    trigger OnRun()
    begin

    end;


    procedure CreateOrder(obj: Text) result: Text
    var

        JsonObj: JsonObject;
        CustomerId: JsonToken;
        Billing: JsonToken;
        Shipping: JsonToken;
        LineItems: JsonToken;
        LineItem: JsonToken;
        WooId: JsonToken;
        Quantity: JsonToken;
        OrderID: JsonToken;


        Customer: Record Customer;
        NewOrder: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Item: Record "Item";

        LineNo: Integer;

        SendOrderConformation: Codeunit NewOrderMail;
    begin

        JsonObj.ReadFrom(obj);
        JsonObj.Get('customer_id', CustomerId);
        JsonObj.Get('billing', Billing);
        JsonObj.Get('shipping', Shipping);
        JsonObj.Get('line_items', LineItems);
        JsonObj.Get('id', OrderID);

        Customer.Reset();


        Customer."No." := Format(customerID);
        if not Customer.Find('=') then
            Message('Error');


        NewOrder.Reset();
        NewOrder.Init();

        NewOrder.VALIDATE("Document Type", NewOrder."Document Type"::Order);
        NewOrder.Validate("Sell-to Customer No.", Customer."No.");

        if NewOrder.Insert(true) then begin
            result := 'Inserted';
        end else begin
            result := 'e';
        end;

        foreach LineItem in LineItems.AsArray() do begin
            Item.Reset();
            SalesLine.Reset();
            SalesLine.Init();

            SalesLine.Validate("Document Type", "Sales Document Type"::Order);
            SalesLine.Validate("Document No.", NewOrder."No.");
            SalesLine.Validate(SalesLine.Type, SalesLine.Type::Item);

            LineItem.AsObject().Get('product_id', WooId);

            Item.SetFilter(Item.WooId, '=%1', WooId.AsValue().AsInteger());
            if not Item.Find('-') then
                Message('Error');

            LineItem.AsObject().Get('quantity', Quantity);

            LineNo := LineNo + 1000;
            SalesLine.Validate("Line No.", LineNo);
            SalesLine.Validate("No.", Item."No.");
            SalesLine.Validate(SalesLine.Quantity, Quantity.AsValue().AsDecimal());

            SalesLine.Insert(true);


        end;
        SendOrderConformation.SendNewOrderMail(LineItems, Billing, OrderID);
    end;

    var
        myInt: Integer;
}