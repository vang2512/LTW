
<!--JS Header & Footer-->
document.addEventListener('DOMContentLoaded', () => {
    const cache = new Map();
    async function loadContent() {
        const elements = document.querySelectorAll('[data-include]');
        for (const el of elements) {
            const file = el.getAttribute('data-include');
            if (file) {
                if (cache.has(file)) {
                    el.innerHTML = cache.get(file);
                } else {
                    const response = await fetch(file);
                    if (response.ok) {
                        const text = await response.text();
                        cache.set(file, text);
                        el.innerHTML = text;
                    } else {
                        el.innerHTML = "Không thể tải nội dung.";
                    }
                }
            }
        }
    }
    loadContent();
});
function showEditForm(id, soLuong, ngayDat, gioDat, gioTra, khongGian) {
    const form = document.getElementById('edit-form');
    const overlay = document.getElementById('overlay');
    // Hiển thị form và overlay
    form.classList.add('show'); // Thêm lớp show để hiển thị form
    overlay.style.display = 'block'; // Hiển thị lớp overlay
    document.getElementById('edit-id').value = id;
    document.getElementById('edit-soLuong').value = soLuong;
    document.getElementById('edit-ngayDat').value = ngayDat;
    document.getElementById('edit-gioDat').value = gioDat;
    document.getElementById('edit-gioTra').value = gioTra;
    document.getElementById('edit-khongGian').value = khongGian;
}

function hideEditForm() {
    const form = document.getElementById('edit-form');
    const overlay = document.getElementById('overlay');
    // Ẩn form và overlay
    form.classList.remove('show'); // Loại bỏ lớp show để ẩn form
    overlay.style.display = 'none'; // Ẩn lớp overlay
}



