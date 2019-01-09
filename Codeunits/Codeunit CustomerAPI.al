codeunit 70149350 "ICP CustomerAPI"
{
    // version CustomerAPI


    trigger OnRun();
    begin
    end;

    procedure GetInventoryFeed2(pCustomerAPIIdentifier: Code[36]; var pXMLPort: XMLport "ICP InventoryFeed"; pItemFilter: Text[255]);
    begin
        pXMLPort.SetParameters(pCustomerAPIIdentifier, pItemFilter);
    end;

    procedure GetOrderStatusFeed(pCustomerAPIIdentifier: Code[36]; var pXMLPort: XMLport "ICP OrderStatusFeed"; pOrderFilter: Text[255]; pStatusFilter: Text[255]);
    begin
        pXMLPort.SetParameters(pCustomerAPIIdentifier, pOrderFilter, pStatusFilter);
    end;

    procedure GetShippingInfoFeed(pCustomerAPIIdentifier: Code[50]; var pXMLPort: XMLport "ICP ShippingInfoFeed");
    begin
        pXMLPort.SetParameters(pCustomerAPIIdentifier);
    end;

    procedure GetPriceFeed(var pXMLPort: XMLport "ICP Prices"; pAPIIdentifier: Code[36]; pCustomerNo: Code[10]; pVendorNo: Code[10]; pItemFilter: Text[255]);
    begin
        pXMLPort.SetParameters(pAPIIdentifier, pCustomerNo, pVendorNo, pItemFilter);
    end;

    procedure GetStatus() pStatus: Text[30];
    begin
        pStatus := 'GREEN';
    end;

    procedure AutoReserveSalesLine(pDocumentType: Option; pDocumentNo: Code[20]; pLineNo: Integer; pQtyToReserve: Decimal);
    var
        SalesLine: Record "Sales Line";
        ReservMgt: Codeunit "Reservation Management";
        FullAutoReservation: Boolean;
    begin
        if SalesLine.GET(pDocumentType, pDocumentNo, pLineNo) then begin
            if (pQtyToReserve <> 0) then begin
                ReservMgt.SetSalesLine(SalesLine);
                ReservMgt.AutoReserve(FullAutoReservation, '', SalesLine."Shipment Date", pQtyToReserve, 0); //08/24/17 dRS -Needs changed
                SalesLine.MODIFY;
            end;
        end;
    end;

    procedure GetNextNoSeriesNo(NoSeriesCode: Code[10]) NextNumber: Code[20];
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        NoSeriesMgt.InitSeries(NoSeriesCode, '', TODAY, NextNumber, NoSeriesCode);
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

