table 70149350 "ICP CustomerAPIControl"
{
    // version CustomerAPI


    fields
    {
        field(1;APIIdentifier;Code[36])
        {
            CaptionClass = 'API Identifier';
        }
        field(3;CustomerNo;Code[10])
        {
            TableRelation = Customer."No.";
        }
        field(15;ItemCategoryFilter;Text[250])
        {
        }
        field(16;VendorFilter;Text[250])
        {
        }
        field(18;EmailErrorsTo;Text[250])
        {
        }
        field(19;AutoReleaseOrder;Boolean)
        {
        }
        field(22;IncludeInactiveItems;Boolean)
        {
        }
        field(23;ExcludeDropShipOnlyItems;Boolean)
        {
        }
        field(26;SendOrderConfirmation;Boolean)
        {
        }
        field(32;LocationFilter;Text[250])
        {
        }
        field(33;OrderLocation;Code[10])
        {
            TableRelation = Location.Code;
        }
        field(34;InventoryPostingGroupFilter;Text[250])
        {
        }
        field(43;MonthsToArchive;Integer)
        {
        }
        field(44;FulfillmentOrderNos;Code[10])
        {
            TableRelation = "No. Series".Code;
        }
    }

    keys
    {
        key(Key1;APIIdentifier)
        {
        }
    }

    fieldgroups
    {
    }
}

