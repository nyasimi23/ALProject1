codeunit 50131 "Notification Company Info"
{
    
    procedure ShowCompanyWizard(TheNotification: Notification)
    var
    begin
        Page.Run(Page::"Company Info Wizard");
    end;


    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnOpenPageEvent', '', false, false)]
    local procedure CheckInfoOnOpenSalesOrder(var Rec: Record "Sales Header")
    var
        CompanyInformation: Record "Company Information";
        CompanyNotification: Notification;
    begin
        if CompanyInformation.Get() then
            if (CompanyInformation.Name <> '') and
               (CompanyInformation."E-mail" <> '') then
                exit;

        CompanyNotification.Id := CreateGuid();
        CompanyNotification.Message := 'Company Information is missing.';
        CompanyNotification.AddAction('Open Company Information',
                                      Codeunit::"Notification Company Info",
                                      'ShowCompanyInfoWizard');
        CompanyNotification.Send();
    end;
}