codeunit 50103 Soccer implements "Sports Evaluation"
{
    procedure GetEvaluation(): Text;
    begin
        exit('Soccer sucks');
    end;
}

enumextension 50110 AddSoccer extends "Sports Evaluation Provider"
{
    value(50110; Soccer)
    {
        Implementation = "Sports Evaluation" = Soccer;
    }
}