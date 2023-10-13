page 50120 "Customer Overview List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Overview";
    Editable = false;
    
    layout
    {
        area(Content)
        {
          repeater(General){
             field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Source Code field.';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                    ApplicationArea = All;
                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ToolTip = 'Specifies the value of the LastRunDate field.';
                    ApplicationArea = All;
                }
          }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ImportRecords)
            {
                Caption = 'Import Records';
                Image= Import;
                ApplicationArea = All;
                
                trigger OnAction()
                var
                UpdateCustomerOverview: Codeunit "Customer Overview Mgmt";
                begin
                   UpdateCustomerOverview.Run(); 
                end;
            }
        }
    }

}