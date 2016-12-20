using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class ProjectorSettings : MonoBehaviour {
    private Projector projector;
    private new Camera camera;

	void Start () {
	    projector = GetComponent<Projector>();
        camera = GetComponent<Camera>();
	}
	
	
    public void SetProjectorProjectionFromDropdown(int value) {        
        projector.orthographic = (value == 0) ? true : false;        
    }

    public void SetCameraProjectionFromDropdown(int value) {        
        camera.orthographic = (value == 0) ? true : false;               
    }
}
