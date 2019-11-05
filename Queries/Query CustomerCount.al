Query 70149351 ICPCustomerCount
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {


            column(Count)
            {
                Method = Count;
            }

        }
    }

    var

    trigger OnBeforeOpen()
    begin

    end;
}