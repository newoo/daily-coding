/*
 * This Java source file was generated by the Gradle 'init' task.
 */

/*
https://programmers.co.kr/learn/courses/30/lessons/42576?language=java

### 1. 이해
- numbers의 길이는 2 이상 100 이하
- numbers의 모든 수는 0 이상 100 이하
- numbers에서 2개의 수를 뽑아 더해서 만들 수 있는 모든 수들의 오름차순 배열을 구한다.


### 2. 계획
- numbers를 두 번 돌리면서 일일이 합을 구해서 set에 넣어서 처리
- N!

### 3. 실행

### 4. 반성

 */
package find.prime.numbers;

import java.util.*;

public class App {
    public int[] solution(int[] numbers) {
        HashSet<Integer> numberSet = new HashSet<Integer>();

        for (int i = 0;i < numbers.length;i++) {
            for (int j = i + 1;j < numbers.length;j++) {
                numberSet.add(numbers[i] + numbers[j]);
            }
        }
 
        int[] answer = numberSet.stream().mapToInt(i -> i).toArray();
        Arrays.sort(answer);

        return answer;
    }

    public static void main(String[] args) {
        //
    }
}
