/**
 * Created by Слава on 07.09.2021.
 */

@RestResource(UrlMapping='/Todo__c/*')
global with sharing class TodoManager {

    @HttpPost
    global static Id CreateTodo(
            String name) {
        Todo__c thisTodo = new Todo__c(
                Name = name);
        insert thisTodo;
        return thisTodo.Id;
    }
}