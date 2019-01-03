xmlport 70149353 "ICP ShippingInfoFeed"
{
    // version CustomerAPI

    UseDefaultNamespace = true;

    schema
    {
        textelement(ShippingInfos)
        {
            textelement(ShippingInfo)
            {
                MinOccurs = Zero;
                textelement(OrderNumber)
                {
                    MaxOccurs = Once;
                }
                textelement(TrackingNumber)
                {
                    MaxOccurs = Once;
                }
                textelement(DateShipped)
                {
                    MaxOccurs = Once;
                }
                textelement(Carrier)
                {
                    MaxOccurs = Once;
                }
                textelement(Service)
                {
                    MaxOccurs = Once;
                }
                textelement(CustomerOrderNumber)
                {
                    MaxOccurs = Once;
                }
                textelement(CustomerNo)
                {
                    MaxOccurs = Once;
                }
                textelement(ShippedItems)
                {
                    MaxOccurs = Once;
                    textelement(ShippedItem)
                    {
                        MinOccurs = Zero;
                        textelement(MarketItemNo)
                        {
                            MaxOccurs = Once;
                        }
                        textelement(Quantity)
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
        gCustomerApiIdentifier : Code[36];
        gCustomerAPIControl : Record "ICP CustomerAPIControl";

    procedure SetParameters(pCustomerAPIIdentifier : Code[35]);
    begin
        gCustomerApiIdentifier := pCustomerAPIIdentifier;
    end;
}

