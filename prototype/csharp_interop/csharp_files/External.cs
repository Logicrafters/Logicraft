using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace interop_testing;

internal partial class External
{
    //A simple function with a catch can be added to avoid dll exception.
    [LibraryImport(libraryName: "libInteropCPP", EntryPoint = "add")]
    [UnmanagedCallConv(CallConvs = new []{ typeof(CallConvCdecl) })]
    internal static partial int Add(int a, int b);
    
    [LibraryImport(libraryName: "libInteropCPP", EntryPoint = "add_vector")]
    [UnmanagedCallConv(CallConvs = new []{ typeof(CallConvCdecl)})]
    internal static partial Vector3f AddVector(in Vector3f first, in Vector3f second);
    
    [LibraryImport(libraryName: "libInteropCPP", EntryPoint = "vector_dot_product")]
    [UnmanagedCallConv(CallConvs = new []{ typeof(CallConvCdecl)})]
    internal static partial float VectorDotProduct(in Vector3f first, in Vector3f second);
    
    [LibraryImport(libraryName: "libInteropCPP", EntryPoint = "vector_length")]
    [UnmanagedCallConv(CallConvs = new []{ typeof(CallConvCdecl)})]
    internal static partial float VectorLength(in Vector3f vector);
    
    [LibraryImport(libraryName: "libInteropCPP", EntryPoint = "vector_normalized")]
    [UnmanagedCallConv(CallConvs = new []{ typeof(CallConvCdecl)})]
    internal static partial Vector3f VectorNormalized(in Vector3f vector);
    
    [LibraryImport(libraryName: "libInteropCPP", EntryPoint = "vector_to_identity")]
    [UnmanagedCallConv(CallConvs = new []{ typeof(CallConvCdecl)})]
    internal static partial Quaternion VectorToIdentity(in Vector3f vector);
}