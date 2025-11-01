using System;

namespace interop_testing;

public class InteropTesting
{
    public static void Main(string[] args)
    {
        int result = External.Add(5, 10);
        Console.WriteLine($"Hello World ! and 5 + 10 = {result}");
    }
}