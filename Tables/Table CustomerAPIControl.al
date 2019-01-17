table 70149350 CustomerAPIControl
{
    // version CustomerAPI


    fields
    {
        field(1;APIIdentifier;Code[36])
        {
            CaptionClass = 'API Identifier';
            DataClassification = CustomerContent;
        }
        field(3;CustomerNo;Code[10])
        {
            TableRelation = Customer."No.";
            DataClassification = CustomerContent;
        }
        field(15;ItemCategoryFilter;Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(16;VendorFilter;Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(18;EmailErrorsTo;Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(19;AutoReleaseOrder;Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(22;IncludeInactiveItems;Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(23;ExcludeDropShipOnlyItems;Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(26;SendOrderConfirmation;Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(32;LocationFilter;Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(33;OrderLocation;Code[10])
        {
            TableRelation = Location.Code;
            DataClassification = CustomerContent;
        }
        field(34;InventoryPostingGroupFilter;Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(43;MonthsToArchive;Integer)
        {
            DataClassification = CustomerContent;
        }
        field(44;FulfillmentOrderNos;Code[10])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
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

