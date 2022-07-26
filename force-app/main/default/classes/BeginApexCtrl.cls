public class BeginApexCtrl {
    public static void test(List<Integer> myList, Integer Index, Integer UpdateValue){
        myList.set(Index, UpdateValue);
        System.debug(myList);
    }
    
    public static void testMT(){

    }

}