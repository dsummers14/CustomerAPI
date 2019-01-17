codeunit 70149350 "ICP CustomerAPIWebServices"
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

    procedure GetShippingInfoFeed(pCustomerAPIIdentifier: Code[35]; var pXMLPort: XMLport "ICP ShippingInfoFeed");
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
        if SalesLine.GET(pDocumentType, pDocumentNo, pLineNo) then
            if (pQtyToReserve <> 0) then begin
                ReservMgt.SetSalesLine(SalesLine);
                ReservMgt.AutoReserve(FullAutoReservation, '', SalesLine."Shipment Date", pQtyToReserve, 0); //08/24/17 dRS -Needs changed
                SalesLine.MODIFY();
            end;       
    end;

    procedure GetNextNoSeriesNo(NoSeriesCode: Code[20]) NextNumber: Code[20];
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        NoSeriesMgt.InitSeries(NoSeriesCode, '', TODAY(), NextNumber, NoSeriesCode);
    end;


    
}

