drop database social_network;
create database social_network;
use social_network;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
  post_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT posts_fk_users FOREIGN KEY (user_id) REFERENCES users(user_id)
) ;

CREATE TABLE comments (
  comment_id INT AUTO_INCREMENT PRIMARY KEY,
  post_id INT NOT NULL,
  user_id INT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT comments_fk_posts FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
  CONSTRAINT comments_fk_users FOREIGN KEY (user_id) REFERENCES users(user_id)
) ;


CREATE TABLE friends (
  user_id INT NOT NULL,
  friend_id INT NOT NULL,
  status VARCHAR(20) CHECK (status IN ('pending','accepted')),
  PRIMARY KEY (user_id, friend_id),
  CONSTRAINT friends_fk_user1 FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT friends_fk_user2 FOREIGN KEY (friend_id) REFERENCES users(user_id)
) ;

CREATE TABLE likes (
  post_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (post_id, user_id),
  CONSTRAINT likes_fk_posts FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
  CONSTRAINT likes_fk_users FOREIGN KEY (user_id) REFERENCES users(user_id)
);


-- Thêm 50 users
INSERT INTO users (username, email, password, created_at) VALUES
('nguyen_van_a', 'nguyenvana@email.com', '$2y$10$abcdef123456', '2024-01-15 08:30:00'),
('tran_thi_b', 'tranthib@email.com', '$2y$10$ghijkl789012', '2024-01-16 09:15:00'),
('le_minh_c', 'leminhc@email.com', '$2y$10$mnopqr345678', '2024-01-17 10:20:00'),
('pham_thu_d', 'phamthud@email.com', '$2y$10$stuvwx901234', '2024-01-18 11:45:00'),
('hoang_van_e', 'hoangvane@email.com', '$2y$10$yzabcd567890', '2024-01-19 13:00:00'),
('vo_thi_f', 'vothif@email.com', '$2y$10$efghij123456', '2024-01-20 14:30:00'),
('dang_minh_g', 'dangminhg@email.com', '$2y$10$klmnop789012', '2024-01-21 15:15:00'),
('bui_thu_h', 'buithuh@email.com', '$2y$10$qrstuv345678', '2024-01-22 16:45:00'),
('do_van_i', 'dovani@email.com', '$2y$10$wxyzab901234', '2024-01-23 08:00:00'),
('ngo_thi_j', 'ngothij@email.com', '$2y$10$cdefgh567890', '2024-01-24 09:30:00'),
('duong_minh_k', 'duongminhk@email.com', '$2y$10$ijklmn123456', '2024-01-25 10:45:00'),
('truong_thu_l', 'truongthul@email.com', '$2y$10$opqrst789012', '2024-01-26 12:00:00'),
('ly_van_m', 'lyvanm@email.com', '$2y$10$uvwxyz345678', '2024-01-27 13:30:00'),
('mai_thi_n', 'maithin@email.com', '$2y$10$abcdef901234', '2024-01-28 14:15:00'),
('ha_minh_o', 'haminh@email.com', '$2y$10$ghijkl567890', '2024-01-29 15:45:00'),
('vu_thu_p', 'vuthup@email.com', '$2y$10$mnopqr123456', '2024-01-30 16:30:00'),
('cao_van_q', 'caovanq@email.com', '$2y$10$stuvwx789012', '2024-01-31 08:15:00'),
('ta_thi_r', 'tathir@email.com', '$2y$10$yzabcd345678', '2024-02-01 09:45:00'),
('dinh_minh_s', 'dinhminhs@email.com', '$2y$10$efghij901234', '2024-02-02 11:00:00'),
('tong_thu_t', 'tongthut@email.com', '$2y$10$klmnop567890', '2024-02-03 12:30:00'),
('phan_van_u', 'phanvanu@email.com', '$2y$10$qrstuv123456', '2024-02-04 08:00:00'),
('luu_thi_v', 'luuthiv@email.com', '$2y$10$wxyzab789012', '2024-02-05 09:30:00'),
('quach_minh_w', 'quachminhw@email.com', '$2y$10$cdefgh345678', '2024-02-06 10:15:00'),
('thach_thu_x', 'thachthux@email.com', '$2y$10$ijklmn901234', '2024-02-07 11:45:00'),
('khong_van_y', 'khongvany@email.com', '$2y$10$opqrst567890', '2024-02-08 13:20:00'),
('mac_thi_z', 'macthiz@email.com', '$2y$10$uvwxyz123456', '2024-02-09 14:00:00'),
('kieu_minh_aa', 'kieuminhaa@email.com', '$2y$10$abcdef789012', '2024-02-10 15:30:00'),
('ong_thu_bb', 'ongthubbb@email.com', '$2y$10$ghijkl345678', '2024-02-11 16:45:00'),
('lac_van_cc', 'lacvancc@email.com', '$2y$10$mnopqr901234', '2024-02-12 08:15:00'),
('chi_thi_dd', 'chithidd@email.com', '$2y$10$stuvwx567890', '2024-02-13 09:00:00'),
('tieu_minh_ee', 'tieuminhee@email.com', '$2y$10$yzabcd123456', '2024-02-14 10:30:00'),
('nghiem_thu_ff', 'nghiemthuff@email.com', '$2y$10$efghij789012', '2024-02-15 11:45:00'),
('kha_van_gg', 'khavangg@email.com', '$2y$10$klmnop345678', '2024-02-16 13:00:00'),
('uong_thi_hh', 'uongthihh@email.com', '$2y$10$qrstuv901234', '2024-02-17 14:30:00'),
('vinh_minh_ii', 'vinhminhii@email.com', '$2y$10$wxyzab567890', '2024-02-18 15:15:00'),
('cam_thu_jj', 'camthujj@email.com', '$2y$10$cdefgh123456', '2024-02-19 16:00:00'),
('than_van_kk', 'thanvankk@email.com', '$2y$10$ijklmn789012', '2024-02-20 08:30:00'),
('giang_thi_ll', 'giangthilll@email.com', '$2y$10$opqrst345678', '2024-02-21 09:45:00'),
('quang_minh_mm', 'quangminhmm@email.com', '$2y$10$uvwxyz901234', '2024-02-22 11:00:00'),
('sa_thu_nn', 'sathunnnn@email.com', '$2y$10$abcdef567890', '2024-02-23 12:15:00'),
('nghia_van_oo', 'nghiavanoo@email.com', '$2y$10$ghijkl123456', '2024-02-24 13:30:00'),
('huyen_thi_pp', 'huyenthipp@email.com', '$2y$10$mnopqr789012', '2024-02-25 14:45:00'),
('phuc_minh_qq', 'phucminhqq@email.com', '$2y$10$stuvwx345678', '2024-02-26 15:20:00'),
('tuan_thu_rr', 'tuanthurr@email.com', '$2y$10$yzabcd901234', '2024-02-27 16:10:00'),
('dao_van_ss', 'daovanss@email.com', '$2y$10$efghij567890', '2024-02-28 08:45:00'),
('bach_thi_tt', 'bachthitt@email.com', '$2y$10$klmnop123456', '2024-02-29 09:20:00'),
('dong_minh_uu', 'dongminhuuu@email.com', '$2y$10$qrstuv789012', '2024-03-01 10:35:00'),
('kim_thu_vv', 'kimthuvv@email.com', '$2y$10$wxyzab345678', '2024-03-02 11:50:00'),
('son_van_ww', 'sonvanww@email.com', '$2y$10$cdefgh901234', '2024-03-03 13:05:00'),
('trang_thi_xx', 'trangthixx@email.com', '$2y$10$ijklmn567890', '2024-03-04 14:25:00');

