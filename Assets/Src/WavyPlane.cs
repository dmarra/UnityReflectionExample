using UnityEngine;
using System.Collections;

public class WavyPlane : MonoBehaviour 
{
	private Mesh mesh;
	private MeshFilter meshFilter;

	[Range(0, 1)]    
	public float frequency = 1;

	[Range(0, 1)]  
	public float amplitude = 1;


	// Use this for initialization
	void Start () {
		meshFilter = GetComponent<MeshFilter>();
		mesh = meshFilter.mesh;
	}


	
	// Update is called once per frame
	void Update () {
		Vector3[] vertices = mesh.vertices;

		for (int i = 0; i < mesh.vertexCount; i++) {
			vertices[i].y = Mathf.Sin(Time.time * frequency + vertices[i].x) * 
			                Mathf.Cos(Time.time * frequency + vertices[i].z) * 
			                amplitude;
		}

		mesh.vertices = vertices;
		meshFilter.mesh = mesh;
	}
}
