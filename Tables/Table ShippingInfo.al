table 70149352 "ICP ShippingInfo"
{

    fields
    {
        field(1; OrderNumber; Code[20])
        {
            TableRelation = "Sales Header"."No." where ("Document Type" = filter ('1'));
        }
        field(2; TrackingNumber; Text[30])
        {
        }
        field(3; DateShipped; date)
        { }
        field(4; Carrier; Text[30])
        { }
        field(5; Service; Text[30])
        { }
        field(6; CustomerOrderNumber; Text[30])
        { }
        field(7; CustomerNumber; Code[10])
        {
            TableRelation = Customer."No.";
        }
        field(8; FreightCost; Decimal)
        { }
        field(9; MarketPlaceOrderNumber; Text[30])
        { }
        field(10; Processed; Boolean)
        {
            InitValue = false;
        }
    }

    keys
    {
        key(PK; OrderNumber, TrackingNumber)
        {
            Clustered = true;
        }
    }

    var

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}