-- Thêm 50 posts
-- Xóa dữ liệu cũ để tránh trùng ID
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE posts;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO posts (user_id, content, created_at) VALUES
(1, 'Hôm nay thật là một ngày tuyệt vời! ☀️', '2026-01-13 08:00:00'),
(2, 'Vừa hoàn thành dự án mới, cảm giác thật tuyệt!', '2026-01-13 07:30:00'),
(3, 'Ai muốn đi cà phê không? 😊', '2026-01-12 10:15:00'),
(4, 'Chia sẻ một số kinh nghiệm về lập trình React...', '2026-01-12 09:45:00'),
(5, 'Cuối tuần đi du lịch Đà Lạt, ai đã từng đi chưa?', '2026-01-11 13:20:00'),
(6, 'Mới đọc xong một cuốn sách hay, giới thiệu cho mọi người!', '2026-01-11 14:00:00'),
(7, 'Tips để học tiếng Anh hiệu quả hơn 📚', '2026-01-10 15:30:00'),
(8, 'Hôm nay trời đẹp quá, đi chạy bộ thôi! 🏃', '2026-01-10 16:45:00'),
(9, 'Công thức làm bánh flan ngon tuyệt 🍮', '2026-01-09 08:15:00'),
(10, 'Đang tìm việc làm thêm, ai có info không?', '2026-01-09 09:00:00'),
(11, 'Review phim mới cực hay mọi người nên xem!', '2026-01-08 10:30:00'),
(12, 'Mẹo tiết kiệm chi tiêu hàng tháng 💰', '2026-01-08 11:45:00'),
(13, 'Ai biết quán cafe view đẹp ở Hà Nội không?', '2026-01-07 13:00:00'),
(14, 'Vừa mua được chiếc laptop mới, vui quá!', '2026-01-07 14:30:00'),
(15, 'Chia sẻ playlist nhạc chill cho mọi người 🎵', '2026-01-06 15:15:00'),
(16, 'Hướng dẫn chăm sóc cây cảnh trong nhà 🌱', '2026-01-06 16:00:00'),
(17, 'Kinh nghiệm phỏng vấn xin việc thành công', '2026-01-05 08:30:00'),
(18, 'Món ăn yêu thích của bạn là gì? 🍜', '2026-01-05 09:45:00'),
(19, 'Tips tập gym cho người mới bắt đầu 💪', '2026-01-04 11:00:00'),
(20, 'Cuối tuần này làm gì đây? Gợi ý cho mình với!', '2026-01-04 12:15:00'),
(21, 'Vừa học xong khóa học Python, hào hứng quá!', '2026-01-03 13:40:00'),
(22, 'Chia sẻ kinh nghiệm du lịch bụi Thái Lan 🇹🇭', '2026-01-03 14:55:00'),
(23, 'Đang tìm người cùng sở thích chơi cầu lông', '2026-01-02 16:10:00'),
(24, 'Review quán ăn ngon gần công ty 😋', '2026-01-02 08:20:00'),
(25, 'Hôm nay sinh nhật mình! Cảm ơn mọi người 🎂', '2026-01-01 09:35:00'),
(26, 'Tips chụp ảnh đẹp bằng điện thoại 📸', '2025-12-31 10:50:00'),
(27, 'Ai có kinh nghiệm nuôi mèo không, chia sẻ với mình nhé! 🐱', '2025-12-30 12:05:00'),
(28, 'Vừa xem concert cực đã, năng lượng tràn đầy!', '2025-12-29 13:20:00'),
(29, 'Chia sẻ bí quyết trang điểm cho da khô', '2025-12-28 14:35:00'),
(30, 'Đang học lái xe, có ai có tips không? 🚗', '2025-12-27 15:50:00'),
(31, 'Review khóa học marketing online rất chất lượng!', '2025-12-26 17:05:00'),
(32, 'Hôm nay mưa to, ngồi nhà uống trà thôi ☕', '2025-12-25 08:15:00'),
(33, 'Tìm người đồng hành học IELTS cùng nhau', '2025-12-24 09:30:00'),
(34, 'Chia sẻ cách làm slime đơn giản cho các bạn nhỏ', '2025-12-23 10:45:00'),
(35, 'Kinh nghiệm mua nhà ở Hà Nội, hỏi đáp nhé!', '2025-12-22 12:00:00'),
(36, 'Vừa hoàn thành marathon 10km đầu tiên! 🏅', '2025-12-21 13:15:00'),
(37, 'Tips tiết kiệm điện trong mùa hè', '2025-12-20 14:30:00'),
(38, 'Ai có gợi ý món quà ý nghĩa cho bạn gái không?', '2025-12-19 15:45:00'),
(39, 'Chia sẻ kinh nghiệm đi phượt Sa Pa 🏔️', '2025-12-18 17:00:00'),
(40, 'Đang tìm hiểu về đầu tư chứng khoán, ai có kinh nghiệm?', '2025-12-17 08:10:00'),
(41, 'Review sản phẩm skincare mới dùng rất ổn!', '2025-12-16 09:25:00'),
(42, 'Hôm nay thứ 2, chúc mọi người tuần mới vui vẻ! 💼', '2025-12-15 10:40:00'),
(43, 'Chia sẻ cách nấu phở bò chuẩn vị Hà Nội', '2025-12-14 11:55:00'),
(44, 'Tips giảm stress sau giờ làm việc', '2025-12-13 13:10:00'),
(45, 'Vừa đi xem triển lãm tranh rất đẹp! 🎨', '2025-12-12 14:25:00'),
(46, 'Ai có kinh nghiệm thuê chung cư ở Hà Nội?', '2025-12-11 15:40:00'),
(47, 'Chia sẻ playlist nhạc học tập hiệu quả', '2025-12-10 16:55:00'),
(48, 'Review khóa học yoga online tại nhà', '2025-12-09 08:05:00'),
(49, 'Đang tìm người cùng đi leo núi cuối tuần', '2025-12-08 09:20:00'),
(50, 'Tips chăm sóc tóc khỏe đẹp tự nhiên 💇', '2025-12-07 10:35:00');
-- Thêm 50 comments
INSERT INTO comments (post_id, user_id, content, created_at) VALUES
(1, 2, 'Chúc bạn ngày mới tốt lành!', '2024-03-05 08:15:00'),
(1, 3, 'Tích cực quá! 👍', '2024-03-05 08:30:00'),
(2, 4, 'Chúc mừng bạn nhé!', '2024-03-05 09:45:00'),
(3, 5, 'Mình có hứng, khi nào đi?', '2024-03-05 10:30:00'),
(4, 6, 'Bài viết rất hữu ích, cảm ơn bạn!', '2024-03-05 12:00:00'),
(5, 7, 'Mình vừa đi tuần trước, đẹp lắm!', '2024-03-05 13:45:00'),
(5, 8, 'Nhớ mang áo ấm nhé, Đà Lạt lạnh lắm', '2024-03-05 14:00:00'),
(6, 9, 'Tên sách là gì vậy bạn?', '2024-03-05 14:30:00'),
(7, 10, 'Tips này hay đấy, mình sẽ thử!', '2024-03-05 15:45:00'),
(8, 11, 'Chạy bộ buổi sáng tốt cho sức khỏe!', '2024-03-05 17:00:00'),
(9, 12, 'Share công thức cho mình với!', '2024-03-06 08:30:00'),
(10, 13, 'Mình có info, inbox cho bạn nhé', '2024-03-06 09:30:00'),
(11, 14, 'Phim gì vậy? Mình cũng muốn xem', '2024-03-06 10:45:00'),
(12, 15, 'Rất hữu ích, cảm ơn bạn!', '2024-03-06 12:00:00'),
(13, 16, 'Mình biết quán ở Tây Hồ đẹp lắm', '2024-03-06 13:30:00'),
(14, 17, 'Laptop hãng gì vậy bạn?', '2024-03-06 14:45:00'),
(15, 18, 'Thanks for sharing! 🎶', '2024-03-06 15:30:00'),
(16, 19, 'Mình cũng đang muốn trồng cây, hay quá!', '2024-03-06 16:30:00'),
(17, 20, 'Kinh nghiệm quý báu, cảm ơn nhiều!', '2024-03-07 09:00:00'),
(18, 1, 'Mình thích phở và bún chả! 😋', '2024-03-07 10:00:00'),
(19, 22, 'Mình cũng mới bắt đầu tập, cùng nhau phấn đấu!', '2024-03-07 11:30:00'),
(20, 23, 'Đi xem phim đi bạn!', '2024-03-07 12:45:00'),
(21, 24, 'Python rất thú vị phải không?', '2024-03-07 14:00:00'),
(22, 25, 'Thái Lan đẹp lắm, mình cũng định đi', '2024-03-07 15:20:00'),
(23, 26, 'Mình chơi cầu lông được, hẹn nhé!', '2024-03-07 16:40:00'),
(24, 27, 'Tên quán gì vậy bạn? Share địa chỉ với', '2024-03-08 08:50:00'),
(25, 28, 'Happy birthday! Chúc bạn tuổi mới nhiều niềm vui! 🎉', '2024-03-08 10:00:00'),
(25, 29, 'Chúc mừng sinh nhật nhé!', '2024-03-08 10:15:00'),
(26, 30, 'Tips hay quá, mình sẽ thử ngay!', '2024-03-08 11:20:00'),
(27, 31, 'Mình đang nuôi 2 chú mèo, có gì hỏi nhé!', '2024-03-08 12:35:00'),
(28, 32, 'Concert nào vậy bạn? Vui không?', '2024-03-08 13:50:00'),
(29, 33, 'Mình cũng da khô, thanks for tips!', '2024-03-08 15:05:00'),
(30, 34, 'Học lái xe cẩn thận nhé, chúc may mắn!', '2024-03-08 16:20:00'),
(31, 35, 'Khóa học ở đâu vậy bạn?', '2024-03-08 17:30:00'),
(32, 36, 'Mưa to thật, ở nhà nghỉ ngơi thôi', '2024-03-09 08:45:00'),
(33, 37, 'Mình cũng đang học IELTS, kết bạn nhé!', '2024-03-09 10:00:00'),
(34, 38, 'Con mình thích slime lắm, cảm ơn bạn!', '2024-03-09 11:15:00'),
(35, 39, 'Mua nhà giờ khó quá, giá cao lắm', '2024-03-09 12:30:00'),
(36, 40, 'Chúc mừng bạn! Thành tích tuyệt vời!', '2024-03-09 13:45:00'),
(37, 41, 'Tips hay, nhà mình điện tốn lắm', '2024-03-09 15:00:00'),
(38, 42, 'Tùy vào sở thích của bạn ấy bạn nhé', '2024-03-09 16:15:00'),
(39, 43, 'Sa Pa đẹp nhất là tháng 9-10 nhé', '2024-03-09 17:30:00'),
(40, 44, 'Đầu tư cẩn thận, học nhiều trước khi bỏ tiền', '2024-03-10 08:40:00'),
(41, 45, 'Sản phẩm gì vậy? Mình cũng muốn thử', '2024-03-10 09:55:00'),
(42, 46, 'Chúc cả nhà tuần mới năng lượng!', '2024-03-10 11:10:00'),
(43, 47, 'Phở bò nhà làm ngon nhất! Cảm ơn công thức', '2024-03-10 12:25:00'),
(44, 48, 'Mình thường nghe nhạc để thư giãn', '2024-03-10 13:40:00'),
(45, 49, 'Triển lãm ở đâu vậy bạn?', '2024-03-10 14:55:00'),
(46, 50, 'Chung cư khu nào bạn đang tìm?', '2024-03-10 16:10:00'),
(47, 1, 'Playlist hay, mình đang cần để học!', '2024-03-10 17:25:00');

