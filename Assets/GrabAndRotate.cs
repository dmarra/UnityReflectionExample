using UnityEngine;
using System.Collections;

public class GrabAndRotate : MonoBehaviour {     
     public float sensitivity = 10;

     private bool _isRotating;
     private float xDeg, yDeg;
    

     void Update() {
         if (_isRotating) {
             xDeg -= Input.GetAxis("Mouse X") * sensitivity;// *friction;
             yDeg += Input.GetAxis("Mouse Y") * sensitivity;// *friction;            
             Quaternion toRotation = Quaternion.Euler(yDeg, xDeg, xDeg - yDeg);
             transform.rotation = toRotation;
         }
     }
     
     void OnMouseDown() {
         // rotating flag
         _isRotating = true;
     }
     
     void OnMouseUp() {
         // rotating flag
         _isRotating = false;
     }
}
