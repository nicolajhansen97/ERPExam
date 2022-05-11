codeunit 50122 FraudReport
{
    trigger OnRun()
    begin
        Export();
    end;

    procedure Export()
    var
        CSVBuffer: Record "CSV Buffer" temporary;
        OrderTest: Record "Order Address";
    begin
        myInt := 0;
        REPEAT
            myInt := myInt + 1;
            CSVBuffer.InsertEntry(myInt, 1, OrderTest.Address);
            CSVBuffer.InsertEntry(myInt, 2, FORMAT(OrderTest.City));
            CSVBuffer.InsertEntry(myInt, 3, FORMAT(OrderTest."Country/Region Code"));
            CSVBuffer.InsertEntry(myInt, 4, FORMAT(OrderTest."E-Mail"));
        UNTIL OrderTest.Next = 0;

        CSVBuffer.SaveData('C:\Excel\TestBuffer2.csv', ',');

    end;

    var
        myInt: Integer;
}