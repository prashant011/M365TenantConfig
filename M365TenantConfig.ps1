# Generated with Microsoft365DSC version 1.21.915.1
# For additional information on how to use Microsoft365DSC, please visit https://aka.ms/M365DSC
param (
    [parameter()]
    [System.Management.Automation.PSCredential]
    $GlobalAdminAccount
)

Configuration M365TenantConfig
{
    param (
        [parameter()]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    if ($null -eq $GlobalAdminAccount)
    {
        <# Credentials #>
        $Credsglobaladmin = Get-Credential -Message "Global Admin credentials"

    }
    else
    {
        $Credsglobaladmin = $GlobalAdminAccount
    }

    $OrganizationName = $Credsglobaladmin.UserName.Split('@')[1]
    Import-DscResource -ModuleName 'Microsoft365DSC' -ModuleVersion '1.21.915.1'

    Node localhost
    {
        EXOTransportRule b79012a2-6dc3-4d23-a3cf-81cb3c095f9c
        {
            ApplyOME                                  = $False;
            ApplyRightsProtectionTemplate             = "Do Not Forward";
            AttachmentHasExecutableContent            = $False;
            AttachmentIsPasswordProtected             = $False;
            AttachmentIsUnsupported                   = $False;
            AttachmentProcessingLimitExceeded         = $False;
            DeleteMessage                             = $False;
            Ensure                                    = "Present";
            ExceptIfAttachmentHasExecutableContent    = $False;
            ExceptIfAttachmentIsPasswordProtected     = $False;
            ExceptIfAttachmentIsUnsupported           = $False;
            ExceptIfAttachmentProcessingLimitExceeded = $False;
            ExceptIfHasNoClassification               = $False;
            ExceptIfHasSenderOverride                 = $False;
            GlobalAdminAccount                        = $Credsglobaladmin;
            HasNoClassification                       = $False;
            HasSenderOverride                         = $False;
            Mode                                      = "Enforce";
            ModerateMessageByManager                  = $False;
            Name                                      = "Protect with OMEv2";
            Priority                                  = 0;
            RemoveOME                                 = $False;
            RemoveOMEv2                               = $False;
            RouteMessageOutboundRequireTls            = $False;
            RuleErrorAction                           = "Ignore";
            RuleSubType                               = "None";
            SenderAddressLocation                     = "Header";
            StopRuleProcessing                        = $False;
            SubjectOrBodyContainsWords                = @("OMEv2");
        }
        EXOTransportRule 546c3032-e0ce-4946-a990-de6ea1b62251
        {
            ApplyOME                                  = $False;
            AttachmentHasExecutableContent            = $False;
            AttachmentIsPasswordProtected             = $False;
            AttachmentIsUnsupported                   = $False;
            AttachmentProcessingLimitExceeded         = $False;
            DeleteMessage                             = $False;
            Ensure                                    = "Present";
            ExceptIfAttachmentHasExecutableContent    = $False;
            ExceptIfAttachmentIsPasswordProtected     = $False;
            ExceptIfAttachmentIsUnsupported           = $False;
            ExceptIfAttachmentProcessingLimitExceeded = $False;
            ExceptIfHasNoClassification               = $False;
            ExceptIfHasSenderOverride                 = $False;
            From                                      = @("LidiaH@$OrganizationName");
            GlobalAdminAccount                        = $Credsglobaladmin;
            HasNoClassification                       = $False;
            HasSenderOverride                         = $False;
            Mode                                      = "Enforce";
            ModerateMessageByManager                  = $True;
            Name                                      = "Moderation for Lidia Holloway";
            Priority                                  = 1;
            RemoveOME                                 = $False;
            RemoveOMEv2                               = $False;
            RouteMessageOutboundRequireTls            = $False;
            RuleErrorAction                           = "Ignore";
            RuleSubType                               = "None";
            SenderAddressLocation                     = "Header";
            SentToScope                               = "NotInOrganization";
            StopRuleProcessing                        = $False;
            SubjectOrBodyContainsWords                = @("takeover","acquisition");
        }
        EXOTransportRule 5938f87e-fafb-4cf8-a804-85b65a7d290e
        {
            ApplyHtmlDisclaimerFallbackAction         = "Wrap";
            ApplyHtmlDisclaimerLocation               = "Append";
            ApplyHtmlDisclaimerText                   = "<h3>%%DisplayName%%</h3><br>%%Title%%<br>%%Department%%<br>%%Email%%";
            ApplyOME                                  = $False;
            AttachmentHasExecutableContent            = $False;
            AttachmentIsPasswordProtected             = $False;
            AttachmentIsUnsupported                   = $False;
            AttachmentProcessingLimitExceeded         = $False;
            DeleteMessage                             = $False;
            Ensure                                    = "Present";
            ExceptIfAttachmentHasExecutableContent    = $False;
            ExceptIfAttachmentIsPasswordProtected     = $False;
            ExceptIfAttachmentIsUnsupported           = $False;
            ExceptIfAttachmentProcessingLimitExceeded = $False;
            ExceptIfHasNoClassification               = $False;
            ExceptIfHasSenderOverride                 = $False;
            From                                      = @("LidiaH@$OrganizationName");
            GlobalAdminAccount                        = $Credsglobaladmin;
            HasNoClassification                       = $False;
            HasSenderOverride                         = $False;
            Mode                                      = "Enforce";
            ModerateMessageByManager                  = $False;
            Name                                      = "Signature for Lidia Holloway";
            Priority                                  = 2;
            RemoveOME                                 = $False;
            RemoveOMEv2                               = $False;
            RouteMessageOutboundRequireTls            = $False;
            RuleErrorAction                           = "Ignore";
            RuleSubType                               = "None";
            SenderAddressLocation                     = "Header";
            StopRuleProcessing                        = $False;
        }
        EXOTransportRule b100436f-7b74-4324-968b-912424ba5d5f
        {
            ApplyHtmlDisclaimerFallbackAction         = "Wrap";
            ApplyHtmlDisclaimerLocation               = "Append";
            ApplyHtmlDisclaimerText                   = "<body><br>&nbsp<br>&nbsp<br><b><font color=red>This e-mail and attachments are intended for the individual or group addressed.</font></b></body>";
            ApplyOME                                  = $False;
            AttachmentHasExecutableContent            = $False;
            AttachmentIsPasswordProtected             = $False;
            AttachmentIsUnsupported                   = $False;
            AttachmentProcessingLimitExceeded         = $False;
            DeleteMessage                             = $False;
            Ensure                                    = "Present";
            ExceptIfAttachmentHasExecutableContent    = $False;
            ExceptIfAttachmentIsPasswordProtected     = $False;
            ExceptIfAttachmentIsUnsupported           = $False;
            ExceptIfAttachmentProcessingLimitExceeded = $False;
            ExceptIfHasNoClassification               = $False;
            ExceptIfHasSenderOverride                 = $False;
            ExceptIfSubjectContainsWords              = @("This e-mail and attachments are intended for the individual");
            GlobalAdminAccount                        = $Credsglobaladmin;
            HasNoClassification                       = $False;
            HasSenderOverride                         = $False;
            Mode                                      = "Enforce";
            ModerateMessageByManager                  = $False;
            Name                                      = "Company Email Disclaimer";
            Priority                                  = 3;
            RemoveOME                                 = $False;
            RemoveOMEv2                               = $False;
            RouteMessageOutboundRequireTls            = $False;
            RuleErrorAction                           = "Ignore";
            RuleSubType                               = "None";
            SenderAddressLocation                     = "Header";
            SentToScope                               = "NotInOrganization";
            StopRuleProcessing                        = $False;
        }
    }
}
M365TenantConfig -ConfigurationData .\ConfigurationData.psd1 -GlobalAdminAccount $GlobalAdminAccount
