/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.math.*;
import java.util.*;

/**
 *
 * @author theAJFM
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static BigInteger fibonacci(int i){
        BigInteger BI1 = new BigInteger("0");
        BigInteger BI2 = new BigInteger("1");
        BigInteger BI3 = new BigInteger("0");
        
        if(i == 0){
            BI3 = BI1;
        }
        else if(i == 1){
            BI3 = BI2;
        }
        else {
            for(int j = 0; j <= i - 2 ; j++){
             BI3 = BI1.add(BI2);
             BI1 = BI2;
             BI2 = BI3;
            }
        }
        
        //Code your logic here and don't change the name of the function. The test class only tests the fibonacci method.
        return BI3.mod(new BigInteger("1000000")); //Use mod(new BigInteger("1000000")) to get the last 6 digits of the fibonacci number
    }
    public static void main(String[] args) {
        //You don't need to fill anything here
        System.out.println(fibonacci(100));
    }
    
}
//Note for extra point: 
// Because BigInteger is a class rather than data type, therefore it cannot use the operator +, and instead relies on the method add()
