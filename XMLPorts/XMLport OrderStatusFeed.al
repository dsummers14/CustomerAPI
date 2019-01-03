xmlport 70149351 "ICP OrderStatusFeed"
{
    // version CustomerAPI

    UseDefaultNamespace = true;

    schema
    {
        textelement(Orders)
        {
            tableelement("<sales header>";"Sales Header")
            {
                XmlName = 'Order';
                fieldelement(OrderNo;"<Sales Header>"."No.")
                {
                }
                fieldelement(Status;"<Sales Header>".Status)
                {
                }
                fieldelement(OrderDate;"<Sales Header>"."Order Date")
                {
                }
                fieldelement(ShippedDate;"<Sales Header>"."Shipment Date")
                {
                }

                trigger OnPreXmlItem();
                begin
                    "<Sales Header>".SETFILTER("<Sales Header>"."Sell-to Customer No.",gCustomerAPIControl.CustomerNo);
                    if gOrderFilter <> '' then
                               "<Sales Header>".SETFILTER("<Sales Header>"."No.",gOrderFilter);
                    if gStatusFilter <> '' then
                               "<Sales Header>".SETFILTER("<Sales Header>".Status,gStatusFilter);
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
        gApiIdentifier : Code[36];
        gCustomerAPIControl : Record "ICP CustomerAPIControl";
        gOrderFilter : Text[255];
        gStatusFilter : Text[255];

    procedure SetParameters(pTransferID : Code[36];pOrderFilter : Text[255];pStatusFilter : Text[255]);
    begin
        gApiIdentifier := pTransferID;
        gOrderFilter := pOrderFilter;
        gStatusFilter := pStatusFilter;
    end;
}

