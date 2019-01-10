table 70149351 "ICP ShipVia"
{
    // version CustomerAPI


    fields
    {
        field(1; Source; Option)
        {
            OptionMembers = Amazon,Ebay;
            OptionCaptionML = ENU = 'Amazon,Ebay';
        }
        field(2; ShipVia; Code[30])
        {
        }
        field(3; ShippingAgentCode; Code[10])
        {
            TableRelation = "Shipping Agent".Code;
        }
        field(4; ServiceCode; code[10])
        {
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code" = FIELD (ShippingAgentCode));
        }
    }

    keys
    {
        key(PK; Source, ShipVia)
        {
        }
    }

    fieldgroups
    {
    }
}

