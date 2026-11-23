# Zalolite cho Homebrew

Cài [Zalolite](https://github.com/lebad280324/zalolite) bằng Homebrew:

```sh
brew install --cask lebad280324/zalolite/zalolite
```

Lệnh trên tự thêm tap `lebad280324/zalolite`. Homebrew tải đúng bản cho máy của bạn: bản thường cho macOS 14 trở lên, bản riêng cho macOS 13.

Cập nhật lên bản mới:

```sh
brew upgrade --cask zalolite
```

Gỡ ứng dụng:

```sh
brew uninstall --cask zalolite
```

`brew uninstall --zap --cask zalolite` xóa luôn dữ liệu Zalolite trên máy, gồm phiên đăng nhập và tin nhắn đã lưu.

## Cập nhật tự động

Cứ 3 giờ, GitHub Actions kiểm tra bản phát hành mới nhất của Zalolite. Khi có bản mới, workflow đổi phiên bản và mã SHA-256 trong cask theo `SHA256SUMS.txt` của bản phát hành, thử cài trên macOS rồi commit. Có thể chạy tay workflow **Update cask** để cập nhật ngay.

Zalolite được ký ad-hoc, chưa được Apple notarize. Nếu macOS chặn lần mở đầu, vào **System Settings → Privacy & Security** rồi bấm **Open Anyway**. Chỉ cần làm một lần.

Zalolite vẫn có trình cập nhật riêng trong **Cài đặt → Cập nhật phần mềm**. Dùng cách nào cũng được.
