table 70149353 "ICP ShippingItem"
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
        field(3; ItemNumber; Code[20])
        {
            TableRelation = Item."No.";
        }
        field(4; QuantityShipped; Integer)
        { }
        field(5; MarketPlaceItemNumber; Text[30])
        { }
    }

    keys
    {
        key(PK; OrderNumber, TrackingNumber, ItemNumber)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

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