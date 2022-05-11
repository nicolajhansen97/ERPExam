codeunit 50148 MyCodeunit
{
    trigger OnRun()
    begin
    end;

    procedure Export()
    var
        CSVBuffer: Record "CSV Buffer" temporary;
        studentHeader: Record "StudentLine";
    begin
        myInt := 0;
        REPEAT
            myInt := myInt + 1;
            CSVBuffer.InsertEntry(myInt, 1, studentHeader.CourseName);
            CSVBuffer.InsertEntry(myInt, 2, FORMAT(studentHeader.Grade));
            CSVBuffer.InsertEntry(myInt, 3, FORMAT(studentHeader.LineNo));
            CSVBuffer.InsertEntry(myInt, 4, FORMAT(studentHeader.StudentNo));
        UNTIL studentHeader.Next = 0;

        CSVBuffer.SaveData('C:\Excel\TestBuffer.csv', ',');

    end;


    procedure HelloWorld();
    begin
        Message('Hello my freind!');
    end;

    var
        myInt: Integer;
}