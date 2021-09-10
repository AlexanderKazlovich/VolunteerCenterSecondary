/**
 * Created by Слава on 10.09.2021.
 */

@RestResource(UrlMapping='/Account/*')
global with sharing class AccountManager {

    @HttpPost
    global static Id createAccount(
            String name
    ) {

        Account thisAccount = new Account(
                Name = name
        );

        insert thisAccount;
        return thisAccount.Id;
    }

}