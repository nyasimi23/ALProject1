pageextension 50102 "Item Card Picture Extension" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
        addlast("Functions")
{
        action(ImportItemPicture)
        {
            ApplicationArea = All;
            Caption = 'Import Item Picture';
            
            trigger OnAction()
             var ImageManagement : Codeunit "Image Management";
            begin
                ImageManagement.ImportItemPicture();
            end;
        }
     }
    }
    
    
}