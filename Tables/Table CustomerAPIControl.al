table 70149350 CustomerAPIControl
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
        field(21;ItemIEGroupFilter;Text[250])
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
        field(27;RequestCount;Integer)
        {
        }
        field(28;LastRequestDateTime;DateTime)
        {
        }
        field(29;MaximumRequests;Integer)
        {
        }
        field(30;RefreshTimePeriod;Integer)
        {
        }
        field(31;RefreshRate;Integer)
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
        field(35;FTPHost;Text[250])
        {
        }
        field(36;FTPPort;Integer)
        {
        }
        field(37;FTPUser;Text[50])
        {
        }
        field(38;FTPPassword;Text[50])
        {
        }
        field(39;OrderFileNameMask;Text[30])
        {
        }
        field(40;FTPRemoteDirectory;Text[250])
        {
        }
        field(41;InventoryFeedFileName;Text[50])
        {
        }
        field(42;ShippingInfoFeedFileName;Text[50])
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

