using System;

namespace Chao.DesignPatterns.Creational
{
    public class Prototype : IPattern
    {
        public void Run()
        {
            var prototypeA = new FooPrototypeA("prototype a");
            var prototypeB = new FooPrototypeB("prototype b");
            //create instance for a
            var instA = prototypeA.Clone();
            Console.WriteLine($"prototype a name: {instA.Name}");
            //create instance for b
            var instB = prototypeB.Clone();
            Console.WriteLine($"prototype b name: {instB.Name}");
        }
    }

    public abstract class Foo
    {
        protected Foo(string name)
        {
            Name = name;
        }

        public string Name { get; set; }

        public virtual Foo Clone()
        {
            return (Foo)this.MemberwiseClone();
        }
    }

    public class FooPrototypeA : Foo
    {
        public FooPrototypeA(string name) : base(name)
        {

        }
    }

    public class FooPrototypeB : Foo
    {
        public FooPrototypeB(string name) : base(name)
        {

        }
    }
}