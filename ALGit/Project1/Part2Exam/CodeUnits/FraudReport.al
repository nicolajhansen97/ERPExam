codeunit 50122 FraudReport
{
    trigger OnRun()
    begin
        Export();
    end;

    procedure Export()
    var
        CSVBuffer: Record "CSV Buffer" temporary;
        OrderTest: Record "Sales Header";

        dateTimeCustom: DateTime;
        dateCustom: Date;
        CustomTime: Time;
        oldDate: Date;
        currentDate: Date;
        currentDateTimeOur: DateTime;
        oldDateTime: DateTime;

        AddressDic: Dictionary of [Text, Integer];


    //SalesOrderTemp: Record "Sales Header" temporary;

    begin
        dateTimeCustom := CurrentDateTime;
        dateCustom := DT2DATE(dateTimeCustom) - 105;
        CustomTime := 200000T;
        oldDate := (dateCustom) - 1;
        currentDateTimeOur := CreateDateTime(dateCustom, CustomTime);
        oldDateTime := CreateDateTime(oldDate, CustomTime);


        OrderTest.SetRange(OrderTest.CustomDate, oldDateTime, currentDateTimeOur);


        myInt := 0;
        REPEAT
            myInt := myInt + 1;

            if (AddressDic.ContainsKey(Format(OrderTest."Sell-to Address"))) then begin
                AddressDic.Set(Format(OrderTest."Sell-to Address"), AddressDic.Get(Format(OrderTest."Sell-to Address")) + 1);
            end else begin
                AddressDic.Add(Format(OrderTest."Sell-to Address"), 1);
            end;

            if (AddressDic.Get(Format(OrderTest."Sell-to Address")) = 5) then begin
                CSVBuffer.InsertEntry(myInt, 1, OrderTest."No." + '  |  ');
                CSVBuffer.InsertEntry(myInt, 2, (OrderTest."Sell-to Customer Name" + '  |  '));
                CSVBuffer.InsertEntry(myInt, 3, OrderTest."Sell-to Address" + '  |  ');
                CSVBuffer.InsertEntry(myInt, 4, FORMAT(OrderTest.CustomDate));
            end;
        //Message(Format(AddressDic.Get(Format(OrderTest."Sell-to Address"))));
        UNTIL OrderTest.Next = 0;

        CSVBuffer.SaveData('C:\Excel\TestBuffer3.csv', '');


    end;

    var
        myInt: Integer;
}