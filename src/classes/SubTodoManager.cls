/**
 * Created by Слава on 09.09.2021.
 */

@RestResource(UrlMapping='/Sub_Todo__c/*')
global class SubTodoManager {

    private static final String CHECK_NULL = 'null';

    @HttpPost
    global static Id createSubTodo(
            String id,
            String name,
            String purchase,
            String comments,
            Boolean isCompleted,
            String todoId,
            String subTodoId) {

        Sub_Todo__c thisSubTodo = new Sub_Todo__c(
                Name = name,
                Purchase__c = isEmpty(CHECK_NULL, purchase),
                Comments__c = isEmpty(CHECK_NULL, comments),
                isCompleted__c = isCompleted,
                External_Id__c = id,
                Todo__c = isNullId(todoId),
                Sub_Todo__c = isNullIdSub(subTodoId));

        insert thisSubTodo;
        return thisSubTodo.Id;
    }

    @HttpDelete
    global static void deleteSubTodo() {
        RestRequest request = RestContext.request;
        String subTodoId = request.requestURI.substring(
                request.requestURI.lastIndexOf('/') + 1
        );
        Sub_Todo__c thisSubTodo = [SELECT Id FROM Sub_Todo__c WHERE External_Id__c = :subTodoId];
        delete thisSubTodo;
    }

    private static String isEmpty(String entityFinal, String checkEntity) {
        return checkEntity = checkEntity.equalsIgnoreCase(entityFinal) ? checkEntity = null : checkEntity;
    }

    private static String isNullId(String id) {
        if (String.isEmpty(isEmpty(CHECK_NULL, id))) {
            return null;
        } else {
            Todo__c thisTodoId = [SELECT Id FROM Todo__c WHERE External_Id__c = :id];
            return thisTodoId.Id;
        }
    }

    private static String isNullIdSub(String id) {
        if (String.isEmpty(isEmpty(CHECK_NULL, id))) {
            return null;
        } else {
            Sub_Todo__c thisSubTodoId = [SELECT Id FROM Sub_Todo__c WHERE External_Id__c = :id];
            return thisSubTodoId.Id;
        }
    }
}