codeunit 70149352 "ICP CustomerAPIManagement"
{
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
        ShipViaList: Page "ICP ShipVia List";
        ShipVia: Record "ICP ShipVia";

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


    [EventSubscriber(ObjectType::Table, 1808, 'OnRegisterAssistedSetup', '', false, false)]
    local procedure "AggregatedAssistedSetup.OnRegisterAssistedSetup"(var TempAggregatedAssistedSetup: Record 1808 Temporary)
    var
        CustomerAPIControl: Record CustomerAPIControl;
    begin
        TempAggregatedAssistedSetup.AddExtensionAssistedSetup(PAGE::"ICP AmazonAPIWizard",
                                                              'Set up AmazonAPI Information',
                                                              TRUE,
                                                              CustomerAPIControl.RECORDID,
                                                              GetAmazonAPISetupStatus(TempAggregatedAssistedSetup),
                                                              '');

        TempAggregatedAssistedSetup.AddExtensionAssistedSetup(PAGE::"ICP EbayAPIWizard",
       'Set up EbayAPI Information',
       TRUE,
       CustomerAPIControl.RECORDID,
       GetEbayAPISetupStatus(TempAggregatedAssistedSetup),
       '');
    end;

    local procedure GetAmazonAPISetupStatus(AggregatedAssistedSetup: Record "Aggregated Assisted Setup"): Integer
    var
        CustomerAPIControl: Record CustomerAPIControl;
    begin
        if CustomerAPIControl.Get('AmazonAPI') then
            AggregatedAssistedSetup.Status := AggregatedAssistedSetup.Status::Completed
        else
            AggregatedAssistedSetup.Status := AggregatedAssistedSetup.Status::"Not Started";

        exit(AggregatedAssistedSetup.Status);
    end;

    local procedure GetEbayAPISetupStatus(AggregatedAssistedSetup: Record "Aggregated Assisted Setup"): Integer
    var
        CustomerAPIControl: Record CustomerAPIControl;
    begin
        if CustomerAPIControl.Get('EbayAPI') then
            AggregatedAssistedSetup.Status := AggregatedAssistedSetup.Status::Completed
        else
            AggregatedAssistedSetup.Status := AggregatedAssistedSetup.Status::"Not Started";

        exit(AggregatedAssistedSetup.Status);
    end;

    // Custom Event Subsciption Example
    [EventSubscriber(ObjectType::XmlPort, xmlport::"ICP InventoryFeed", 'onStartAfterGetRecord', '', false, false)]
    local procedure onInventoryXMLPortStartAfterGetRecord(var Rec: Record Item; var sender: XmlPort "ICP InventoryFeed")
    begin

    end;


}