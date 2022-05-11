codeunit 50153 JobUnit
{
    trigger OnRun()
    begin
        CreateProdedure();
    end;


    local procedure CreateProdedure();
    var

        Job: Record JobTable;


    begin
        Job.Init();
        Job.Validate(JobName, 'Kasseekspedient');
        Job.Validate(JobSucces, false);
        Job.Validate(JobDate, System.CurrentDateTime);
        Job.Insert(true);
    end;

    var
        myInt: Integer;
}