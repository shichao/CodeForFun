using System;
using System.Collections.Generic;

namespace Chao.Cmd
{
    public class CSharp7
    {
        public static void Run()
        {
            //tuple
            Console.WriteLine("== Tuple with named field ==");
            (string Alpha, string Beta) namedLetters = ("a", "b");
            Console.WriteLine($"{namedLetters.Alpha}, {namedLetters.Beta}");

            Console.WriteLine("== Deconstruct value to tuple ==");
            var p = new Point(3.14, 2.71);
            (double X, double Y) = p;

            //pattern matching (boolean result)
            // 'is' 'switch'


        }



        public static int SumPositiveNumbers(IEnumerable<object> sequence)
        {
            int sum = 0;
            foreach (var i in sequence)
            {
                switch (i)
                {
                    case 0:
                        break;
                    case IEnumerable<int> childSequence:
                        {
                            foreach (var item in childSequence)
                                sum += (item > 0) ? item : 0;
                            break;
                        }
                    case int n when n > 0:
                        sum += n;
                        break;
                    case null:
                        throw new NullReferenceException("Null found in sequence");
                    default:
                        throw new InvalidOperationException("Unrecognized type");
                }
            }
            return sum;
        }
    }
    public class Point
    {
        public Point(double x, double y)
            => (X, Y) = (x, y);

        public double X { get; }
        public double Y { get; }

        //this Deconstruct can help to extract value to tuple
        public void Deconstruct(out double x, out double y) =>
            (x, y) = (X, Y);
    }
}