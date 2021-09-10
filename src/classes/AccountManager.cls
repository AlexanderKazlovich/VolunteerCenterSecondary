/**
 * Created by Слава on 10.09.2021.
 */

@RestResource(UrlMapping='/Account/*')
global with sharing class AccountManager {

    private static final String RECORD_TYPE_COMPANY_FIRST_ORG = '0125g000000mI2mAAE';
    private static final String RECORD_TYPE_COMPANY_SECOND_ORG = '0125g000000uiOUAAY';
    private static final String RECORD_TYPE_VOLUNTEER_SECOND_ORG = '0125g000000uiOZAAY';
    private static final String CHECK_NULL = 'null';

    @HttpPost
    global static Id createAccount(
            String id,
            String parentId,
            String recordType,
            String name,
            String accountNumber,
            Double age,
            String accountSite,
            String phone,
            String fax,
            String webSite,
            Double annualRevenue,
            Integer numberOfEmployees,
            String type,
            String industry,
            String ownerShip,
            String rating,
            String active,
            String street,
            String city,
            String postalCode,
            String province,
            String country,
            String description,
            String customerPriority

    ) {

        Account thisAccount = new Account(
                External_Id__c = id,
                ParentId = isNullParentId(parentId),
                RecordTypeId = thisRecordType(recordType),
                Name = name,
                AccountNumber = isEmpty(accountNumber),
                Age__c = age,
                Site = isEmpty(accountSite),
                Phone = isEmpty(phone),
                Fax = isEmpty(fax),
                Website = isEmpty(webSite),
                AnnualRevenue = annualRevenue,
                NumberOfEmployees = numberOfEmployees,
                Type = type,
                Industry = industry,
                Ownership = ownerShip,
                Rating = rating,
                Active__c = active,
                BillingStreet = isEmpty(street),
                BillingCity = isEmpty(city),
                BillingPostalCode = isEmpty(postalCode),
                BillingState = isEmpty(province),
                BillingCountry = isEmpty(country),
                Description = isEmpty(description),
                CustomerPriority__c = customerPriority
        );

        insert thisAccount;
        return thisAccount.Id;
    }

    private static String thisRecordType(String thisRecordTypeId) {
        return thisRecordTypeId.equalsIgnoreCase(RECORD_TYPE_COMPANY_FIRST_ORG) ? RECORD_TYPE_COMPANY_SECOND_ORG : RECORD_TYPE_VOLUNTEER_SECOND_ORG;
    }

    private static String isEmpty(String checkEntity) {
        return checkEntity = checkEntity.equalsIgnoreCase(CHECK_NULL) ? checkEntity = null : checkEntity;
    }

    private static String isNullParentId(String id) {
        if (String.isEmpty(isEmpty(id))) {
            return null;
        } else {
            Account thisParentId = [SELECT Id FROM Account WHERE External_Id__c = :id];
            return thisParentId.Id;
        }
    }

}