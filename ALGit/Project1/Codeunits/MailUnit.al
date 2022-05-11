codeunit 50154 MailUnit
{
    trigger OnRun()
    var
        CreateCSV: Codeunit "MyCodeUnit";
    begin
        CreateCSV.Export();
        MailStudentUpdate();
    end;

    procedure MailStudentUpdate()
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


    begin
        if not SmtpMailSetup.Get() then
            exit;

        HTMLFormatted := true;


        Recipients.Add('nicolajhansen97@live.dk');
        Subject := 'Student Grades updated';
        Body := '<b>Hi,</b> <br> The student grades have been updated. <br><br> Best regards, <br> Nicolaj';
        Mail.CreateMessage('Business Central', SmtpMailSetup."User ID", Recipients, Subject, Body, HTMLFormatted);

        FileManage.BLOBImportFromServerFile(tempD, 'C:\Excel\TestBuffer.csv');

        tempD.CreateInStream(inStreamer);

        mail.AddAttachmentStream(inStreamer, 'TestBuffer.csv');

        if not Mail.Send() then
            Message(Mail.GetLastSendMailErrorText());
    end;


    var
        myInt: Integer;

}