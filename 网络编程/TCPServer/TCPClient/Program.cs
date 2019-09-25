using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Sockets;
using System.Net;
namespace TCPClient
{
    class Program
    {
        static void Main(string[] args)
        {

            Socket clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            //客户端不需要绑定ip和端口号（动态端口号） 不代表客户端没有
            clientSocket.Connect(new IPEndPoint(IPAddress.Parse("192.168.5.107"), 9888));

            //接收服务器发送的信息
            byte[] dataBuffer = new byte[1024];
            int count = clientSocket.Receive(dataBuffer);
            string msg = Encoding.UTF8.GetString(dataBuffer, 0, count);
            Console.WriteLine("接收到服务器发送的信息:" + msg);
            //给服务器发送一条消息
            while (true)
            {
                string s = Console.ReadLine();
                if (s == "q")
                {
                    clientSocket.Close();
                    return;
                }
                clientSocket.Send(Encoding.UTF8.GetBytes(s));
            }
            
         //   clientSocket.Close();
        }
    }
}
