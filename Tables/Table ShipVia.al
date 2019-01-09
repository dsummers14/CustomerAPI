table 70149351 "ICP ShipVia"
{
    // version CustomerAPI


    fields
    {
        field(1;ShipVia;Code[30])
        {
        }
        field(2;ShippingAgentCode;Code[10])
        {
            TableRelation = "Shipping Agent".Code;
        }
        field(3; ServiceCode; code[10])
        {
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code" = FIELD(ShippingAgentCode));
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

