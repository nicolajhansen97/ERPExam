codeunit 50149 StudentSetup
{
    trigger OnRun()
    begin
        InitSetup();
    end;


    local procedure InitSetup();
    var
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";
        StudentSetup: Record "StudentSetupTable";
        SourceCodeSetup: Record "Source Code Setup";
        SourceCode: Record "Source Code";

    begin
        Message('Test');
        SetupExist := StudentSetup.get;
        if SetupExist then
            exit;

        StudentSetup.init;
        if StudentSetup.Insert then;

        NoSerie.Code := 'STD';
        NoSerie.Description := 'Student Management';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'STD0000';
        NoSerieLine."Ending No." := 'STD9000';
        if NoSerieLine.Insert then;
        StudentSetup."Student Nos." := NoSerie.code;

        StudentSetup.Modify;

    end;




    var
        myInt: Integer;
        SetupExist: Boolean;

}