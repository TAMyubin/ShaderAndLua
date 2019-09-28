using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Sockets;

namespace ChatRoomServer
{
    class ClientPeer
    {
        public Socket userSocket;
        public string userName;

        
        const int DataBufferLength = 1024;
        private byte[] dataBuffer = new byte[DataBufferLength];
        private int startIndex = 0;
        private int RemainSize
        {
            get { return dataBuffer.Length - startIndex; }
        }
        private int msgCount = 0;


        Queue<byte[]> receiveQueue = new Queue<byte[]>();
        List<byte[]> dataBufferList = new List<byte[]>();
        public void ReceiveMessage()
        {
            if (RemainSize <= 0)
            {
                byte[] data = new byte[DataBufferLength];
                dataBuffer.CopyTo(data,0);
                dataBufferList.Add(data);
                userSocket.BeginReceive(dataBuffer, 0, dataBuffer.Length, SocketFlags.None, ReceiveCallBacke, null);
            }
            else
            {
                userSocket.BeginReceive(dataBuffer, startIndex, RemainSize, SocketFlags.None, ReceiveCallBacke, null);

            }
        }
        public void ReceiveCallBacke(IAsyncResult ar)
        {
            int count = userSocket.EndReceive(ar);
            if(count == 0)
            {
                Console.WriteLine(userSocket.RemoteEndPoint + "客户端请求离开");
                userSocket.Close();
                Program.clientList.Remove(this);
                return;
            }
            startIndex += count;
            while (true)
            {
                if (startIndex <= 4) break;
 
                if (msgCount != 0)//拆包
                {
                    if(startIndex - 4 >= msgCount)
                    {
                        byte[] data = (byte[])dataBufferList[0].Clone();
                        for(int i = 1; i < dataBufferList.Count; i++)
                        {
                          data = data.Concat(dataBufferList[i]).ToArray();
                        }
                        data = data.Concat(dataBuffer).ToArray();
                        byte[] msgdata = data.Skip(4).Take(msgCount).ToArray();

                        Array.Copy(data,msgCount+4,dataBuffer,0,data.Length - (msgCount+4));
                        startIndex -= (msgCount + 4);
                        msgCount = 0;
                        dataBufferList.Clear();
                        receiveQueue.Enqueue(msgdata);
                    }
                }
                else
                {
                     msgCount = BitConverter.ToInt32(dataBuffer, 0);
                    if ((startIndex - 4) >= msgCount)//粘包
                    {
                        byte[] data = dataBuffer.Skip(4).Take(msgCount).ToArray();
                        receiveQueue.Enqueue(data);
                        Array.Copy(dataBuffer, msgCount + 4, dataBuffer, 0, startIndex - (4 + msgCount));
                        startIndex -= (msgCount + 4);
                        msgCount = 0;
                    }
                    else
                    {
                        break;
                    }
                }
    
            }
            ReceiveMessage();
            OutPut();
        }
        private void OutPut()
        {
            while (receiveQueue.Count > 0)
            {
                byte[] data = receiveQueue.Dequeue();
                string s= Encoding.UTF8.GetString(data);
                Console.WriteLine(s);
            }
        }
    }
}
