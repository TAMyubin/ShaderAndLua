using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Snow : MonoBehaviour {

    private MeshFilter m;
    //unity可以支持64000个顶点，雪花4个顶点，最多有16000个顶点
    const int SNOWNUM = 16000;
    //顶点
    private Vector3[] _vertices;
    //三角面
    private int[] _triangles;
    //雪花网格的贴图
    private Vector2[] _uv;
    //雪花的范围
    private float range;
    //偏移量
    private Vector3 move = Vector3.zero;
    private float rangeR;
	// Use this for initialization
	void Start () {

        //mesh = GetComponent<MeshFilter>().mesh;
        ////顶点的坐标
        //mesh.vertices = new Vector3[] { Vector3.zero, new Vector3(0, 1, 0), new Vector3(1, 1, 0), new Vector3(1, 0, 0) };

        //mesh.triangles = new int[] { 0, 1, 2, 0, 2, 3 };

        range = 16f;
        rangeR = 1.0f / range;
        //4个顶点
        _vertices = new Vector3[SNOWNUM * 4];
        for (int i = 0; i < SNOWNUM; i++)
        {
            float x = Random.Range(-range, range);
            float y = Random.Range(-range, range);
            float z = Random.Range(-range, range);

            Vector3 point = new Vector3(x, y, z);

            _vertices[i * 4 + 0] = point;
            _vertices[i * 4 + 1] = point;
            _vertices[i * 4 + 2] = point;
            _vertices[i * 4 + 3] = point;
        }
        //两个三角面 6个点
        _triangles = new int[SNOWNUM * 6];
        for (int i = 0; i < SNOWNUM; i++)
        {
            _triangles[i * 6 + 0] = i * 4 + 0;
            _triangles[i * 6 + 1] = i * 4 + 1;
            _triangles[i * 6 + 2] = i * 4 + 2;
            _triangles[i * 6 + 3] = i * 4 + 2;
            _triangles[i * 6 + 4] = i * 4 + 1;
            _triangles[i * 6 + 5] = i * 4 + 3;
        }
        //贴图uv
        _uv = new Vector2[SNOWNUM * 4];
        for (int i = 0; i < SNOWNUM; i++)
        {
            _uv[i * 4 + 0] = new Vector2(0, 0);
            _uv[i * 4 + 1] = new Vector2(1, 0);
            _uv[i * 4 + 2] = new Vector2(0, 1);
            _uv[i * 4 + 3] = new Vector2(1, 1);
        }
        Mesh mesh = new Mesh();
        mesh.name = "Snow";
        mesh.vertices = _vertices;
        mesh.triangles = _triangles;
        mesh.uv = _uv;

        m = GetComponent<MeshFilter>();
        m.sharedMesh = mesh;
	}
	
	// Update is called once per frame
	void LateUpdate () {
        //正前方
        Vector3 targetPosition = Camera.main.transform.TransformPoint(Vector3.forward * range);
        Renderer r = GetComponent<Renderer>();
        r.material.SetVector("_TargetPosition", targetPosition);
        r.material.SetFloat("_Range", range);
        r.material.SetFloat("_Size", 0.1f);
        r.material.SetVector("_Move", move);
        r.material.SetFloat("_RangeR", rangeR);
        r.material.SetVector("_CamUp", Camera.main.transform.up);
        //Mathf.PerlinNoise 返回值随着x，y坐标的移动，连续切平缓的变化的随机值
        float x = (Mathf.PerlinNoise(0f, Time.time * 0.1f) - 0.5f) * 10f;
        float y = -2f;
        float z = (Mathf.PerlinNoise(Time.time * 0.1f, 0f) - 0.5f) * 10f;

        move += new Vector3(x, y, z) * Time.deltaTime;

        move.x = Mathf.Repeat(move.x, range * 2f);
        move.y = Mathf.Repeat(move.y, range * 2f);
        move.z = Mathf.Repeat(move.z, range * 2f);
	}
}
