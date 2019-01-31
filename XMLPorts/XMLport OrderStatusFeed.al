xmlport 70149351 "ICP OrderStatusFeed"
{
    // version CustomerAPI

    UseDefaultNamespace = true;

    schema
    {
        textelement(Orders)
        {
            tableelement(SalesHeader; "Sales Header")
            {
                XmlName = 'Order';
                fieldelement(OrderNo; SalesHeader."No.")
                {
                }
                fieldelement(Status; SalesHeader.Status)
                {
                }
                fieldelement(OrderDate; SalesHeader."Order Date")
                {
                }
                fieldelement(ShippedDate; SalesHeader."Shipment Date")
                {
                }

                trigger OnPreXmlItem();
                begin
                    SalesHeader.SETFILTER(SalesHeader."Sell-to Customer No.", gCustomerAPIControl.CustomerNo);
                    if gOrderFilter <> '' then
                        SalesHeader.SETFILTER(SalesHeader."No.", gOrderFilter);
                    if gStatusFilter <> '' then
                        SalesHeader.SETFILTER(SalesHeader.Status, gStatusFilter);

                    onEndPreXMLItem(SalesHeader);
                end;

                trigger OnAfterGetRecord()
                var

                begin
                    onStartAfterGetRecord(SalesHeader);

                    onEndAfterGetRecord(SalesHeader);
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPreXmlPort();
    begin
        gCustomerAPIControl.GET(gApiIdentifier);
    end;

    var
        gCustomerAPIControl: Record "ICP CustomerAPIControl";
        gApiIdentifier: Code[36];       
        gOrderFilter: Text[255];
        gStatusFilter: Text[255];

    procedure SetParameters(pTransferID: Code[36]; pOrderFilter: Text[255]; pStatusFilter: Text[255]);
    begin
        gApiIdentifier := pTransferID;
        gOrderFilter := pOrderFilter;
        gStatusFilter := pStatusFilter;
    end;

    [IntegrationEvent(true, true)]
    local procedure onStartAfterGetRecord(var Rec: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure onEndAfterGetRecord(Rec: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure onEndPreXMLItem(Rec: Record "Sales Header")
    begin
    end;


}

