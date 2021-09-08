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

        Todo__c thisTodo = new Todo__c(
                Name = name,
                Comments__c = isEmpty(CHECK_NULL, comments),
                DateTime__c = isEmptyDateTime(CHECK_DATE, thisDateTime),
                Priority__c = priority,
                Purchase__c = isEmpty(CHECK_NULL, purchase),
                Status__c = status);

        insert thisTodo;
        return thisTodo.Id;
    }

    private static String isEmpty(String entityFinal, String checkEntity) {
        return checkEntity = checkEntity.equalsIgnoreCase(entityFinal) ? checkEntity = null : checkEntity;
    }

    private static Datetime isEmptyDateTime(String entityFinal, Datetime checkEntity) {
        String checkThisDateTime = String.valueOfGmt(checkEntity);
        return checkEntity = checkThisDateTime.equalsIgnoreCase(entityFinal) ? checkEntity = null : checkEntity;
    }
}