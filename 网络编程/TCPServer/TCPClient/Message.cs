using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TCPClient
{
    class Message
    {
        public static byte[] GetBytes(string s)
        {
            
                //获取要发送的字符串的字节数组
                byte[] dataBytes = Encoding.UTF8.GetBytes(s);
                //获取要发送的数据字节数组的数组长度
                int dataLength = dataBytes.Length;
                Console.WriteLine("消息长度："+dataLength);
                //将表示数组长度的数字转换为字节数组
                byte[] lengthBytes = BitConverter.GetBytes(dataLength);
                //将表示消息长度的字节数组放在消息体字节数组之前，一起发送给服务器
                byte[] message = lengthBytes.Concat(dataBytes).ToArray();
                return message;
            

        }
       
    }
}
