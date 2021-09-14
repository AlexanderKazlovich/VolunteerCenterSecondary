/**
 * Created by Слава on 12.09.2021.
 */

public with sharing class TodoTriggerHelper {


    public static void makeCallouts(List<Todo__c> newList) {
        for (Todo__c todo : newList) {
            TodoCallouts.makePostCallout(
                    todo.Id,
                    todo.Account__c,
                    todo.RecordTypeId,
                    todo.Name,
                    todo.Comments__c,
                    todo.DateTime__c,
                    todo.Priority__c,
                    todo.Purchase__c,
                    todo.Status__c);
        }
    }


    public static void deleteCallouts(List<Todo__c> oldList) {
        for (Todo__c todo : oldList) {
            TodoCallouts.makeDeleteCallout(
                    todo.Id,
                    todo.External_Id__c);
        }
    }

    public static void putCallouts(List<Todo__c> newList) {
        for (Todo__c todo: newList) {
            TodoCallouts.makePutCallout(
                    todo.Id,
                    todo.External_Id__c,
                    todo.Account__c,
                    todo.Name,
                    todo.Comments__c,
                    todo.DateTime__c,
                    todo.Priority__c,
                    todo.Purchase__c,
                    todo.Status__c);
        }
    }
}