-- Thêm 50 friendships
INSERT INTO friends (user_id, friend_id, status) VALUES
(1, 2, 'accepted'),
(1, 3, 'accepted'),
(2, 3, 'accepted'),
(2, 4, 'pending'),
(3, 5, 'accepted'),
(4, 5, 'accepted'),
(4, 6, 'accepted'),
(5, 7, 'accepted'),
(6, 7, 'pending'),
(6, 8, 'accepted'),
(7, 9, 'accepted'),
(8, 9, 'accepted'),
(8, 10, 'accepted'),
(9, 11, 'pending'),
(10, 11, 'accepted'),
(11, 12, 'accepted'),
(12, 13, 'accepted'),
(13, 14, 'accepted'),
(14, 15, 'pending'),
(15, 16, 'accepted'),
(16, 17, 'accepted'),
(17, 18, 'accepted'),
(18, 19, 'pending'),
(19, 20, 'accepted'),
(20, 21, 'accepted'),
(21, 22, 'accepted'),
(22, 23, 'accepted'),
(23, 24, 'pending'),
(24, 25, 'accepted'),
(25, 26, 'accepted'),
(26, 27, 'accepted'),
(27, 28, 'accepted'),
(28, 29, 'pending'),
(29, 30, 'accepted'),
(30, 31, 'accepted'),
(31, 32, 'accepted'),
(32, 33, 'accepted'),
(33, 34, 'pending'),
(34, 35, 'accepted'),
(35, 36, 'accepted'),
(36, 37, 'accepted'),
(37, 38, 'pending'),
(38, 39, 'accepted'),
(39, 40, 'accepted'),
(40, 41, 'accepted'),
(41, 42, 'accepted'),
(42, 43, 'pending'),
(43, 44, 'accepted'),
(44, 45, 'accepted'),
(45, 46, 'accepted');

