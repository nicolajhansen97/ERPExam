codeunit 50111 WordPressWSCU
{
    trigger OnRun()
    begin

    end;

    procedure CreateCustomer(id: Integer; firstName: Text; lastName: Text; customerEmail: Text; customerUsername: Text) result: Text
    var
        Customer: Record Customer;
        SendWelcomeMail: Codeunit WelcomeMail;
    begin
        Customer.Reset();
        Customer.Init();

        Customer."No." := Format(id);
        Customer.Name := firstName + ' ' + lastName;
        Customer."E-Mail" := customerEmail;
        Customer."Search Name" := customerUsername;
        Customer."Gen. Bus. Posting Group" := 'EU';
        Customer."Customer Posting Group" := 'EU';
        Customer."Payment Terms Code" := 'COD';

          SendWelcomeMail.SendWelcomeMail(firstName, customerEmail); //Husk at skifte ud til email!

        if Customer.Insert() then begin
            result := 'Inserted';
        end else begin
            result := 'e';
        end;
    end;

    var
        myInt: Integer;
}