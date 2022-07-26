public with sharing class StudentsController {
    public List<Hoc_Sinh__c> students {get;set;}
    public String searchCondition {get;set;}
    public Hoc_Sinh__c currentRecord {get;set;}

    public StudentsController() {}

    public void showStudents(){
        students = new List<Hoc_Sinh__c>();
        students = [Select Id, Name, Lop__r.Name From Hoc_Sinh__c];        
    }

    public void searchStudents(){
        students = new List<Hoc_Sinh__c>();
        if(String.isNotBlank(searchCondition)){
            String likeCondition = '%'+searchCondition+'%';
            students = [SELECT Id, Name, Lop__r.Name
                        FROM Hoc_Sinh__c 
                        WHERE Name LIKE :likeCondition];
        } else {
            students = [Select Id, Name, Lop__r.Name From Hoc_Sinh__c];
        }
    }

    public void deleteRecord(){
        String recordIndex = Apexpages.currentPage().getParameters().get('recordIndex');
        System.debug('==recordIndex==' + recordIndex);
        //Account rAcc = accounts[Integer.valueOf(recordIndex)];
        delete students[Integer.valueOf(recordIndex)];
        students.remove(Integer.valueOf(recordIndex));
    }

    public void initRecordById(){
        String recordId = Apexpages.currentPage().getParameters().get('id');
        System.debug('==recordId==' + recordId);
        if(String.isBlank(recordId)){
            currentRecord = new Hoc_Sinh__c();
        } else {
            currentRecord = [SELECT Id, Name, Lop__r.Name FROM Hoc_Sinh__c WHERE Id = :recordId];
        }
    }

    public void savRecord(){
        upsert currentRecord;
    }
}
