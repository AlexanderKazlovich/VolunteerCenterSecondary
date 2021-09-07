/**
 * Created by Слава on 07.09.2021.
 */

@RestResource(UrlMapping='/Todo__c/*')
global with sharing class TodoManager {

    @HttpPost
    global static Id CreateTodo(
            String name,
            String comments,
            Datetime thisDateTime,
            String priority,
            String purchase,
            String status
    ) {

        String check = '1921-01-01 00:00:00';
        String check2 = String.valueOfGmt(thisDateTime);

        System.debug(thisDateTime);
        System.debug('check: ' + check);
        System.debug('check2: ' + check2);

        if(check.equalsIgnoreCase(check2)) {
            thisDateTime = null;
        }

        System.debug(thisDateTime);

        Todo__c thisTodo = new Todo__c(
                Name = name,
                Comments__c = comments,
                DateTime__c = thisDateTime,
                Priority__c = priority,
                Purchase__c = purchase,
                Status__c = status
        );

        System.debug(thisTodo);

        insert thisTodo;
        return thisTodo.Id;
    }


}