-- Thêm 50 likes
INSERT INTO likes (post_id, user_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(7, 12),
(8, 13),
(8, 14),
(9, 15),
(10, 16),
(11, 17),
(12, 18),
(13, 19),
(14, 20),
(15, 21),
(16, 22),
(17, 23),
(18, 24),
(19, 25),
(20, 26),
(21, 27),
(22, 28),
(23, 29),
(24, 30),
(25, 31),
(25, 32),
(26, 33),
(27, 34),
(28, 35),
(29, 36),
(30, 37),
(31, 38),
(32, 39),
(33, 40),
(34, 41),
(35, 42),
(36, 43),
(37, 44),
(38, 45),
(39, 46),
(40, 47),
(41, 48),
(42, 49),
(43, 50);





-- Bài 1. Quản lý người dùng
select * from users;


-- Bài 2. Hiển thị thông tin công khai bằng VIEW

create view vw_public_users  as
select user_id, username, created_at from users;

select * from  vw_public_users ;

-- lợi ích là bảo mật được thông tin quan trọng như password giúp người dùng tránh lộ thông tin quan trọng và tái sử dụng

-- Bài 3. Tối ưu tìm kiếm người dùng bằng INDEX


create index idx_username on users(username);

explain analyze
select * from users;

-- trước khi tạo index :'-> Table scan on users  (cost=5.25 rows=50) (actual time=0.0469..0.106 rows=50 loops=1)\n'

-- sau khi tạo index : '-> Table scan on users  (cost=5.25 rows=50) (actual time=0.0411..0.0691 rows=50 loops=1)\n'



-- 2. Mức độ khá

-- Bài 4. Quản lý bài viết bằng Stored Procedure


delimiter //
create procedure sp_create_post ( IN p_user_id int , IN p_content text,  OUT error_mess VARCHAR(255))
	begin
    
    if not exists (select * from users where user_id = p_user_id) then
		set error_mess = 'user không tồn tại';
	else  
        INSERT INTO posts (user_id, content, created_at) VALUES
			(p_user_id, p_content, '2025-11-05 08:00:00');
        end if;
      end //
delimiter ;

set @err = '';
call  sp_create_post ( 1 , 'học sql thật là ngon luôn , hơn cả HDPE ', @err);
select @err;
select * from posts;

-- Bài 5. Hiển thị News Feed bằng VIEW xuất hiện trong 7 bài gần nhất

create view vw_recent_posts  as
select user_id, content, created_at from posts
where created_at >= SUBDATE(now(),7);

select * from  vw_recent_posts;

INSERT INTO posts (user_id, content, created_at) VALUES
(1, 'Hôm nay thật là một ngày tuyệt vời đẹp quá! ☀️', '2025-01-12 08:00:00');
-- Bài 6. Tối ưu truy vấn bài viết

create index user_createtime on users(user_id,created_at);

select * from users where user_id = 1 order by created_at desc;

-- khóa tổng hợp Composite  tạo nên giúp việc tránh trùng lặp dữ liệu khi 1 người dùng thì thời gian tạo bài viết và id chỉ xuất hiện giống nhau cùng một lần


-- Bài 7. Thống kê hoạt động bằng Stored Procedure 

delimiter //
create procedure sp_count_posts(IN p_user_id int,OUT p_total int )
	begin
    select count(post_id) into p_total from posts where user_id = p_user_id;
    end //
delimiter ;

set @total = 0;
call sp_count_posts(1,@total);
select @total as `Số lượng bài viết`;


-- 3. Mức độ giỏi
-- Mục tiêu: Làm chủ Procedure nâng cao + Logic + WITH CHECK OPTION


-- Bài 8. Kiểm soát dữ liệu bằng View WITH CHECK OPTION
create view vw_active_users as
select u.user_id, u.username, u.created_at from users u
join posts p ON u.user_id = p.user_id
with check option
;


-- Bài 9. Quản lý kết bạn bằng Stored Procedure

delimiter //
create procedure sp_add_friend( 
    IN p_user_id INT,
    IN p_friend_id INT)
	begin
    if  p_user_id = p_friend_id then
        SIGNAL SQLSTATE '45000'
		set MESSAGE_TEXT  = 'không thể tự kết bạn';
	else  
        INSERT INTO friends (user_id, friend_id, status) VALUES
			(p_user_id, p_friend_id, 'pending');
        end if; 
    end //
delimiter ;


call sp_add_friend(1,20);


-- Bài 10. Gợi ý bạn bè bằng Procedure nâng cao

delimiter //
create procedure sp_suggest_friends( 
    IN p_user_id int,
    INOUT p_limit int)
	begin
    select friend_id from friends where user_id = p_user_id limit p_limit;
    end //
delimiter ;   
    
set @limit = 5;
call sp_suggest_friends(1,@limit);
    
    
-- Bài 11. Thống kê tương tác nâng cao

select p.post_id , p.content, count(l.post_id) as solike
from posts p
inner join likes l on l.post_id = p.post_id
group by post_id
order by solike desc limit 5;
 
 -- BÀI 12. QUẢN LÝ BÌNH LUẬN
 

delimiter //
create procedure sp_add_comment( 
    IN p_user_id int,
	IN p_post_id int,
	IN p_content text)
	begin
    DECLARE user_count INT DEFAULT 0;
    DECLARE post_count INT DEFAULT 0;
    
   select count(*) into user_count from users
   where user_id = p_user_id;
   
    if user_count = 0 then
        SIGNAL SQLSTATE '45000'
		set MESSAGE_TEXT  = 'không tìm thấy user';
      end if;   
      
	select count(*) into post_count from posts
     where post_id = p_post_id;
     
	if  post_count = 0 then
        SIGNAL SQLSTATE '45000'
		set MESSAGE_TEXT  = 'không tìm thấy bài post';
	 end if; 
     
     
       insert into Comments(user_id, post_id, content)
        values (p_user_id, p_post_id, p_content);
        
    end //
delimiter ;   

CALL sp_add_comment(1,1,'bai post này hay quá');
    
create view vw_post_comments AS
select c.content, u.username, c.created_at
from Comments c
join users u ON c.user_id = u.user_id;

select *
from vw_post_comments;


-- BÀI 13. QUẢN LÝ LƯỢT THÍCH

delimiter //
create procedure sp_like_post( 
    IN p_user_id int,
	IN p_post_id int
	)
	begin
    DECLARE user_count INT DEFAULT 0;
    
   
   
    if (select 1 from likes
       where user_id = p_user_id and post_id = p_post_id) 
       then
        SIGNAL SQLSTATE '45000'
		set MESSAGE_TEXT  = 'Đã thích bài viết này';
	else 
		 insert into Likes(user_id, post_id)
        values (p_user_id, p_post_id);
      end if;   
    end //
delimiter ;   


CALL sp_like_post(6,2);

create view vw_post_likes as
select post_id , count(*) total_like
from likes
group by post_id;

select *
from vw_post_likes;


-- Bài 14. TÌM KIẾM NGƯỜI DÙNG & BÀI VIẾT

delimiter //
create procedure sp_search_social( 
     IN p_option INT,
    IN p_keyword VARCHAR(100))
	begin
   
    if p_option = 1 then
        select * from users where username like concat('%', p_keyword, '%');
    
	elseif  p_option = 2 then
       select * from posts where content like concat('%', p_keyword, '%');
	else
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Option không hợp lệ';
	 end if; 
    end //
delimiter ;

CALL sp_search_social(1, 'an');
CALL sp_search_social(2, 'database');


