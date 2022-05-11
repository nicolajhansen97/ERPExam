codeunit 50155 WelcomeMail
{
    trigger OnRun()
    var
    begin
    end;

    procedure SendWelcomeMail(name: Text; email: Text)
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


        Recipients.Add(email);
        Subject := 'Welcome, ' + name;
        Body := '<b>Hi, ' + name + '</b> <br> You are now registred! <br><br> Best regards, <br> Hardware.dk';
        Mail.CreateMessage('Nicolaj from Hardware.dk', SmtpMailSetup."User ID", Recipients, Subject, Body, HTMLFormatted);

        if not Mail.Send() then
            Message(Mail.GetLastSendMailErrorText());
    end;


    var
        myInt: Integer;

}