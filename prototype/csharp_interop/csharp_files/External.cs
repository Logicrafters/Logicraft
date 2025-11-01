using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace interop_testing;

internal partial class External
{
    [LibraryImport("libInteropCPP", EntryPoint = "add")]
    [UnmanagedCallConv(CallConvs = new []{ typeof(CallConvCdecl) })]
    internal static partial int Add(int a, int b);
}