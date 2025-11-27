using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace EngineRuntime;

public sealed class GameObject
{
    private readonly IntPtr _internalReference;
    private const string GameObjectDefaultName = "GameObject";

    public GameObject()
    {
        _internalReference = ExternalGameObject.CreateGameObject(GameObjectDefaultName, GameObjectDefaultName.Length);
    }
    
    public GameObject(string name)
    {
        _internalReference = ExternalGameObject.CreateGameObject(name, name.Length);
    }

    public T AddComponent<T>() where T : Component, new()
    {
        return ExternalGameObject.AddComponent<T>(_internalReference);
    }
}