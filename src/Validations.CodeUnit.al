codeunit 50104 "Validations"
{
    trigger OnRun()
    begin
        
    end;

    local procedure CheckForPlusSign(TextToVerify: Text)
    var
        myInt: Integer;
    begin
        if TextToVerify.Contains('+') then
            Message('A + sign has been found.');
    end;
    
   
}