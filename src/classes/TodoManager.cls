/**
 * Created by Слава on 07.09.2021.
 */

@RestResource(UrlMapping='/Todo__c/*')
global with sharing class TodoManager {

    @HttpPost
    global static Id CreateTodo(
            String name,
            String comments,
//            Datetime thisDateTime,
            Boolean isCompleted,
            String priority,
            String purchase
    ) {
        Todo__c thisTodo = new Todo__c(
                Name = name,
                Comments__c = comments,
//                DateTime__c = thisDateTime,
                isCompleted__c = isCompleted,
                Priority__c = priority,
                Purchase__c = purchase
        );
        insert thisTodo;
        return thisTodo.Id;
    }


}