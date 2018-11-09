page 70149353 "CustomerAPI Control"
{
    // version CustomerAPI

    PageType = List;
    SourceTable = CustomerAPIControl;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(APIIdentifier;APIIdentifier)
                {
                }
                field(CustomerNo;CustomerNo)
                {
                }
                field(ItemCategoryFilter;ItemCategoryFilter)
                {
                }
                field(VendorFilter;VendorFilter)
                {
                }
                field(AutoReleaseOrder;AutoReleaseOrder)
                {
                }
                field(ItemIEGroupFilter;ItemIEGroupFilter)
                {
                }
                field(IncludeInactiveItems;IncludeInactiveItems)
                {
                }
                field(ExcludeDropShipOnlyItems;ExcludeDropShipOnlyItems)
                {
                }
                field(SendOrderConfirmation;SendOrderConfirmation)
                {
                }
                field(LocationFilter;LocationFilter)
                {
                }
                field(OrderLocation;OrderLocation)
                {
                }
                field(FulfillmentOrderNos;FulfillmentOrderNos)
                {
                }
            }
        }
    }

    actions
    {
    }
}

