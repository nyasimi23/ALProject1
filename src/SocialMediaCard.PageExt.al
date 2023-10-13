pageextension 50103 CustomerCard extends "Customer Card"
{
    layout
    {
        #region -- social media  
         addafter(General){
            group(SocialMedia){
                Caption = 'Social Media';

                field(Facebook; Rec.Facebook)
                {
                    ApplicationArea = All;
                }

                 field(Twitter; Rec.Twitter)
                {
                    ApplicationArea = All;
                }

                field(Instagram; Rec.Instagram)
                {
                    ApplicationArea = All;
                } 
                field(Linkedin; Rec.Linkedin)
                {
                    ApplicationArea = All;
                }
            }
         }
        #endregion 
          
        #region --rewards 
          addafter(Name) 
         { 
             field(RewardLevel; RewardLevel) 
             { 
                 ApplicationArea = All; 
                 Caption = 'Reward Level'; 
                 Description = 'Reward level of the customer.'; 
                 ToolTip = 'Specifies the level of reward that the customer has at this point.';
                 Editable = false; 
             } 

             field(RewardPoints; Rec.RewardPoints) 
             { 
                 ApplicationArea = All; 
                 Caption = 'Reward Points'; 
                 Description = 'Reward points accrued by customer'; 
                 ToolTip = 'Specifies the total number of points that the customer has at this point.';
                 Editable = false;
             }
    }
            #endregion
    
    }

      actions
    {
        // Add changes to page actions here
        addAfter("F&unctions"){
            action(UpdateCreditLimit)
            {
                ApplicationArea = All;
                Caption = 'Update Credit Limit';
                ToolTip = 'Update Credit Limit';
                Image = CalculateCost;
                
                trigger OnAction()
                begin
                    CallUpdateCreditLimit();
                end;
            }
        }
    }
    
     trigger OnAfterGetRecord(); 
     var 
         CustomerRewardsMgtExt: Codeunit "Customer Rewards Ext Mgt"; 
     begin 
         // Get the reward level associated with reward points 
         RewardLevel := CustomerRewardsMgtExt.GetRewardLevel(Rec.RewardPoints); 
     end; 

    

    procedure UpdateCreditLimit(var NewCreditLimit: Decimal)
    begin
        NewCreditLimit := Round(NewCreditLimit, 10000);
        Rec.Validate("Credit Limit (LCY)", NewCreditLimit);
        Rec.Modify();
    end;


    procedure CalculateCreditLimit(): Decimal
    var
        Customer: Record Customer;
    begin
        Customer := Rec;
        Customer.SetRange("Date Filter", CalcDate('<-12M>', WorkDate()), WorkDate());
        Customer.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(Round(Customer."Sales (LCY)" * 0.5));
    end;



    local procedure CallUpdateCreditLimit()
    var
        CreditLimitCalculated, CreditLimitActual : Decimal;
    begin
        CreditLimitCalculated := CalculateCreditLimit();
        if CreditLimitCalculated = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
            exit;
        end;

        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false, Rec.FieldCaption("Credit Limit (LCY)"), CreditLimitCalculated) then
                exit;

        CreditLimitActual := CreditLimitCalculated;
        UpdateCreditLimit(CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            Message(CreditLimitROundedTxt, CreditLimitActual);
    end;




    var 
        RewardLevel: Text;
        AreYouSureQst: Label 'Are you sure that you want to set the %1 to %2?', Comment = '%1 is Credit Limit caption and %2 is the new Credit Limit value.';
        CreditLimitRoundedTxt: Label 'The credit limit was rounded to %1 to comply with company policies.', Comment = '%1 is new Credit Limit value';
        CreditLimitUpToDateTxt: Label 'The credit limit is up to date.';
}