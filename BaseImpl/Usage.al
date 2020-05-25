pageextension 50100 CustPageExt extends "Customer List"
{
    actions
    {
        addfirst(General)
        {
            action(SportsEvaluation)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SportsEvaluationMgmt.GetHandler(SportsEvaluation);
                    Message(SportsEvaluation.GetEvaluation());
                end;
            }
        }
    }

    var
        SportsEvaluation: Interface "Sports Evaluation";
        SportsEvaluationMgmt: Codeunit "SportsEvaluation Mgmt";
}