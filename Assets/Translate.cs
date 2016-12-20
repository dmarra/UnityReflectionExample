using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class Translate : MonoBehaviour {
    public void TranslateFromSliderValue(float value) {
        transform.localPosition = new Vector3 (
            transform.localPosition.x,
            transform.localPosition.y,
            value
        );
    }
}
