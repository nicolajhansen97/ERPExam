// example for sending https requests
// https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpcontent/httpcontent-data-type

codeunit 50121 WooService
{
    var
        Client: HttpClient;
        Ck: Label 'ck_ea6ab34a59e659733dbd9bdd6c1dc37dc5f6ee4e';
        Cs: Label 'cs_21314dce60cd5220cb67d842b8ce5aa3f573e49d';


    trigger OnRun()
    begin
        if not (Client.DefaultRequestHeaders.Contains('User-Agent') and
            Client.DefaultRequestHeaders.Contains('Authorization')
        ) then begin
            Client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
            Client.DefaultRequestHeaders.Add('Authorization', CreateAuthString());
        end;

    end;

    procedure ModifyItem(Item: Record Item) JsonBody: JsonObject
    var
        Response: HttpResponseMessage;
        Request: HttpRequestMessage;
        Body: Text;
        Url: Text;
    begin
        // proof of concept, edit name
        JsonBody.Add('name', Item.Description);
        JsonBody.Add('regular_price', Format(Item."Unit Price"));
        JsonBody.WriteTo(Body);

        Url := 'https://localhost/wordpress/wp-json/wc/v3/products/' + Format(Item.WooId);

        CreateHttpRequestMessage('PUT', Url, Body, Request);

        if Client.Send(Request, Response) then begin
            JsonBody := GetBodyAsJsonObject(Response);
        end;
    end;

    procedure InsertItem(Item: Record Item) JsonBody: JsonObject
    var
        Response: HttpResponseMessage;
        Request: HttpRequestMessage;
    begin
        CreateHttpRequestMessage('POST', 'https://localhost/wordpress/wp-json/wc/v3/products', '', Request);

        if Client.Send(Request, Response) then begin
            JsonBody := GetBodyAsJsonObject(Response);
        end;
    end;







    // https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpcontent/httpcontent-data-type
    local procedure CreateHttpRequestMessage(Method: Text; Url: Text; Body: Text; Request: HttpRequestMessage)
    var
        Content: HttpContent;
        Headers: HttpHeaders;
    begin
        Content.WriteFrom(Body);

        Content.GetHeaders(headers);
        Headers.Clear();
        Headers.Add('Content-Type', 'application/json');

        Request.Content := Content;
        Request.SetRequestUri(Url);
        Request.Method := Method;
    end;



    /// <summary>
    /// http://dankinsella.blog/http-basic-authentication-with-the-al-httpclient/
    /// https://github.com/microsoft/ALAppExtensions/blob/main/BREAKINGCHANGES.md
    /// 
    /// Error: 'Codeunit "Type Helper"' does not contain a definition for 'ConvertValueToBase64'
    /// Solution: Function has been moved to codeunit 4110 "Base64 Convert", function ToBase64
    /// </summary>
    /// <returns></returns>
    local procedure CreateAuthString() AuthString: Text
    var
        TypeHelper: Codeunit "Base64 Convert";
    begin
        AuthString := STRSUBSTNO('%1:%2', Ck, Cs);
        AuthString := TypeHelper.ToBase64(AuthString);
        AuthString := STRSUBSTNO('Basic %1', AuthString);
    end;

    local procedure GetBodyAsJsonObject(Response: HttpResponseMessage) JsonBody: JsonObject
    var
        Body: Text;
    begin
        Response.Content.ReadAs(Body);
        JsonBody.ReadFrom(Body);
    end;
}