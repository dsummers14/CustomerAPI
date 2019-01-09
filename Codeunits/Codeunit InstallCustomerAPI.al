codeunit 70149351 "ICP InstallCustomerAPI"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var

    begin
        // Using xml file instead       CreateWebService(4,'ICP CustomerAPI',70149350);     
    end;

    var

    local procedure CreateWebService(pObjectType: Option ,,,,,Codeunit,,,Page,Query;
     pServiceName: text; pObjectID: Integer)

    var
        WebService: Record "Tenant Web Service";

    begin
        WebService.SetFilter("Object Type", format(pObjectType));
        WebService.SetFilter("Service Name", pServiceName);

        if not WebService.FindFirst() then begin
            WebService.Init();
            WebService."Object ID" := pObjectID;
            WebService."Object Type" := pObjectType;
            WebService."Service Name" := pServiceName;
            WebService.Published := true;
            WebService.Insert(true);
        end;
    end;

    
}
