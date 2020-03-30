interface ISportsEvaluation
{
    procedure GetEvaluation(): Text;
}

codeunit 50100 Basketball implements ISportsEvaluation
{
    procedure GetEvaluation(): Text;
    begin
        exit('Basketball is cool');
    end;
}

codeunit 50101 Tennis implements ISportsEvaluation
{
    procedure GetEvaluation(): Text;
    begin
        exit('Tennis is fun');
    end;
}

enum 50100 "SportsEvaluation Handler" implements ISportsEvaluation
{
    Extensible = true;
    value(0; Basketball)
    {
        Implementation = ISportsEvaluation = Basketball;
    }
    value(1; Tennis)
    {
        Implementation = ISportsEvaluation = Tennis;
    }
}

table 50100 "SportsEvaluation Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Implementation; Enum "SportsEvaluation Handler")
        {
            DataClassification = CustomerContent;

        }
    }
}

page 50100 "SportsEvaluation Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SportsEvaluation Setup";

    layout
    {
        area(Content)
        {
            group("Implementation Setup")
            {
                field(Implementation; Implementation)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}

codeunit 50102 "SportsEvaluation Mgmt"
{
    procedure GetHandler(var SportsEvaluation: Interface ISportsEvaluation)
    var
        SportsEvaluationSetup: Record "SportsEvaluation Setup";
        SportsEvaluationHandler: Enum "SportsEvaluation Handler";
    begin
        SportsEvaluationSetup.Reset();
        if (SportsEvaluationSetup.FindFirst()) then
            SportsEvaluation := SportsEvaluationSetup.Implementation
        else
            SportsEvaluation := SportsEvaluationHandler::Basketball;
    end;
}