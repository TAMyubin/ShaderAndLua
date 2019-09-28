using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Sockets;


namespace ChatRoomServer
{
    class Program
    {
        private static Socket serverSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        public static List<ClientPeer> clientList = new List<ClientPeer>();
        static void Main(string[] args)
        {
            StartServer();
            Console.ReadKey();
        }
        static void StartServer()
        {
            IPAddress ip = IPAddress.Parse("127.0.0.1");
            IPEndPoint point = new IPEndPoint(ip, 9777);
            serverSocket.Bind(point);
            serverSocket.Listen(100);
            Console.WriteLine("服务器启动成功");
            serverSocket.BeginAccept(AcceptCallBack,serverSocket);
        }
        private static void AcceptCallBack(IAsyncResult ar)
        {
            Socket serverSocket = ar.AsyncState as Socket;
            ClientPeer client = new ClientPeer();
            client.userSocket = serverSocket.EndAccept(ar);
            Console.WriteLine("客户端接入服务器：" + client.userSocket.RemoteEndPoint);
            clientList.Add(client);
            //接收消息
            client.ReceiveMessage();
            serverSocket.BeginAccept(AcceptCallBack,serverSocket);
        }
    }
}
