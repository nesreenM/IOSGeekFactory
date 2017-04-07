
import UIKit

var str = "Hello, playground"

var intArray = [2,5,3,1,7,4]
var stringArray = ["apple","cat","zoo","az","elephant","bat"]


func bubbleSort<T: Comparable>(unsortedArray : [T])->[T]{
    
    var stringArray = unsortedArray
    
    for i in 0...stringArray.count{
        var noChange = true
        
        for j in 0..<stringArray.count-1{
            
            
            if(stringArray[j] > stringArray[j+1])
            {
                var temp = stringArray[j]
                stringArray[j] =  stringArray[j+1];
                stringArray[j+1] = temp
                noChange = false;
                
            }
        }
        
        if(noChange)
        {
            break
        }
        print(stringArray)
    }
    return(stringArray)
    
}

bubbleSort(unsortedArray: stringArray)
bubbleSort(unsortedArray: intArray)