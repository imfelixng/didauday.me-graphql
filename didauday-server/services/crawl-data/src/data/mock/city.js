const cities = [
    {
        name: "Đà Nẵng",
        zipcode: "550000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                108.2022,
                16.0544
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1566264045/didauday.me/img_city_da-nang.jpg"
    },
    {
        name: "Hòa Bình",
        zipcode: "350000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.3391,
                20.8275,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1566479834/didauday.me/img_city_hoa-binh.jpg"
    },
    {
        name: "An Giang",
        zipcode: "880000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.1259,
                10.5216,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567013725/didauday.me/img_city_an-giang.jpg"
    },
    {
        name: "Bà Rịa Vũng Tàu",
        zipcode: "790000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                107.2430,
                10.5417,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567014143/didauday.me/img_city_ba-ria-vung-tau.jpg"
    },
    {
        name: "Bạc Liêu",
        zipcode: "260000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.7216,
                9.2940,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567014247/didauday.me/img_city_bac-lieu.jpg"
    },
    {
        name: "Bắc Kạn",
        zipcode: "960000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.8345,
                22.1443,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567014341/didauday.me/img_city_bac-kan.jpg"
    },
    {
        name: "Bắc Giang",
        zipcode: "220000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.1975,
                21.2820,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567014441/didauday.me/img_city_bac-giang.jpg"
    },
    {
        name: "Bắc Ninh",
        zipcode: "790001",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.0710,
                21.1782,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567014605/didauday.me/img_city_bac-ninh.jpg"
    },
    {
        name: "Bến Tre",
        zipcode: "930000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.3756,
                10.2434,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567014746/didauday.me/img_city_ben-tre.jpg"
    },
    {
        name: "Bình Dương",
        zipcode: "590000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.4770,
                11.3254,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567014866/didauday.me/img_city_binh-duong.jpg"
    },
    {
        name: "Bình Định",
        zipcode: "820000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                109.1077,
                13.8860,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567014984/didauday.me/img_city_binh-dinh.jpg"
    },
    {
        name: "Bình Phước",
        zipcode: "830000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.7235,
                11.7512,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567015123/didauday.me/img_city_binh-phuoc.jpg"
    },
    {
        name: "Bình Thuận",
        zipcode: "800000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                108.0721,
                11.0904,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567015253/didauday.me/img_city_binh-thuan.jpg"
    },
    {
        name: "Cà Mau",
        zipcode: "970000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.1961,
                9.1527,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567015356/didauday.me/img_city_ca-mau.jpg"
    },
    {
        name: "Cao Bằng",
        zipcode: "270000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.2640,
                22.6666,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567015445/didauday.me/img_city_cao-bang.jpg"
    },
    {
        name: "Cần Thơ",
        zipcode: "900000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.7469,
                10.0452,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567015550/didauday.me/img_city_can-tho.jpg"
    },
    {
        name: "Điện Biên",
        zipcode: "380000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                103.0322,
                21.4064,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567015669/didauday.me/img_city_dien-bien.jpg"
    },
    {
        name: "Đắk Lắk",
        zipcode: "630000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                108.2378,
                12.7100,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567015791/didauday.me/img_city_dak-lak.jpg"
    },
    {
        name: "Đắc Nông",
        zipcode: "640000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                107.6098,
                12.2646,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016008/didauday.me/img_city_dak-nong.jpg"
    },
    {
        name: "Đồng Nai",
        zipcode: "810000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                107.1676,
                11.0686,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016086/didauday.me/img_city_dong-nai.jpg"
    },
    {
        name: "Đồng Tháp",
        zipcode: "870000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.6882,
                10.4938,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016177/didauday.me/img_city_dong-thap.jpg"
    },
    {
        name: "Gia Lai",
        zipcode: "600000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                108.1094,
                13.8079,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016312/didauday.me/img_city_gia-lai.jpg"
    },
    {
        name: "Hà Giang",
        zipcode: "310000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                104.9784,
                22.8026,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016411/didauday.me/img_city_ha-giang.jpg"
    },
    {
        name: "Hà Nam",
        zipcode: "400000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.9230,
                20.5835,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016492/didauday.me/img_city_ha-nam.jpg"
    },
    {
        name: "Hà Nội",
        zipcode: "100000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.8342,
                21.0278,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016599/didauday.me/img_city_ha-noi.jpg"
    },
    {
        name: "Hà Tĩnh",
        zipcode: "480000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.8877,
                18.3560,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016764/didauday.me/img_city_ha-tinh.jpg"
    },
    {
        name: "Hải Dương",
        zipcode: "170000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.3146,
                20.9373,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016847/didauday.me/img_city_hai-duong.jpg"
    },
    {
        name: "Hải Phòng",
        zipcode: "180000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.6881,
                20.8449,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567016944/didauday.me/img_city_hai-phong.jpg"
    },
    {
        name: "Hậu Giang",
        zipcode: "910000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.6413,
                9.7579,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567017026/didauday.me/img_city_hau-giang.jpg"
    },
    {
        name: "TP. Hồ Chí Minh",
        zipcode: "700000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.6297,
                9.7579,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567017122/didauday.me/img_city_tp-ho-chi-minh.jpg"
    },
    {
        name: "Hưng Yên",
        zipcode: "160000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.0578,
                20.6547,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567091412/didauday.me/img_city_hung-yen.jpg"
    },
    {
        name: "Khánh Hoà",
        zipcode: "650000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                109.0526,
                12.2585,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567091556/didauday.me/img_city_khanh-hoa.jpg"
    },
    {
        name: "Kiên Giang",
        zipcode: "920000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                105.1259,
                9.8250,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567093526/didauday.me/img_city_kien-giang.jpg"
    },
    {
        name: "Kon Tum",
        zipcode: "580000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                108.0005,
                14.3497,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567093733/didauday.me/img_city_kon-tum.jpg"
    },
    {
        name: "Lai Châu",
        zipcode: "390000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                103.4703,
                22.3862,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567093841/didauday.me/img_city_lai-chau.jpg"
    },
    {
        name: "Lạng Sơn",
        zipcode: "240000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                106.7615,
                21.8537,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567093954/didauday.me/img_city_lang-son.jpg"
    },
    {
        name: "Lào Cai",
        zipcode: "330000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                104.1487,
                22.3381,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567094051/didauday.me/img_city_lao-cai.jpg"
    },
    {
        name: "Lâm Đồng",
        zipcode: "670000",
        country: "Việt Nam",
        location: {
            type: "Point",
            coordinates: [
                108.1429,
                11.5753,
            ]
        },
        image: "https://res.cloudinary.com/ngquangan/image/upload/v1567094209/didauday.me/img_city_lam-dong.jpg"
    },
];

export default cities;