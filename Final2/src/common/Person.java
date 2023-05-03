package common;           // 기본 패키지 이외의 패키지

public class Person {
    private String name;  // private 멤버 변수
    private int age;      // private 멤버 변수

    public Person() {}    // 기본 생성자
    public Person(String name, int age) {
        super();
        this.name = name;
        this.age = age;
    }

    // public getter/setter 메서드들
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
}