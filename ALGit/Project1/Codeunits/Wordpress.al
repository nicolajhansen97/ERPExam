codeunit 50151 Wordpress
{
    trigger OnRun()
    begin

    end;

    procedure test()
    var
        client: HttpClient;
        content: HttpContent;
        response: HttpResponseMessage;
        data: Text;
    begin
        client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics365');
        client.DefaultRequestHeaders.Add('Authorization', 'Basic Y2tfZWE2YWIzNGE1OWU2NTk3MzNkYmQ5YmRkNmMxZGMzN2RjNWY2ZWU0ZTpjc18yMTMxNGRjZTYwY2Q1MjIwY2I2N2Q4NDJiOGNlNWFhM2Y1NzNlNDlk');
        if client.Get('https://localhost/wordpress/wp-json/wc/v3/orders', response) then begin
            response.Content.ReadAs(data);
        end;
        Message(data);
    end;

    procedure createCustomer()
    var
        client: HttpClient;
        content: HttpContent;
        response: HttpResponseMessage;
        data: Text;
    begin
        client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics365');
        client.DefaultRequestHeaders.Add('Authorization', 'Basic Y2tfZWE2YWIzNGE1OWU2NTk3MzNkYmQ5YmRkNmMxZGMzN2RjNWY2ZWU0ZTpjc18yMTMxNGRjZTYwY2Q1MjIwY2I2N2Q4NDJiOGNlNWFhM2Y1NzNlNDlk');
        if client.Get('https://localhost/wordpress/wp-json/wc/v3/customers', response) then begin
            response.Content.ReadAs(data);
        end;
        Message(data);
    end;

    var
        myInt: Integer;
}