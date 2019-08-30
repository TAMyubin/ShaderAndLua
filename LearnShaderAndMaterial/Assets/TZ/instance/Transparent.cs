using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Transparent : MonoBehaviour
{
    public Transform targetObjecr = null;//目标对象
    [Range(0, 1), Tooltip("目标对象Y方向的偏移")]
    public float height = 0;//目标对象Y方向的偏移
    [Range(0, 1), Tooltip("遮挡后最终的透明度")]
    public float alpha = 0;//遮挡后最终的透明度
    [Range(0, 1), Header("开始变透明的时间")]
    public float fadeTime = 1;//开始变透明的时间
    private int transparentLayer;//需要变透明的物体的层级
    /// <summary>
    /// 保存障碍物的信息
    /// </summary>
    public class TransparentParam
    {
        public Material[] materials = null;
        public Material[] shadermaterials = null;
        public float currentFadeTime = 0;//计时器
        public bool isTransparent = true;//透明状态
    }
    //用字典保存障碍物信息
    private Dictionary<Renderer, TransparentParam> transparentDic = new Dictionary<Renderer, TransparentParam>();
    private List<Renderer> clearList = new List<Renderer>();
    private void Start()
    {
        //得到层
        transparentLayer = 1 << LayerMask.NameToLayer("Transparent");
        
    }
    private void Update()
    {
        if(targetObjecr == null)
        {
            return;
        }
        SetTransparentObject();
        UpdateRayCastHit();
        RemoveTransparent();
    }
    /// <summary>
    /// 设置障碍物属性
    /// </summary>
    public void SetTransparentObject()
    {
        //访问字典中的枚举数，GetEnumerator，返回实例的枚举数
        //枚举数返回集中所有元素一一列举出来，通过MoveNext()得到集合中所有元素
        var var = transparentDic.GetEnumerator();
        //遍历字典
        while (var.MoveNext())//只要判断能进来就说明字典中有值
        {
            //获取当前位置元素
            TransparentParam param = var.Current.Value;
            param.isTransparent = false;
            //设置障碍物的material
            foreach(var mat in param.materials)
            {
               
                param.currentFadeTime += Time.deltaTime;
                float t = param.currentFadeTime / fadeTime;
                 //获得shader中的颜色值
                Color col = mat.GetColor("_Color");
                col.a = Mathf.Lerp(1, alpha, t);
                mat.SetColor("_Color", col);
            }

        }
    }
    /// <summary>
    /// 移除透明材质
    /// </summary>
    public void RemoveTransparent()
    {
        clearList.Clear();
        var var = transparentDic.GetEnumerator();
        while (var.MoveNext())
        {
            if (var.Current.Value.isTransparent == false)
            {
                var.Current.Key.materials = var.Current.Value.shadermaterials;
                clearList.Add(var.Current.Key);
            }
        }
        foreach(var v in clearList)
        {
            transparentDic.Remove(v);
        }

    }
    public void UpdateRayCastHit()
    {
        RaycastHit[] raycastHits = null;
        Vector3 targetPos = targetObjecr.position + new Vector3(0, height, 0);
        Vector3 viewDir = (targetPos - transform.position).normalized;
        float distance = Vector3.Distance(targetPos, transform.position);
        Ray ray = new Ray(transform.position, viewDir);
        raycastHits = Physics.RaycastAll(ray, distance, transparentLayer);
        //画一条涉嫌，方便观察
        Debug.DrawLine(transform.position, targetPos, Color.red);
        foreach(var hit in raycastHits)
        {
            Renderer[] renderers = hit.collider.GetComponentsInChildren<Renderer>();
            //把碰撞物体添加到字典中
            foreach (Renderer r in renderers)
            {
                AddTransparent(r);
            }
        }
    }
    /// <summary>
    /// 添加字典元素
    /// </summary>
    public void AddTransparent(Renderer renderer)
    {
        TransparentParam param = null;
        transparentDic.TryGetValue(renderer, out param);
        if(param == null)
        {
            param = new TransparentParam();
            //添加到字典
            transparentDic.Add(renderer, param);
            param.shadermaterials = renderer.sharedMaterials;
            param.materials = renderer.materials;
            foreach(var v in param.materials)
            {
                v.shader = Shader.Find("Unlit/Occlusion");
            }
        }
        param.isTransparent = true;
    }
}
