codeunit 70149352 "ICP CustomerAPIManagement"
{

    var
        Info: ModuleInfo;
        AlreadySetUpQst: Label 'The integration is already setup. \\Continue?';

    trigger OnRun()
    begin

    end;



    procedure OpenAmazonAPIWizard()
    var
        AmazonAPIWizard: Page "ICP AmazonAPIWizard";
    begin
        AmazonAPIWizard.Run();
    end;

    procedure OpenEbayAPIWizard()
    var
        EbayAPIWizard: Page "ICP EbayAPIWizard";
    begin
        EbayAPIWizard.Run();
    end;

    procedure OpenShipViaList(Source: Text[10])
    var
        ShipVia: Record "ICP ShipVia";
        ShipViaList: Page "ICP ShipVia List";


    begin
        case Source of
            'Amazon':
                ShipVia.SetRange(Source, ShipVia.Source::Amazon);
            'Ebay':
                ShipVia.SetRange(Source, ShipVia.Source::Ebay);

        end;

        ShipViaList.SetTableView(ShipVia);
        ShipViaList.Run();
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assisted Setup", 'OnRegister', '', true, true)]
    local procedure "Assisted Setup_OnRegister"()
    var
        AssistedSetup: Codeunit "Assisted Setup";
        AssistedSetupGroup: Enum "Assisted Setup Group";

    begin
        AssistedSetup.Add(GetAppId(), Page::"ICP AmazonAPIWizard", 'Set up your AmazonAPI Integration', AssistedSetupGroup::Extensions);
        AssistedSetup.Add(GetAppId(), Page::"ICP EbayAPIWizard", 'Set up your EbayAPI Integration', AssistedSetupGroup::Extensions);
        GetAmazonAPISetupStatus();
        GetEbayAPISetupStatus();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assisted Setup", 'OnReRunOfCompletedSetup', '', false, false)]
    local procedure OnReRunOfCompletedSetup(ExtensionId: Guid; PageID: Integer; var Handled: Boolean)
    begin
        if ExtensionId <> GetAppId() then
            exit;
        case PageID of
            Page::"ICP AmazonAPIWizard":
                begin
                    if Confirm(AlreadySetUpQst, true) then
                        Page.Run(PAGE::"ICP AmazonAPIWizard");
                    Handled := true;
                end;
            Page::"ICP EbayAPIWizard":
                begin
                    if Confirm(AlreadySetUpQst, true) then
                        Page.Run(PAGE::"ICP EbayAPIWizard");
                    Handled := true;
                end;
        end;
    end;

    local procedure GetAmazonAPISetupStatus()
    var
        CustomerAPIControl: Record "ICP CustomerAPIControl";
        AssistedSetup: Codeunit "Assisted Setup";
    begin
        if CustomerAPIControl.Get('AmazonAPI') then
            if (CustomerAPIControl.CustomerNo = '') or (CustomerAPIControl.OrderLocation = '') or
                (CustomerAPIControl.FulfillmentOrderNos = '') then
                AssistedSetup.ExistsAndIsNotComplete(GetAppId(), Page::"ICP AmazonAPIWizard")
            else
                AssistedSetup.Complete(GetAppId(), Page::"ICP AmazonAPIWizard")
        else
            AssistedSetup.Exists(GetAppId(), page::"ICP AmazonAPIWizard")

    end;

    local procedure GetEbayAPISetupStatus()
    var
        CustomerAPIControl: Record "ICP CustomerAPIControl";
        AssistedSetup: Codeunit "Assisted Setup";
    begin
        if CustomerAPIControl.Get('EbayAPI') then
            if (CustomerAPIControl.CustomerNo = '') or (CustomerAPIControl.OrderLocation = '') or
                (CustomerAPIControl.FulfillmentOrderNos = '') then
                AssistedSetup.ExistsAndIsNotComplete(GetAppId(), Page::"ICP EbayAPIWizard")
            else
                AssistedSetup.Complete(GetAppId(), Page::"ICP EbayAPIWizard")
        else
            AssistedSetup.Exists(GetAppId(), page::"ICP EbayAPIWizard")

    end;

    local procedure GetAppId(): Guid
    var
        EmptyGuid: Guid;
    begin
        if Info.Id() = EmptyGuid then
            NavApp.GetCurrentModuleInfo(Info);
        exit(Info.Id());
    end;

    // Custom Event Subsciption Example
    [EventSubscriber(ObjectType::XmlPort, xmlport::"ICP InventoryFeed", 'onStartAfterGetRecord', '', false, false)]
    local procedure onInventoryXMLPortStartAfterGetRecord(var Rec: Record Item; var sender: XmlPort "ICP InventoryFeed")
    begin

    end;


}