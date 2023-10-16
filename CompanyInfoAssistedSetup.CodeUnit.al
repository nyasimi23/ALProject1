codeunit 50135 "Company Info Assisted Setup"
{
   [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', true, true)]
   local procedure OnRegisterAssistedSetup()
    var
	        AssistedSetup: Codeunit "Guided Experience";
	        GuidedExperienceType: Enum "Guided Experience Type";
	        AssistedSetupGroup: Enum "Assisted Setup Group";
	        VideoCategory: Enum "Video Category";
	    begin
	        if not AssistedSetup.Exists(GuidedExperienceType::"Assisted Setup",
	                                    ObjectType::Page,
	                                    Page::"Company Info Wizard") then
	            AssistedSetup.InsertAssistedSetup(
	                                             'Set up your company',
	                                             'Set up your company',
	                                             'Set up your company',
	                                             1,
	                                             ObjectType::Page,
	                                             Page::"Company Info Wizard",
	                                             AssistedSetupGroup::GettingStarted,
	                                             '',
	                                             VideoCategory::GettingStarted,
	                                             '');
	    end;
}