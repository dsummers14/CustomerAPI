query 70149350 ICPTermsCode
{
    QueryType = Normal;
    elements
    {
        dataitem(Payment_Terms; "Payment Terms")
        {
            column(Code; Code)
            {

            }
            column(Description; Description)
            {

            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}