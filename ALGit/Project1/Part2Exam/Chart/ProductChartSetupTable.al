table 50112 "Product Chart Setup Table"
{
    DataClassification = ToBeClassified;
    Caption = 'Product Chart Setup Table';

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;

        }
        field(10; "Chart type"; Option)
        {
            Caption = 'Chart type';
            DataClassification = ToBeClassified;
            OptionMembers = Point,,Bubble,Line,,StepLine,,,,,StackedColumn,StackedColumn100,Area;
            OptionCaption = 'Point,, Bubble, Line,, StepLine,,,,, StackedColumn,StackedColumn100, Area';

            //OptionCaption = 'Stacked Area,Stacked Area (%),Stacked Column,Stacked Column (%)';
            //OptionMembers = "Stacked Area","Stacked Area (%)","Stacked Column","Stacked Column (%)";

        }
        field(20; "Amount"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = All;
            OptionCaption = 'All';
        }
    }

    keys
    {
        key(Key1; "User ID")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}