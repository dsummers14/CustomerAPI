page 70149351 CustomerAPIControl
{
    // version CustomerAPI

    SourceTable = CustomerAPIControl;

    layout
    {
        area(content)
        {
            field(APIIdentifier;APIIdentifier)
            {
               CaptionClass = 'API Identifier';
               ApplicationArea = All; 
            }
            field(CustomerNo;CustomerNo)
            {
                ApplicationArea = All;
            }
            field(ItemCategoryFilter;ItemCategoryFilter)
            {
            }
            field(VendorFilter;VendorFilter)
            {
                ApplicationArea = All;
            }
            field(AutoReleaseOrder;AutoReleaseOrder)
            {
            }
            field(ItemIEGroupFilter;ItemIEGroupFilter)
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
            field(InventoryPostingGroupFilter;InventoryPostingGroupFilter)
            {
                ApplicationArea = All;
            }
            field(FulfillmentOrderNos;FulfillmentOrderNos)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

