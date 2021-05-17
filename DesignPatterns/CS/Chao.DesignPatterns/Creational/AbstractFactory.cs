namespace Chao.DesignPatterns.Creational
{
    public class AbstractFactory : IAbstractFactory
    {
        public IProduct Create()
        {
            return new Product();
        }
    }

    public interface IAbstractFactory
    {
        IProduct Create();
    }

    public interface IProduct
    {
        string Name { get; set; }
    }

    public class Product : IProduct
    {
        public string Name { get; set; }
    }
}