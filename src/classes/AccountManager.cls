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
            String todoId,
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
            String customerPriority,
            String gender,
            String bloodType,
            String rhesusFactor,
            Boolean isFree

    ) {

        Account thisAccount = new Account(
                External_Id__c = id,
                ParentId = thisParentId(parentId),
                Todo__c = thisTodoId(todoId),
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
                CustomerPriority__c = customerPriority,
                Gender__c = gender,
                Blood_Type__c = bloodType,
                Rhesus_Factor__c = rhesusFactor,
                IsFree__c = isFree
        );

        insert thisAccount;
        return thisAccount.Id;
    }


    @HttpDelete
    global static void deleteAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(
                request.requestURI.lastIndexOf('/') + 1
        );
        Account thisAccount = [SELECT Id FROM Account WHERE External_Id__c = :accountId];
        delete thisAccount;
    }

    @HttpPut
    global static Id updateAccount(
            String id,
            String parentId,
            String todoId,
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
            String customerPriority,
            String gender,
            String bloodType,
            String rhesusFactor,
            Boolean isFree

    ) {

        Account thisAccount = [SELECT Id FROM Account WHERE External_Id__c = :id];


        thisAccount.ParentId = thisParentId(parentId);
        thisAccount.Todo__c = thisTodoId(todoId);
        thisAccount.Name = name;
        thisAccount.AccountNumber = isEmpty(accountNumber);
        thisAccount.Age__c = age;
        thisAccount.Site = isEmpty(accountSite);
        thisAccount.Phone = isEmpty(phone);
        thisAccount.Fax = isEmpty(fax);
        thisAccount.Website = isEmpty(webSite);
        thisAccount.AnnualRevenue = annualRevenue;
        thisAccount.NumberOfEmployees = numberOfEmployees;
        thisAccount.Type = type;
        thisAccount.Industry = industry;
        thisAccount.Ownership = ownerShip;
        thisAccount.Rating = rating;
        thisAccount.Active__c = active;
        thisAccount.BillingStreet = isEmpty(street);
        thisAccount.BillingCity = isEmpty(city);
        thisAccount.BillingPostalCode = isEmpty(postalCode);
        thisAccount.BillingState = isEmpty(province);
        thisAccount.BillingCountry = isEmpty(country);
        thisAccount.Description = isEmpty(description);
        thisAccount.CustomerPriority__c = customerPriority;
        thisAccount.Gender__c = gender;
        thisAccount.Blood_Type__c = bloodType;
        thisAccount.Rhesus_Factor__c = rhesusFactor;
        thisAccount.IsFree__c = isFree;

        update thisAccount;
        return thisAccount.Id;
    }

    private static String thisRecordType(String thisRecordTypeId) {
        return thisRecordTypeId.equalsIgnoreCase(RECORD_TYPE_COMPANY_FIRST_ORG) ? RECORD_TYPE_COMPANY_SECOND_ORG : RECORD_TYPE_VOLUNTEER_SECOND_ORG;
    }

    private static String isEmpty(String checkEntity) {
        return checkEntity = checkEntity.equalsIgnoreCase(CHECK_NULL) ? checkEntity = null : checkEntity;
    }

    private static String thisParentId(String id) {
        if (String.isEmpty(isEmpty(id))) {
            return null;
        } else {
            Account thisParentId = [SELECT Id FROM Account WHERE External_Id__c = :id];
            return thisParentId.Id;
        }
    }

    private static String thisTodoId(String id) {
        if (String.isEmpty(isEmpty(id))) {
            return null;
        } else {
            Todo__c thisTodoId = [SELECT Id FROM Todo__c WHERE External_Id__c = :id];
            return thisTodoId.Id;
        }
    }

}