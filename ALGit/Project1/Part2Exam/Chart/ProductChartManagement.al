codeunit 50113 "Product Chart Management"
{
    trigger OnRun()
    begin
    end;

    var
        //StudentChartSetup: Record "Student Chart Setup Table";
        ProductChartSetup: Record "Product Chart Setup Table";
        t: page "Trailing Sales Orders Chart";
        SalesOrders: Record "Sales Header";

    procedure GenerateData(var bcf: Record "Business Chart Buffer")
    var
        SalesOrderLines: Record "Sales Line";
        ColumnIndex: Integer;
        tempDate: Date;
        StartDate: Date;
        EndDate: Date;
        Days: Integer;
        Column: Record "Column" temporary;
        ColumnPiece: Record "Column Piece" temporary;
        DateToIndex: DotNet GenericDictionary2;
        RowIndex: Integer;
        OldMeasureValue: Variant;
        OldMeasureValueInt: Integer;
    begin
        ProductChartSetup.SetRange("User ID", UserId);
        if not ProductChartSetup.FindFirst() then
            page.RunModal(Page::"Product Chart Setup Page");


        with bcf do begin
            Initialize();

            DateToIndex := DateToIndex.Dictionary();
            StartDate := NormalDate(20220101D); //We dont have acces to dates due to license. So we do it hardcoded.
            EndDate := NormalDate(20220131D);
            Days := CalcNumberOfPeriods(StartDate, EndDate);

            // setup the dates on the Y-axis
            for RowIndex := 0 to Days - 1 do begin
                tempDate := StartDate;
                tempDate += RowIndex;
                DateToIndex.Add(Format(tempDate), RowIndex);
                AddMeasure(format(tempDate), RowIndex, "Data Type"::Integer, ProductChartSetup."Chart type");
            end;

            // filter to get orders in a specific date range
            SalesOrders.SetFilter("Document Type", Format(SalesOrders."Document Type"::Order));
            SalesOrders.SetRange("Order Date", StartDate, EndDate);


            Column.GetColumnPieces(ColumnPiece);

            // loop for getting the necessary data for the columns and column pieces of the chart
            if SalesOrders.Findset() then begin
                repeat
                    SalesOrderLines.Reset();
                    SalesOrderLines.SetFilter("Document No.", SalesOrders."No.");

                    // get sales lines
                    if SalesOrderLines.Findset() then begin
                        repeat
                            Column.SetFilter(ItemNo, SalesOrderLines."No.");
                            if not Column.FindSet() then begin
                                Column.Reset();
                                Column.Init();
                                Column.ItemNo := SalesOrderLines."No.";
                                Column.Quantity := SalesOrderLines.Quantity;
                                Column.Insert();
                            end else begin
                                Column.Quantity := Column.Quantity + SalesOrderLines.Quantity;
                                Column.Modify();
                            end;

                            ColumnPiece.Reset();
                            ColumnPiece.Init();
                            ColumnPiece.OrderNo := SalesOrders."No.";
                            ColumnPiece.LineNo := SalesOrderLines."Line No.";
                            ColumnPiece.ItemNo := SalesOrderLines."No.";
                            ColumnPiece.Quantity := SalesOrderLines.Quantity;
                            ColumnPiece.Date := SalesOrders."Order Date";
                            ColumnPiece.Insert();
                        until SalesOrderLines.Next() = 0;
                    end;
                until SalesOrders.Next() = 0;
            end;

            // sort the columns by quantity and descending
            Column.Reset();
            Column.SetCurrentKey(Quantity);
            Column.SetAscending(Quantity, false);

            SetXAxis('Item No', "Data Type"::String);

            // loop for adding the columns and column pieces to the chart
            if Column.FindSet() then begin
                repeat
                    AddColumn(Column.ItemNo);
                    ColumnPiece.Reset();
                    ColumnPiece.SetFilter(ItemNo, Column.ItemNo);

                    // add column pieces
                    if ColumnPiece.FindSet() then begin
                        repeat
                            GetValue(format(ColumnPiece.Date), ColumnIndex, OldMeasureValue);

                            if format(OldMeasureValue) <> '' then begin
                                Evaluate(OldMeasureValueInt, format(OldMeasureValue));
                                SetValueByIndex(
                                    DateToIndex.Item(format(ColumnPiece.Date)),
                                    ColumnIndex,
                                    ColumnPiece.Quantity + OldMeasureValueInt
                                );
                            end else begin
                                SetValueByIndex(
                                    DateToIndex.Item(format(ColumnPiece.Date)),
                                    ColumnIndex,
                                    ColumnPiece.Quantity
                                );
                            end;
                        until ColumnPiece.Next() = 0;
                    end;
                    ColumnIndex += 1;
                    if Column.Next() = 0 then break;
                until ColumnIndex = 5;
            end;
        end;
    end;
}