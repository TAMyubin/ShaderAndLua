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
            clientSocket.Connect(new IPEndPoint(IPAddress.Parse("127.0.0.1"), 9777));

            //接收服务器发送的信息
            //byte[] dataBuffer = new byte[1024];
            //int count = clientSocket.Receive(dataBuffer);
            //string msg = Encoding.UTF8.GetString(dataBuffer, 0, count);
            //Console.WriteLine("接收到服务器发送的信息:" + msg);



            string s = "谭羽彬谭羽彬谭羽彬谭羽彬  谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬     谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬" +
                "谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬" +
                "谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬" +
                "谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬" +
                "谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬谭羽彬";
          
            clientSocket.Send(Message.GetBytes(s));

            for (int i = 0; i < 100; i++)
            {
                clientSocket.Send(Message.GetBytes(i.ToString() + "ddd "));
            }
            //  Console.ReadKey();
            //给服务器发送一条消息
            //while (true)
            //{
            //    string s = Console.ReadLine();
            //    if (s == "q")
            //    {
            //        clientSocket.Close();
            //        return;
            //    }
            //   byte[] data = Message.GetBytes(s);
            //    if (data != null)
            //    {
            //        clientSocket.Send(data);
            //    }

            //}

            Console.ReadKey();
        }
    }
}
