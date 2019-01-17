page 70149365 "ICP ShippingInfo"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ICP ShippingInfo";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(OrderNumber; OrderNumber)
                {
                    ApplicationArea = All;
                    Caption  = 'Order Number';
                }
                field(TrackingNumber; TrackingNumber)
                {
                    ApplicationArea = All;
                    Caption  = 'Tracking Number';
                }
                field(DateShipped; DateShipped)
                {
                    ApplicationArea = All;
                    Caption  = 'Order Number';
                }
                field(Carrier; Carrier)
                {
                    ApplicationArea = All;
                }
                field(Service; Service)
                {
                    ApplicationArea = All;
                }
                field(CustomerOrderNumber; CustomerOrderNumber)
                {
                    ApplicationArea = All;
                    Caption  = 'Customer Order Number';
                }
                field(MarketPlaceOrderNumber; MarketPlaceOrderNumber)
                {
                    ApplicationArea = All;
                    Caption  = 'Market Place Order Number';
                }
                field(FreightCost; FreightCost)
                {
                    ApplicationArea = All;
                    Caption  = 'Freight Cost';
                }
                field(Processed; Processed)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

        }
    }

    var
        
}