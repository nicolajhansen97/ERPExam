page 50152 JobList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = JobTable;

    layout
    {
        area(Content)
        {
            repeater(Jobs)
            {

                field(JobNumber; Rec.JobNumber)
                {
                    ApplicationArea = All;

                }
                field(JobName; Rec.JobName)
                {
                    ApplicationArea = All;

                }

                field(JobSucces; Rec.JobSucces)
                {
                    ApplicationArea = All;

                }

                field(JobDate; Rec.JobDate)
                {
                    ApplicationArea = All;

                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}