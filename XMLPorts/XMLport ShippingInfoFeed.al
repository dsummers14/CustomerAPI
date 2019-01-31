xmlport 70149353 "ICP ShippingInfoFeed"
{
    UseDefaultNamespace = true;
    Direction = Export;

    schema
    {
        textelement(ShippingInfos)
        {
            tableelement(ShippingInfo; "ICP ShippingInfo")
            {
                MinOccurs = Zero;
                XmlName = 'ShippingInfo';
                SourceTableView = where (Processed = filter (false));

                fieldelement(OrderNumber; ShippingInfo.OrderNumber)
                {
                    MaxOccurs = Once;
                }
                fieldelement(TrackingNumber; ShippingInfo.TrackingNumber)
                {
                    MaxOccurs = Once;
                }
                fieldelement(DateShipped; ShippingInfo.DateShipped)
                {
                    MaxOccurs = Once;
                }
                fieldelement(Carrier; ShippingInfo.Carrier)
                {
                    MaxOccurs = Once;
                }
                fieldelement(Service; ShippingInfo.Service)
                {
                    MaxOccurs = Once;
                }
                fieldelement(CustomerOrderNumber; ShippingInfo.CustomerOrderNumber)
                {
                    MaxOccurs = Once;
                }
                fieldelement(CustomerNumber; ShippingInfo.CustomerNumber)
                {
                    MaxOccurs = Once;
                }
                fieldelement(MarketPlaceOrderNumber; ShippingInfo.MarketPlaceOrderNumber)
                {
                    MaxOccurs = Once;
                }
                tableelement(ShippedItems; "ICP ShippingItem")
                {
                    MaxOccurs = Once;
                    XmlName = 'ShippedItems';
                    LinkTable = "ShippingInfo";
                    LinkFields = "TrackingNumber" = field ("TrackingNumber");
                    
                    textelement(ShippedItem)
                    {
                        MinOccurs = Zero;
                        fieldelement(ItemNumber; ShippedItems.ItemNumber)
                        {
                            MaxOccurs = Once;
                        }
                        fieldelement(QuantityShipped; ShippedItems.QuantityShipped)
                        {
                            MaxOccurs = Once;
                        }
                        fieldelement(MarketPlaceItemNumber; ShippedItems.MarketPlaceItemNumber)
                        {
                            MaxOccurs = Once;
                        }
                    }
                }
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
        gCustomerAPIControl.GET(gCustomerApiIdentifier);
    end;

    var
         gCustomerAPIControl: Record "ICP CustomerAPIControl";
        gCustomerApiIdentifier: Code[36];
       
    procedure SetParameters(pCustomerAPIIdentifier: Code[35]);
    begin
        gCustomerApiIdentifier := pCustomerAPIIdentifier;
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

