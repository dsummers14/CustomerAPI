page 70149353 "ICP CustomerAPI Control List"
{

    PageType = List;
    SourceTable = "ICP CustomerAPIControl";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(APIIdentifier;APIIdentifier)
                {
                    ApplicationArea = All;
                }
                field(CustomerNo;CustomerNo)
                {
                    ApplicationArea = All;
                }
                field(ItemCategoryFilter;ItemCategoryFilter)
                {
                    ApplicationArea = All;
                }
                field(VendorFilter;VendorFilter)
                {
                    ApplicationArea = All;
                }
                field(AutoReleaseOrder;AutoReleaseOrder)
                {
                    ApplicationArea = All;
                }
                field(IncludeInactiveItems;IncludeInactiveItems)
                {
                    ApplicationArea = All;
                }
                field(ExcludeDropShipOnlyItems;ExcludeDropShipOnlyItems)
                {
                    ApplicationArea = All;
                }
                field(SendOrderConfirmation;SendOrderConfirmation)
                {
                    ApplicationArea = All;
                }
                field(LocationFilter;LocationFilter)
                {
                    ApplicationArea = All;
                }
                field(OrderLocation;OrderLocation)
                {
                    ApplicationArea = All;
                }
                field(FulfillmentOrderNos;FulfillmentOrderNos)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

