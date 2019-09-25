using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Sockets;
using System.Net;
namespace TCPServer
{
    class Program
    {
        static void Main(string[] args)
        {
            StartServerAsync();
            Console.ReadKey();
        }
        static byte[] dataBuffer = new byte[1024];
        static void StartServerAsync()
        {
            //创建一个Socket对象
            Socket serverSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            //绑定IP和端口 回炉地址127.0.0.1或本机地址192.168.5.106
            IPAddress iPAddress = IPAddress.Parse("192.168.5.107");
            //指定端口号
            IPEndPoint iPEndPoint = new IPEndPoint(iPAddress, 9888);
            //给Socket对象绑定IP和端口号
            serverSocket.Bind(iPEndPoint);
            Console.WriteLine("服务器启动");
            //开启监听 开启监听后才能接收连接 表示多大监听队列的个数，不是客户端的最大连接数
            serverSocket.Listen(100);//最大同时监听数量 0为不限制
            //等待客户端的连接
            //会产生阻塞，同步的接收函数

            //当服务器接收到一个客户端的接入时，会执行回调函数
            serverSocket.BeginAccept(AcceptCallBack,serverSocket);
      
        }

        static void AcceptCallBack(IAsyncResult ar)
        {
            Socket serverSocket = ar.AsyncState as Socket;
              Socket clientSocket= serverSocket.EndAccept(ar);
            //已经有客户端接入
            Console.WriteLine("有客户端接入服务器:" + clientSocket.RemoteEndPoint);
            //给客户端发信息
            clientSocket.Send(Encoding.UTF8.GetBytes("以成功接入服务器"));

            //开启异步接收客户端数据
            //第一个参数：字节数组，用来存放收到的数据
            //当接收到数据是；socket会调用回调函数
            clientSocket.BeginReceive(dataBuffer, 0, 1024, SocketFlags.None, ReceiveCallBack, clientSocket);
            serverSocket.BeginAccept(AcceptCallBack, serverSocket);

        }
        static void ReceiveCallBack(IAsyncResult ar)
        {
            Socket clientSocket = null;
            try
            {
                clientSocket = ar.AsyncState as Socket;
                int count = clientSocket.EndReceive(ar);
                if (count == 0)
                {
                    Console.WriteLine(clientSocket.RemoteEndPoint + "客户端请求离开");
                    clientSocket.Close();
                    return;
                }
                string msg = Encoding.UTF8.GetString(dataBuffer, 0, count);
                Console.WriteLine("接收到客户端" + clientSocket.RemoteEndPoint + "发来的消息" + msg);
                clientSocket.BeginReceive(dataBuffer, 0, 1024, SocketFlags.None, ReceiveCallBack, clientSocket);

            }catch(Exception e)
            {
                Console.WriteLine(e);
                if (clientSocket != null)
                {
                    clientSocket.Close();
                }
            }
        }
        static void StartServerSync()
        {
            //创建一个Socket对象
            Socket serverSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            //绑定IP和端口 回炉地址127.0.0.1或本机地址192.168.5.106
            IPAddress iPAddress = IPAddress.Parse("192.168.5.106");
            //指定端口号
            IPEndPoint iPEndPoint = new IPEndPoint(iPAddress, 9888);
            //给Socket对象绑定IP和端口号
            serverSocket.Bind(iPEndPoint);

            Console.WriteLine("服务器启动");
            //开启监听 开启监听后才能接收连接 表示多大监听队列的个数，不是客户端的最大连接数
            serverSocket.Listen(0);//最大同时监听数量 0为不限制
            //等待客户端的连接
            //会产生阻塞，同步的接收函数
            Socket clientSocket = serverSocket.Accept();
            //已经有客户端接入
            Console.WriteLine("有客户端接入服务器:" + clientSocket.RemoteEndPoint);
            //给客户端发信息
            clientSocket.Send(Encoding.UTF8.GetBytes("以成功接入服务器"));
            //接收客户端的消息
            //定义一个用来存放接收数据的字节数组
            //Receive函数会产生阻塞
            byte[] dataBuffer = new byte[1024];
            //返回值表示接受数据的长度
            int count = clientSocket.Receive(dataBuffer);
            //将接收到的字节数组转为字符
            string msgRececive = Encoding.UTF8.GetString(dataBuffer, 0, count);
            Console.WriteLine("接受到客户端发来的信息" + msgRececive);

            //关闭客户端的Socket
            clientSocket.Close();
            //关闭服务器的Socket
            serverSocket.Close();
        }
    }
}
