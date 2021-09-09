/**
 * Created by Слава on 09.09.2021.
 */

@RestResource(UrlMapping='/Sub_Todo__c/*')
global with sharing class SubTodoManager {

    private static final String CHECK_NULL = 'null';

    @HttpPost
    global static Id createSubTodo(
            String id,
            String name,
            String purchase,
            String comments,
            Boolean isCompleted) {

        Sub_Todo__c thisSubTodo = new Sub_Todo__c(
                Name = name,
                Purchase__c = isEmpty(CHECK_NULL, purchase),
                Comments__c = isEmpty(CHECK_NULL, comments),
                isCompleted__c = isCompleted,
                External_Id__c = id);

        insert thisSubTodo;
        return thisSubTodo.Id;
    }

    private static String isEmpty(String entityFinal, String checkEntity) {
        return checkEntity = checkEntity.equalsIgnoreCase(entityFinal) ? checkEntity = null : checkEntity;
    }

}