using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Drawing;
using iTextSharp.text.pdf;
using System.IO;
using CDSSoftware;


namespace Danfe.relatorios
{
    class CodigoBarra
    {
        public byte[] GeraCodBarra(string chave)
        {
            BarcodeInter25 inter = new BarcodeInter25();
            Barcode128 bar = new Barcode128(); 
            bar.CodeType = Barcode128.CODE_C;
            bar.Code = chave;
            bar.BarHeight = 50;
            bar.N = 3;
            //bar.CreateDrawingImage(Color.Black, Color.White).Save(@"c:\imagem.jpg",
            //ImageFormat.Jpeg);
            Image img = bar.CreateDrawingImage(Color.Black, Color.White);

            MemoryStream ms = new MemoryStream();
            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            return ms.ToArray();
        }

        public Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Image returnImage = Image.FromStream(ms);
            return returnImage;
        }       
    }
}
