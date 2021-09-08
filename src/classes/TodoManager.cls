/**
 * Created by Слава on 07.09.2021.
 */

@RestResource(UrlMapping='/Todo__c/*')
global with sharing class TodoManager {

    private static final String CHECK_DATE = '1921-01-01 00:00:00';
    private static final String CHECK_NULL = 'null';

    @HttpPost
    global static Id CreateTodo(
            String name,
            String comments,
            Datetime thisDateTime,
            String priority,
            String purchase,
            String status) {

        String checkThisDateTime = String.valueOfGmt(thisDateTime);

        if (CHECK_DATE.equalsIgnoreCase(checkThisDateTime)) {
            thisDateTime = null;
        }

        if (CHECK_NULL.equalsIgnoreCase(comments)) {
            comments = null;
        }

        if (CHECK_NULL.equalsIgnoreCase(purchase)) {
            purchase = null;
        }

        Todo__c thisTodo = new Todo__c(
                Name = name,
                Comments__c = comments,
                DateTime__c = thisDateTime,
                Priority__c = priority,
                Purchase__c = purchase,
                Status__c = status);

        insert thisTodo;
        return thisTodo.Id;
    }
}