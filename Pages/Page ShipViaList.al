page 70149360 "ICP ShipVia List"
{
    PageType = List;
    SourceTable = "ICP ShipVia";
    CaptionML = ENU='CustomerAPI ShipVia Translations';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ShipVia; ShipVia)
                {
                    ApplicationArea = All;
                }
                field(ShippingAgentCode; ShippingAgentCode)
                {
                    ApplicationArea = All;
                }
                field(ServiceCode; ServiceCode)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
        }
    }
}