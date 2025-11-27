namespace EngineRuntime;

using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

internal static partial class ExternalGameObject
{
    [LibraryImport(libraryName: "EngineCore", EntryPoint = "create_game_object", StringMarshalling = StringMarshalling.Utf8)]
    [UnmanagedCallConv(CallConvs = new []{typeof(CallConvCdecl)})]
    internal static partial IntPtr CreateGameObject(string name, int nameSize);
    
    [LibraryImport(libraryName: "EngineCore", EntryPoint = "update_game_objects")]
    [UnmanagedCallConv(CallConvs = new []{typeof(CallConvCdecl)})]
    internal static partial void UpdateGameObjects();

    [LibraryImport(libraryName: "EngineCore", EntryPoint = "add_component")]
    [UnmanagedCallConv(CallConvs = new []{typeof(CallConvCdecl)})]
    private static partial IntPtr AddComponent(IntPtr internalGameObject, IntPtr gcHandle);
    
    internal static T AddComponent<T>(IntPtr internalGoReference) where T : Component, new()
    {
        var component = new T();
        var gcHandle = GCHandle.Alloc(component, GCHandleType.Normal);
        component.InternalReference = AddComponent(internalGoReference, GCHandle.ToIntPtr(gcHandle));
        return component;
    }
}