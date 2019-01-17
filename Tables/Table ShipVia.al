table 70149351 "ICP ShipVia"
{
    // version CustomerAPI


    fields
    {
        field(1; Source; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Amazon,Ebay;
            OptionCaption = 'Amazon,Ebay';
        }
        field(2; ShipVia; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(3; ShippingAgentCode; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent".Code;
        }
        field(4; ServiceCode; code[10])
        {
            DataClassification = CustomerContent;
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

