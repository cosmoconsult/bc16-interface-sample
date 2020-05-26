interface "Sports Evaluation"
{
    procedure GetEvaluation(): Text;
}

codeunit 50100 Basketball implements "Sports Evaluation"
{
    procedure GetEvaluation(): Text;
    begin
        exit('Basketball is cool');
    end;
}

codeunit 50101 Tennis implements "Sports Evaluation"
{
    procedure GetEvaluation(): Text;
    begin
        exit('Tennis is fun');
    end;
}

enum 50100 "Sports Evaluation Provider" implements "Sports Evaluation"
{
    Extensible = true;
    value(0; Default)
    {
        Implementation = "Sports Evaluation" = Basketball;
    }
    value(1; Basketball)
    {
        Implementation = "Sports Evaluation" = Basketball;
    }
    value(2; Tennis)
    {
        Implementation = "Sports Evaluation" = Tennis;
    }
}

table 50100 "Sports Evaluation Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Selected Sports Handler"; Enum "Sports Evaluation Provider")
        {
            DataClassification = CustomerContent;

        }
    }
}

page 50100 "Sports Evaluation Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sports Evaluation Setup";

    layout
    {
        area(Content)
        {
            group("Implementation Setup")
            {
                field("Selected Sports Handler"; "Selected Sports Handler")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}

codeunit 50102 "SportsEvaluation Mgmt"
{
    procedure GetHandler(var SportsEvaluation: Interface "Sports Evaluation")
    var
        SportsEvaluationSetup: Record "Sports Evaluation Setup";
        SportsEvaluationHandler: Enum "Sports Evaluation Provider";
    begin
        SportsEvaluationSetup.Reset();
        if (SportsEvaluationSetup.FindFirst()) then
            SportsEvaluation := SportsEvaluationSetup."Selected Sports Handler"
        else
            SportsEvaluation := SportsEvaluationHandler::Default;
    end;
}