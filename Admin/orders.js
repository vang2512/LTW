const Orders = [
    {
        productName: 'Cappuccino',
        productNumber: 'Coffee#01',
        paymentStatus: 'Chuyển khoản',
        status: 'Đã thanh toán'
    },
    {
        productName: 'Tiramisu',
        productNumber: 'Cake#01',
        paymentStatus: 'Tiền mặt',
        status: 'Đang xử lí'
    },
    {
        productName: 'Espresso',
        productNumber: 'Coffee#03',
        paymentStatus: 'Chuyển khoản',
        status: 'Đã thanh toán'
    },
]

const orders = [
    {
        number: 1,
        id: 'HD01',
        customerName: 'Nguyễn Văn A',
        products: [
            { name: 'Cappuccino', quantity: 2 },
            { name: 'Tiramisu ', quantity: 1}
        ],
        price: 120000,
        status: 'Hoàn thành'
    },
    {
        number: 2,
        id: 'HD02',
        customerName: 'Phan Thị Thanh',
        products: [
            { name: 'Cappuccino', quantity: 2 },
            { name: 'Bàn nhỏ 2 người', quantity: 1 }
        ],
        price: 200000,
        status: 'Đang xử lí'
    },
    {
        number: 3,
        id: 'HD03',
        customerName: 'Lê Hà Vinh',
        products: [
            { name: 'Bàn trung 4 người', quantity: 1 }
        ],
        price: 150000,
        status: 'Đã đặt cọc'
    }
]