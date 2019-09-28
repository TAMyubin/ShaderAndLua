using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TCPServer
{
    class ReadMessage
    {
        //用来接收数据的字节数组
        private byte[] data = new byte[1024];
        //定义一个标志位，表示当前读取到那个位置
        private int startIndex = 0;
        public byte[] Data
        {
            get { return data; }
        }
        public int StartIndex
        {
            get { return startIndex; }
        }
        public int RemainSize
        {
            get { return data.Length - startIndex; }
        }
        public void AddStartIndex(int count)
        {
            startIndex += count;
        }
        public void ReadMessages()
        {
            while (true)
            {
                if (startIndex <= 4)          
                    return;
                int msgLength= BitConverter.ToInt32(data, 0);
                if ((StartIndex - 4) >= msgLength)
                {
                    string s = Encoding.UTF8.GetString(data,4,msgLength);
                    Console.WriteLine("解析出一条消息:"+s);
                    //第一个参数是被拷贝的数组
                    //第二个参数是从哪个元素开始拷贝
                    //第三个参数是拷贝到的数组
                    //第四个参数表示拷贝到数组的起始位置
                    Array.Copy(data, msgLength + 4,data,0,startIndex- msgLength -4);
                    //更新StartIndex 
                    startIndex -= (msgLength + 4);
                }
                else
                {
                    break;
                }
         

            }
        }
    }
}
