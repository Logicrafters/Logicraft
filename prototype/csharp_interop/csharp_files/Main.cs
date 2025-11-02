using System;
using System.Runtime.InteropServices;

namespace interop_testing;

public class InteropTesting
{
    public static void Main(string[] args)
    {
        int result = External.Add(5, 10);
        Console.WriteLine($"5 + 10 = {result}");

        Vector3f firstVector = new (20, 20, 20);
        Vector3f secondVector = new (20, 20, 20);
        
        Console.WriteLine($"firstVector : {firstVector} + secondVector : {secondVector} = {firstVector + secondVector}");
        
        Console.WriteLine($"dot product of the first and second vector : {firstVector.Normalized().DotProduct(secondVector.Normalized())}");
        
        Console.WriteLine($"length of the first vector : {firstVector.Length()}");
        
        Console.WriteLine($"normalized first vector : {firstVector.Normalized()}");
        
        Console.WriteLine($"identity of the first vector : {firstVector.Normalized().ToIdentity()}");

        Vector3f vector = new Vector3f(10f, 20f, 30f);
        IntPtr pVector = Marshal.AllocHGlobal(Marshal.SizeOf<Vector3f>());
        Marshal.StructureToPtr(vector, pVector, false);

        float x = Marshal.PtrToStructure<float>(pVector);
        
        Marshal.StructureToPtr(x, pVector + 4, false);
        
        vector = Marshal.PtrToStructure<Vector3f>(pVector);

        Console.WriteLine(vector);
        
        Marshal.FreeHGlobal(pVector);
    }
}