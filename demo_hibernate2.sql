-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 05, 2022 lúc 08:45 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demo_hibernate2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`username`, `password`, `full_name`, `birthday`, `gender`) VALUES
('acc1', '123', 'phat', '2022-04-15', 'male'),
('acc2', '123', 'phat', '2022-04-01', 'male'),
('acc3', '123', 'phatne', '2022-04-03', 'male'),
('acc4', '123', 'phat nguyen', '2020-04-03', 'female');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'accesories'),
(2, 'flower gifts'),
(3, 'specials'),
(4, 'hollidays gifts'),
(7, 'birthday flowers'),
(9, 'Grand opening flower'),
(10, 'Condolence flowers\n'),
(14, 'Phalaenopsis orchids\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` date NOT NULL,
  `username` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `name`, `status`, `created`, `username`) VALUES
(20, 'New Order', 0, '2022-04-03', 'acc1'),
(21, 'New Order', 0, '2022-04-03', 'acc1'),
(22, 'New Order', 0, '2022-04-03', 'acc1'),
(23, 'New Order', 0, '2022-04-03', 'acc1'),
(24, 'New Order', 0, '2022-04-03', 'acc1'),
(25, 'New Order', 0, '2022-04-03', 'acc1'),
(26, 'New Order', 0, '2022-04-03', 'acc1'),
(27, 'New Order', 0, '2022-04-03', 'acc2'),
(28, 'New Order', 0, '2022-04-03', 'acc2'),
(29, 'New Order', 0, '2022-04-03', 'acc2'),
(30, 'New Order', 0, '2022-04-03', 'acc2'),
(31, 'New Order', 0, '2022-04-03', 'acc4'),
(32, 'New Order', 0, '2022-04-04', 'acc3'),
(33, 'New Order', 0, '2022-04-04', 'acc4'),
(34, 'New Order', 0, '2022-04-05', 'acc3'),
(35, 'New Order', 0, '2022-04-05', 'acc3'),
(36, 'New Order', 0, '2022-04-05', 'acc3'),
(37, 'New Order', 0, '2022-04-05', 'acc4'),
(38, 'New Order', 0, '2022-04-05', 'acc4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordersdetail`
--

CREATE TABLE `ordersdetail` (
  `productid` int(11) NOT NULL,
  `ordersid` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ordersdetail`
--

INSERT INTO `ordersdetail` (`productid`, `ordersid`, `price`, `quantity`) VALUES
(1, 26, 20, 1),
(38, 27, 15, 2),
(1, 28, 20, 3),
(34, 30, 90, 1),
(2, 31, 63, 1),
(32, 32, 10, 1),
(7, 33, 12, 4),
(7, 34, 12, 1),
(42, 35, 60, 1),
(40, 36, 63, 1),
(43, 37, 90, 1),
(3, 38, 24, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` date NOT NULL,
  `description` text DEFAULT NULL,
  `categoryid` int(11) NOT NULL,
  `photo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `quantity`, `status`, `created`, `description`, `categoryid`, `photo`) VALUES
(1, 'Floom', 20, 4, 1, '2022-04-02', 'Shopping with Floom is incredibly easy and always rewarding. These clever cats (they\'re humans really, not cats) collate independent florists in the UK into one handy service, which means all you need to do is input your postcode, when you need the flowers to be delivered, and b(l)oom – you\'ll find a selection of beautiful options at your fingertips. Refine your search further by price, occasion, flower type and even colour. There\'s no easier way to find the perfect petals. Floom also offers same-day delivery. As stress-free as it gets really. ', 1, 'flower1.png'),
(2, 'Appleyard Flowers', 63, 15, 0, '2020-08-11', 'Gorgeous, hand-tied bouquets by experienced florists are what you\'ll find at Appleyard Flowers. Each season, they design a new range, which means you\'re guaranteed something oh-so cutting edge. Their Mother\'s Day edit features classic roses galore, plus some delectably show-off hydrangeas. Lovely.', 4, 'flower8.png'),
(3, 'Flowerbx', 24, 12, 1, '2021-08-12', 'The founder of Flowerbx previously worked at Tom Ford for 20 years, which means the bouquets she now ships are super stylish (and really should smell damn nice, too). Specialising in single-variety bunches, this florist offers an elegantly simple, refreshingly clean aesthetic, that you\'ll be hard-pressed to find anywhere else. Just sort by occasion or flower type, pick the petals you like the most and select the number of stems you\'re after. And then? Well, you\'re away. Sleek and sexy flowers, delivered prompt, baby.', 2, 'flower2.png'),
(4, 'Bloom & Wild', 60, 34, 0, '2020-08-12', 'Bloom & Wild are the pioneering brand behind letterbox flowers: beautiful blooms that arrive in a flat rectangle of a box that is perfectly sized to slide through the front door. The major advantage? The lucky recipient of your gift doesn’t need to be at home to pick up their flowers. The other lesser-known benefit is Bloom & Wild tend to deliver their flowers when they’re still in the bud, so you get to marvel at them opening and enjoy a much longer shelf-life than most cut flowers have. This Mother’s Day, they’re offering a range of gorgeous, uplifting bouquets in here-comes-the-sunshine shades. We love The Zhen with its Victoriana-approved pink stocks, and The Emily with its bold flashes of bright yellow lilies.', 9, 'flower9.png'),
(5, 'The Flower Station', 23, 27, 1, '2020-08-17', 'Flower Station is a true saviour for those of us with a memory like a goldfish or a severe case of last-minute-itis. It offers Londoners 24-hour service and same-day delivery (even on a Sunday) on orders before 6pm. Their bouquets vary in price, so there\'s something for every budget. But one thing you can always count on is the top-notch quality of their pretty petals. These flowers really do look the business. It\'s easy and effective – what\'s not to love! ', 14, 'flower10.png'),
(6, 'Pulbrook and Gould', 4.5, 2, 0, '2021-08-20', 'Quite possibly the classiest florist in London, Pulbrook and Gould have been delivering the highest calibre blooms for the past 66 years and counting. If your mama loves luxury, treat her to one of their peerless bouquets inspired by English country gardens and the naturalised aesthetic of Constance Spry. The’ve created two spectacular domed bunches for Mother’s Day, along with a lovely mauve-shaded posy made of anemones and clematis. So pretty.', 3, 'flower3.png'),
(7, 'Floom', 12, 222, 1, '2021-09-25', 'Shopping with Floom is incredibly easy and always rewarding. These clever cats (they\'re humans really, not cats) collate independent florists in the UK into one handy service, which means all you need to do is input your postcode, when you need the flowers to be delivered, and b(l)oom – you\'ll find a selection of beautiful options at your fingertips. Refine your search further by price, occasion, flower type and even colour. There\'s no easier way to find the perfect petals. Floom also offers same-day delivery. As stress-free as it gets really. ', 1, 'flower5.png'),
(9, 'Flowerbx', 11, 888, 1, '2021-10-11', 'The founder of Flowerbx previously worked at Tom Ford for 20 years, which means the bouquets she now ships are super stylish (and really should smell damn nice, too). Specialising in single-variety bunches, this florist offers an elegantly simple, refreshingly clean aesthetic, that you\'ll be hard-pressed to find anywhere else. Just sort by occasion or flower type, pick the petals you like the most and select the number of stems you\'re after. And then? Well, you\'re away. Sleek and sexy flowers, delivered prompt, baby.', 2, 'flower7.png'),
(32, 'Floom', 10, 16, 0, '2022-03-24', 'Shopping with Floom is incredibly easy and always rewarding. These clever cats (they\'re humans really, not cats) collate independent florists in the UK into one handy service, which means all you need to do is input your postcode, when you need the flowers to be delivered, and b(l)oom – you\'ll find a selection of beautiful options at your fingertips. Refine your search further by price, occasion, flower type and even colour. There\'s no easier way to find the perfect petals. Floom also offers same-day delivery. As stress-free as it gets really. ', 1, 'flower6.png'),
(34, 'Grace & Thorne', 90, 14, 0, '2022-03-24', 'One of the best things about East London florists Grace & Thorne, is that they deliver to most parts of London on a Sunday – even offering same-day if you order before midday (although that\'s cutting it fine, so choice may be restricted). These guys have done incredibly well since launching their tiny studio on Kingsland Road in 2011, offering artful bespoke designs that favour a wilder aesthetic. We\'re big fans. If the mother figure in your life likes their greens, wants something more Insta than Facebook, and enjoys the more natural side of life, they\'ll love these. ', 10, 'flower11.png'),
(38, 'Petalon', 15, 10, 1, '2022-04-03', 'Don\'t panic, this isn\'t some trick to get you delivering your own flowers by bike, that definitely says Petalon and not Peloton. Unlike many flower delivery companies, which source a local florist to deliver your flowers nationawide, Petalon provide bouquets from their very own farm in Cornwall. That means that every week you\'ll find a unique new handful of bouquets to choose from. They come by bike, hand-tied and wrapped in hessian, so all the packaging is either biodegradable or recyclable, making for one very green service. The quality is excellent too and the arrangements are always beautiful.', 7, 'flower4.png'),
(39, 'Pulbrook and Gould 2', 4.5, 2, 1, '2021-08-20', 'Quite possibly the classiest florist in London, Pulbrook and Gould have been delivering the highest calibre blooms for the past 66 years and counting. If your mama loves luxury, treat her to one of their peerless bouquets inspired by English country gardens and the naturalised aesthetic of Constance Spry. The’ve created two spectacular domed bunches for Mother’s Day, along with a lovely mauve-shaded posy made of anemones and clematis. So pretty.', 3, 'flower12.png'),
(40, 'Appleyard Flowers 2', 63, 15, 1, '2020-08-11', 'Gorgeous, hand-tied bouquets by experienced florists are what you\'ll find at Appleyard Flowers. Each season, they design a new range, which means you\'re guaranteed something oh-so cutting edge. Their Mother\'s Day edit features classic roses galore, plus some delectably show-off hydrangeas. Lovely.', 4, 'flower13.png'),
(41, 'Petalon 2', 15, 10, 0, '2022-04-03', 'Don\'t panic, this isn\'t some trick to get you delivering your own flowers by bike, that definitely says Petalon and not Peloton. Unlike many flower delivery companies, which source a local florist to deliver your flowers nationawide, Petalon provide bouquets from their very own farm in Cornwall. That means that every week you\'ll find a unique new handful of bouquets to choose from. They come by bike, hand-tied and wrapped in hessian, so all the packaging is either biodegradable or recyclable, making for one very green service. The quality is excellent too and the arrangements are always beautiful.', 7, 'flower14.png'),
(42, 'Bloom & Wild 2', 60, 34, 1, '2020-08-12', 'Bloom & Wild are the pioneering brand behind letterbox flowers: beautiful blooms that arrive in a flat rectangle of a box that is perfectly sized to slide through the front door. The major advantage? The lucky recipient of your gift doesn’t need to be at home to pick up their flowers. The other lesser-known benefit is Bloom & Wild tend to deliver their flowers when they’re still in the bud, so you get to marvel at them opening and enjoy a much longer shelf-life than most cut flowers have. This Mother’s Day, they’re offering a range of gorgeous, uplifting bouquets in here-comes-the-sunshine shades. We love The Zhen with its Victoriana-approved pink stocks, and The Emily with its bold flashes of bright yellow lilies.', 9, 'flower15.png'),
(43, 'Grace & Thorne', 90, 14, 0, '2022-03-24', 'One of the best things about East London florists Grace & Thorne, is that they deliver to most parts of London on a Sunday – even offering same-day if you order before midday (although that\'s cutting it fine, so choice may be restricted). These guys have done incredibly well since launching their tiny studio on Kingsland Road in 2011, offering artful bespoke designs that favour a wilder aesthetic. We\'re big fans. If the mother figure in your life likes their greens, wants something more Insta than Facebook, and enjoys the more natural side of life, they\'ll love these. ', 10, 'flower16.png'),
(44, 'The Flower Station', 23, 27, 0, '2020-08-17', 'Flower Station is a true saviour for those of us with a memory like a goldfish or a severe case of last-minute-itis. It offers Londoners 24-hour service and same-day delivery (even on a Sunday) on orders before 6pm. Their bouquets vary in price, so there\'s something for every budget. But one thing you can always count on is the top-notch quality of their pretty petals. These flowers really do look the business. It\'s easy and effective – what\'s not to love! ', 14, 'flower17.png'),
(45, 'Pulbrook and Gould 3', 4.5, 2, 1, '2021-08-20', 'Quite possibly the classiest florist in London, Pulbrook and Gould have been delivering the highest calibre blooms for the past 66 years and counting. If your mama loves luxury, treat her to one of their peerless bouquets inspired by English country gardens and the naturalised aesthetic of Constance Spry. The’ve created two spectacular domed bunches for Mother’s Day, along with a lovely mauve-shaded posy made of anemones and clematis. So pretty.', 3, 'flower18.png');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Chỉ mục cho bảng `ordersdetail`
--
ALTER TABLE `ordersdetail`
  ADD PRIMARY KEY (`ordersid`,`productid`) USING BTREE,
  ADD KEY `ordersid` (`ordersid`),
  ADD KEY `ordersdetail_ibfk_2` (`productid`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`categoryid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- Các ràng buộc cho bảng `ordersdetail`
--
ALTER TABLE `ordersdetail`
  ADD CONSTRAINT `ordersdetail_ibfk_1` FOREIGN KEY (`ordersid`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `ordersdetail_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
