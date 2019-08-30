using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostItem : MonoBehaviour
{
    [Range(0,10),Header("持续时间")]
    public float duration;
    [Range(0, 10), Header("销毁时间")]
    public float deleteTime;
    public MeshRenderer meshRenderer;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        float tempTime = deleteTime - Time.time;
        if (tempTime <= 0)//达到销毁时间
        {
            Destroy(this.gameObject);
        }
        else if(meshRenderer.material)
        {
            //计算透明度
            float rate = tempTime / duration;
            Color col = meshRenderer.material.GetColor("_Color");
            col.a *= rate;//设置透明通道
            meshRenderer.material.SetColor("_Color", col);
        }
    }
}
