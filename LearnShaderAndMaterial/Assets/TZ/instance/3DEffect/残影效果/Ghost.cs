using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ghost : MonoBehaviour
{
    [Range(0, 10), Header("持续时间")]
    public float duration = 2f;
    [Range(0, 10), Header("创建残影的间隔时间")]
    public float interval = 0.1f;
    private SkinnedMeshRenderer[] meshRenderers;
    Shader ghostShader;
    private Vector3 lastPos = Vector3.zero;
    private float lastTime = 0;
    // Start is called before the first frame update
    void Start()
    {
        ghostShader = Shader.Find("Unlit/ghost");
        meshRenderers = GetComponentsInChildren<SkinnedMeshRenderer>();
    }

    // Update is called once per frame
    void Update()
    {
        //如果没有发生位移，不创建残影
        if(lastPos == transform.position)
        {
            return;
        }
        lastPos = transform.position;
        //创建残影的间隔时间
        if (Time.time - lastTime < interval)
        {
            return;
        }
        lastTime = Time.time;
        if (meshRenderers == null)
        {
            return;
        }
        //创建网格
        for(int i = 0; i < meshRenderers.Length; i++)
        {
            Mesh mesh = new Mesh();
            meshRenderers[i].BakeMesh(mesh);
            GameObject go = new GameObject();
            //隐藏并不可编辑，不能显示在层级面板并且不能保存到场景中
            go.hideFlags = HideFlags.HideAndDontSave;
            GhostItem item = go.AddComponent<GhostItem>();
            item.duration = this.duration;
            item.deleteTime = Time.time + duration;
            //MeshFilter网格过滤器用于资源中获取网格信息，将其传递到用于将其渲染到屏幕的网格渲染器中
            MeshFilter filter = go.AddComponent<MeshFilter>();
            filter.mesh = mesh;
            MeshRenderer meshRen = go.AddComponent<MeshRenderer>();
            meshRen.material = meshRenderers[i].material;
            meshRen.material.shader = ghostShader;//设置X光效果
            //设置残影信息
            go.transform.position = meshRenderers[i].transform.position;
            go.transform.rotation = meshRenderers[i].transform.rotation;
            item.meshRenderer = meshRen;
        }
    }
}
