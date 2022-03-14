# 一、GOF简介
GOF是设计模式的经典名著Design Patterns: Elements of Reusable Object-Oriented Software（中译本名为《设计模式——可复用面向对象软件的基础》）的四位作者，他们分为是：Elich Gamma、Richard Helm、Ralph Johnson、以及John Vlissides。这四个人常被称为Gang of Four， 即四人组，简称Gof。

他们在书本总结了23个设置模式，以下将给出这23个设计模式的简要说明。

# 二、23种设计模式

## 构建类（Creational），5种

### 单例（Singleton）模式

public class Product {
    
    public static Product Instance {get;set;}

}

### 原型（Prototype）模式

public interface IProduct {

    public IProduct Clonse();

} 

### 工厂方法（Factory Method）模式

public class Factory {
    
    public IProduct Create() {};
}

### 抽象工厂（Abstract Factory）模式

public interface IFactory {

    public IProductA PA();
    public IProdictB PB();
}
### 建造者（Builder）模式

Director -> Builder -> Build Product

## 结构类（Structural），共7种

### 代理（Proxy）模式

Client -> Proxy -> RealProvider

### 适配器（Adapter）模式

Client -> Adapter.MethodA -> Adaptee.MethodB

### 桥接（Bridge）模式

Client -> Bridge1.Function/Bridge2.Function

### 装饰（Decorator）模式

Client -> Decorator(Component) 

### 外观（Facade）模式

Client -> Facade -> Complex internal api

### 享元（Flyweight）模式

Share (Data/Component)

### 组合（Composite）模式

Client -> Composite.Func() -> Components[].Func()

## 行为类（Behavioral)，共11种

### 模板方法（TemplateMethod）模式

public abstract class Foo {

    public sealed void Do {
        this.First();
        this.Second();
        this.Third();
    }

    public abstract void First();
    public abstract void Second();
    public abstract void Third();
}

### 策略（Strategy）模式

Context -> Interface Strategy -> ConcreteStrategy

### 命令（Command）模式

Caller -> Command -> Receiver(parameter)

### 职责链（Chain of Responsibility）模式

Logger.Next -> Logger

### 状态（State）模式

finite-state machine

### 观察者（Observer）模式

Subject -> Subscribe/Unsubscribe observer -> Notify observer

Event Hander/Hooks etc

### 中介者（Mediator）模式

Client -> Mediator -> Component(s)

### 迭代器（Iterator）模式

### 访问者（Visitor）模式


Client.Accept(visitor)

### 备忘录（Memento）模式

provides the ability to restore an object to its previous state

### 解释器（Interpreter）模式

# 三、设计模式原则

## 1、单一职责原则（Single Responsibility Principle)

## 2、开闭原则（Open Close Principle）

## 3、里氏代换原则（Liskov Substitution Principle）

## 4、接口隔离原则（Interface Segregation Principle）

## 5、依赖倒转原则（Dependence Inversion Principle）

## 6、迪米特法则，又称最少知道原则（Demeter Principle）

## 7、合成复用原则（Composite Reuse Principle）