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
                    CaptionML = ENU = 'Order Number';
                }
                field(TrackingNumber; TrackingNumber)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Tracking Number';
                }
                field(DateShipped; DateShipped)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Order Number';
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
                    CaptionML = ENU = 'Customer Order Number';
                }
                field(MarketPlaceOrderNumber; MarketPlaceOrderNumber)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Market Place Order Number';
                }
                field(FreightCost; FreightCost)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Freight Cost';
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}