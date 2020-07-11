using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBH_BANDIENTHOAI
{
    public class CartItem
    {
        public string MaHangHoa { get; set; }
        public string TenHangHoa { get; set; }
        public int SoLuongTon { get; set; }
        public float DonGia { get; set; }
        public string Hinh { get; set; }
        public float ThanhTien
        {
            get
            {
                return SoLuongTon * DonGia;
            }
        }
    }
}
