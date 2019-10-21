import java.util.Arrays;
import java.util.List;

public class myTest {
    public static void main(String[] args) {
        String roles="[ROLE_STUDENT,ROLE_ADMIN]";
        String[] arr=roles.substring(1,roles.length()-1).replaceAll("ROLE_","").split(",");
//        roles=roles.substring(1,roles.length()-1);
        System.out.println(arr[0]);


    }
}
