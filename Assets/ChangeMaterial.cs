using UnityEngine;
using System.Collections;

public class ChangeMaterial : MonoBehaviour 
{
	public Material opaque;
	public Material cutout;
	public float test;

	public void SetTransparancy(bool transparent) {
		if (transparent) {
			GetComponent<MeshRenderer>().material = cutout;
		} else {
			GetComponent<MeshRenderer>().material = opaque;
		} 
	}
}
