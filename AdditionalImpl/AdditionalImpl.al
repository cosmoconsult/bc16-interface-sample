codeunit 50103 Soccer implements ISportsEvaluation
{
    procedure GetEvaluation(): Text;
    begin
        exit('Soccer sucks');
    end;
}

enumextension 50110 AddSoccer extends "SportsEvaluation Handler"
{
    value(50110; Soccer)
    {
        Implementation = ISportsEvaluation = Soccer;
    }
}