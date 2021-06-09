using System;
using Chao.DesignPatterns.Creational;

namespace Chao.Cmd
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello Design Patterns!");
            Console.WriteLine("== Creational Patterns ==");

            //2. Prototype
            var prototype = new Prototype();
            prototype.Run();
        }
    }
}
