const Orders = [
    {
        productName: 'Cappuccino',
        productNumber: 'Coffee#01',
        paymentStatus: 'Transfer',
        status: 'Pending'
    },
    {
        productName: 'Tiramisu',
        productNumber: 'Food#01',
        paymentStatus: 'Cash',
        status: 'Paid'
    },
    {
        productName: 'Espresso',
        productNumber: 'Coffee#-3',
        paymentStatus: 'Transfer',
        status: 'Deposit'
    },
]

const orders = [
    {
        number: 1,
        id: 'HD01',
        nameCustomer: 'Nguyễn Văn A',
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
        nameCustomer: 'Phan Thị Thanh',
        products: [
            { name: 'Cappuccino', quantity: 2 },
            { name: 'Bàn nhỏ 2 người', quantity: 1 }
        ],
        price: 200000,
        status: 'Đang xử lí'
    },
    {
        number: 2,
        id: 'HD02',
        nameCustomer: 'Phan Thị Thanh',
        products: [
            { name: 'Bàn trung 4 người', quantity: 1 }
        ],
        price: 150000,
        status: 'Đã đặt cọc'
    }
]