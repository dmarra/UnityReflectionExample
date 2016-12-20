using UnityEngine;
using System.Collections;

public class SelectSurface : MonoBehaviour {
    public GameObject flatPlane;
    public GameObject wavyPlane;

    public void SetSurface(int value) {
        if (value == 0) {
            flatPlane.SetActive(true);
            wavyPlane.SetActive(false);

        } else if (value == 1) {
            flatPlane.SetActive(false);
            wavyPlane.SetActive(true);
        } 
    }
}
