tableextension 50101 "Customer" extends Customer
{
    fields
    {
        #region -- Social Media Fields
        field(50110; Facebook; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Facebook';
        }

         field(50111; Twitter; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Twitter';
        }

         field(50112; Instagram; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Instagram';
        }
         field(50113; Linkedin; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Linkedin';
        }
        #endregion 

        #region -- Reward Fields
         field(10001; RewardPoints; Integer)
        {
            Caption = 'Reward Points';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        #endregion


    }

   
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

  
    
    
    
}