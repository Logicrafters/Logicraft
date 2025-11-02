using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace interop_testing;


[StructLayout(LayoutKind.Sequential)]
public struct Vector3f(float x, float y, float z)
{
    public static Vector3f operator+(Vector3f first, Vector3f second)
    {
        return External.AddVector(in first, in second);
    }

    public float DotProduct(in Vector3f other)
    {
        return External.VectorDotProduct(in this, in other);
    }
    
    public float Length()
    {
        return External.VectorLength(in this);
    }
    
    public Vector3f Normalized()
    {
        return External.VectorNormalized(in this);
    }
    
    public Quaternion ToIdentity()
    {
        return External.VectorToIdentity(in this);
    }

    public override string ToString()
    {
        return $"x : {x}, y : {y}, z : {z}";
    }

    public float x = x, y = y, z = z;
}