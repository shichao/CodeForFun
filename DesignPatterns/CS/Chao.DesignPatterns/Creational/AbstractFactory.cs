namespace Chao.DesignPatterns.Creational
{
    public class AbstractFactory
    {
        public void Run()
        {
            //1. chose concret factory
            IAbstractFactory factory = new ConcretFactoryA();
            //2. create product 
            IProduct product = factory.Create();
        }
    }

    public interface IAbstractFactory
    {
        IProduct Create();
    }

    public class ConcretFactoryA : IAbstractFactory
    {
        public IProduct Create()
        {
            return new ProductA();
        }
    }

    public class ConcretFactoryB : IAbstractFactory
    {
        public IProduct Create()
        {
            return new ProductB();
        }
    }

    public interface IProduct
    {
        string Name { get; set; }
    }

    public class ProductA : IProduct
    {
        public string Name { get; set; }
    }
    public class ProductB : IProduct
    {
        public string Name { get; set; }
    }
}