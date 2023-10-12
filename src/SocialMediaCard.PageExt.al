pageextension 50103 "CRONUS Social Media Card" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
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
    
  
}


  trigger OnAfterGetRecord(); 
     var 
         CustomerRewardsMgtExt: Codeunit "Customer Rewards Ext Mgt"; 
     begin 
         // Get the reward level associated with reward points 
         RewardLevel := CustomerRewardsMgtExt.GetRewardLevel(Rec.RewardPoints); 
     end; 

     var 
         RewardLevel: Text; 
}