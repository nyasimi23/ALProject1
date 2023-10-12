tableextension 50101 "CRONUS Social Media Table Ext" extends Customer
{
    fields
    {
        // Add changes to table fields here
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

         field(10001; RewardPoints; Integer)
        {
            Caption = 'Reward Points';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
    }
    
    
    
}