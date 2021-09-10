/**
 * Created by Слава on 10.09.2021.
 */

@RestResource(UrlMapping='/Account/*')
global with sharing class AccountManager {

    private static final String RECORD_TYPE_COMPANY_FIRST_ORG = '0125g000000mI2mAAE';
    private static final String RECORD_TYPE_COMPANY_SECOND_ORG = '0125g000000uiOUAAY';
    private static final String RECORD_TYPE_VOLUNTEER_SECOND_ORG = '0125g000000uiOZAAY';

    @HttpPost
    global static Id createAccount(
            String thisRecordType,
            String name,
            String accountNumber,
            Double age

    ) {
        Account thisAccount = new Account(
                Name = name,
                AccountNumber = accountNumber,
                Age__c = age,
                RecordTypeId = thisRecordType(thisRecordType)
        );

        insert thisAccount;
        return thisAccount.Id;
    }

    private static String thisRecordType(String thisRecordTypeId) {
        return  thisRecordTypeId.equalsIgnoreCase(RECORD_TYPE_COMPANY_FIRST_ORG) ? RECORD_TYPE_COMPANY_SECOND_ORG : RECORD_TYPE_VOLUNTEER_SECOND_ORG;
    }

}