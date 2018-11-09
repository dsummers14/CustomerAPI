table 70149351 ShipVia
{
    // version CustomerAPI


    fields
    {
        field(1;ShipVia;Code[20])
        {
        }
        field(2;ShippingAgentCode;Code[10])
        {
            TableRelation = "Shipping Agent".Code;
        }
    }

    keys
    {
        key(Key1;ShipVia)
        {
        }
    }

    fieldgroups
    {
    }
}

